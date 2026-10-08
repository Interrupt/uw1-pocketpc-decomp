@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x0) = (char)V;
- *(char *)((char *)puVar9 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x0) = (char)V;
- *(byte *)((char *)puVar9 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x0) = (byte)V;
- *(char *)((char *)puVar9 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x0) = (byte)V;
- *(byte *)((char *)puVar9 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(ushort *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- ((ushort *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(ushort *)((ushort *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(ushort *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
)
...>
}


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(undefined2 *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- ((undefined2 *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(undefined2 *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
|
- *(short *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
|
- ((short *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
|
- *(short *)((short *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
|
- *(short *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(byte *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- ((byte *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(byte *)((ushort *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (byte)((ushort *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(byte *)puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(byte *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(undefined1 *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- ((undefined1 *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (undefined1)((ushort *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(undefined1 *)puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(undefined1 *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &*(char *)((byte *)puVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &((char *)puVar9)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &*(char *)((ushort *)puVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &*(char *)puVar9
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &*(char *)(puVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- ((char *)puVar9)[0x0] = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- *(char *)puVar9 = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- *(char *)(puVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x0)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(char *)((byte *)puVar9 + 0x0)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- ((char *)puVar9)[0x0]
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(char *)((ushort *)puVar9 + 0x0)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (char)((ushort *)puVar9)[0x0]
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(char *)puVar9
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(char *)(puVar9 + 0x0)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(byte *)((byte *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- ((byte *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(byte *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(undefined1 *)((byte *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- ((undefined1 *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(undefined1 *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
)
...>
}


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_high
|
- &*(char *)((byte *)puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_high
|
- &((char *)puVar9)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_high
|
- &*(char *)(puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)E;
|
- ((char *)puVar9)[0x1] = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)E;
|
- *(char *)(puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(char *)((byte *)puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_high
|
- ((char *)puVar9)[0x1]
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(char *)(puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_high
)
...>
}


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x2) = (char)V;
- *(char *)((char *)puVar9 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x2) = (char)V;
- *(byte *)((char *)puVar9 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x2) = (byte)V;
- *(char *)((char *)puVar9 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x2) = (byte)V;
- *(byte *)((char *)puVar9 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(ushort *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- ((ushort *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(ushort *)((ushort *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(ushort *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
)
...>
}


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(undefined2 *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- ((undefined2 *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(undefined2 *)((undefined2 *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(undefined2 *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
)
...>
}


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
|
- *(short *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
|
- ((short *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
|
- *(short *)((short *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
|
- *(short *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
)
...>
}


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(byte *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- ((byte *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(byte *)((ushort *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- (byte)((ushort *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(byte *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(undefined1 *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- ((undefined1 *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(undefined1 *)((ushort *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- (undefined1)((ushort *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(undefined1 *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
|
- &*(char *)((byte *)puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
|
- &((char *)puVar9)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
|
- &*(char *)((ushort *)puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
|
- &*(char *)(puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
|
- ((char *)puVar9)[0x2] = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
|
- *(char *)(puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(char *)((byte *)puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- ((char *)puVar9)[0x2]
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(char *)((ushort *)puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- (char)((ushort *)puVar9)[0x1]
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(char *)(puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(byte *)((byte *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- ((byte *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(byte *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->position_word_high
)
...>
}


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(undefined1 *)((byte *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- ((undefined1 *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(undefined1 *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->position_word_high
)
...>
}


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_high
|
- &*(char *)((byte *)puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_high
|
- &((char *)puVar9)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_high
|
- &*(char *)(puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_high
)
...>
}


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_high = (byte)E;
|
- ((char *)puVar9)[0x3] = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_high = (byte)E;
|
- *(char *)(puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(char *)((byte *)puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_high
|
- ((char *)puVar9)[0x3]
+ (char)((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(char *)(puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_high
)
...>
}


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x4) = (char)V;
- *(char *)((char *)puVar9 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x4) = (char)V;
- *(byte *)((char *)puVar9 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x4) = (byte)V;
- *(char *)((char *)puVar9 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x4) = (byte)V;
- *(byte *)((char *)puVar9 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(ushort *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- ((ushort *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(ushort *)((ushort *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(ushort *)(puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
)
...>
}


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(undefined2 *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- ((undefined2 *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(undefined2 *)(puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
)
...>
}


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
|
- *(short *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
|
- ((short *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
|
- *(short *)((short *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
|
- *(short *)(puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
)
...>
}


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(byte *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- ((byte *)puVar9)[0x4]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(byte *)((ushort *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (byte)((ushort *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(byte *)(puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- puVar9[0x4]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(undefined1 *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- ((undefined1 *)puVar9)[0x4]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (undefined1)((ushort *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(undefined1 *)(puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- puVar9[0x4]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
|
- &*(char *)((byte *)puVar9 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
|
- &((char *)puVar9)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
|
- &*(char *)((ushort *)puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
|
- &*(char *)(puVar9 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
|
- ((char *)puVar9)[0x4] = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
|
- *(char *)(puVar9 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x4)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(char *)((byte *)puVar9 + 0x4)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- ((char *)puVar9)[0x4]
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(char *)((ushort *)puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (char)((ushort *)puVar9)[0x2]
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(char *)(puVar9 + 0x4)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(byte *)((byte *)puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- ((byte *)puVar9)[0x5]
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(byte *)(puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- puVar9[0x5]
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
)
...>
}


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(undefined1 *)((byte *)puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- ((undefined1 *)puVar9)[0x5]
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(undefined1 *)(puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- puVar9[0x5]
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
)
...>
}


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_high
|
- &*(char *)((byte *)puVar9 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_high
|
- &((char *)puVar9)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_high
|
- &*(char *)(puVar9 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_high
)
...>
}


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)E;
|
- ((char *)puVar9)[0x5] = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)E;
|
- *(char *)(puVar9 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x5)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(char *)((byte *)puVar9 + 0x5)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_high
|
- ((char *)puVar9)[0x5]
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(char *)(puVar9 + 0x5)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_high
)
...>
}


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x6) = (char)V;
- *(char *)((char *)puVar9 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x6) = (char)V;
- *(byte *)((char *)puVar9 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x6) = (byte)V;
- *(char *)((char *)puVar9 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x6) = (byte)V;
- *(byte *)((char *)puVar9 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(ushort *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- ((ushort *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(ushort *)((ushort *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(ushort *)(puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
)
...>
}


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(undefined2 *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- ((undefined2 *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(undefined2 *)((undefined2 *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(undefined2 *)(puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
)
...>
}


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
|
- *(short *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
|
- ((short *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
|
- *(short *)((short *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
|
- *(short *)(puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
)
...>
}


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(byte *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- ((byte *)puVar9)[0x6]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(byte *)((ushort *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- (byte)((ushort *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(byte *)(puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- puVar9[0x6]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(undefined1 *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- ((undefined1 *)puVar9)[0x6]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(undefined1 *)((ushort *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- (undefined1)((ushort *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(undefined1 *)(puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- puVar9[0x6]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
|
- &*(char *)((byte *)puVar9 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
|
- &((char *)puVar9)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
|
- &*(char *)((ushort *)puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
|
- &*(char *)(puVar9 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
|
- ((char *)puVar9)[0x6] = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
|
- *(char *)(puVar9 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x6)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(char *)((byte *)puVar9 + 0x6)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- ((char *)puVar9)[0x6]
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(char *)((ushort *)puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- (char)((ushort *)puVar9)[0x3]
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(char *)(puVar9 + 0x6)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(byte *)((byte *)puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- ((byte *)puVar9)[0x7]
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(byte *)(puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- puVar9[0x7]
+ ((uw_object_hdr_t *)puVar9)->link_word_high
)
...>
}


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(undefined1 *)((byte *)puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- ((undefined1 *)puVar9)[0x7]
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(undefined1 *)(puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- puVar9[0x7]
+ ((uw_object_hdr_t *)puVar9)->link_word_high
)
...>
}


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_high
|
- &*(char *)((byte *)puVar9 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_high
|
- &((char *)puVar9)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_high
|
- &*(char *)(puVar9 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_high
)
...>
}


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_high = (byte)E;
|
- ((char *)puVar9)[0x7] = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_high = (byte)E;
|
- *(char *)(puVar9 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x7)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(char *)((byte *)puVar9 + 0x7)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_high
|
- ((char *)puVar9)[0x7]
+ (char)((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(char *)(puVar9 + 0x7)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar10 + 0x0) = (char)V;
- *(char *)((char *)puVar10 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar10 + 0x0) = (char)V;
- *(byte *)((char *)puVar10 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar10 + 0x0) = (byte)V;
- *(char *)((char *)puVar10 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar10 + 0x0) = (byte)V;
- *(byte *)((char *)puVar10 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- *(ushort *)((byte *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- ((ushort *)puVar10)[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- *(ushort *)((ushort *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- *(ushort *)(puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
)
...>
}


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- *(undefined2 *)((byte *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- ((undefined2 *)puVar10)[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- *(undefined2 *)(puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_signed
|
- *(short *)((byte *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_signed
|
- ((short *)puVar10)[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags_signed
|
- *(short *)((short *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_signed
|
- *(short *)(puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(byte *)((byte *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- ((byte *)puVar10)[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(byte *)((ushort *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- (byte)((ushort *)puVar10)[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(byte *)puVar10
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(byte *)(puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- puVar10[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *puVar10
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(undefined1 *)((byte *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- ((undefined1 *)puVar10)[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- (undefined1)((ushort *)puVar10)[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(undefined1 *)puVar10
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(undefined1 *)(puVar10 + 0x0)
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- puVar10[0x0]
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *puVar10
+ ((uw_object_hdr_t *)puVar10)->type_flags_low
)
...>
}


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar10 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_low
|
- &*(char *)((byte *)puVar10 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_low
|
- &((char *)puVar10)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_low
|
- &*(char *)((ushort *)puVar10 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_low
|
- &*(char *)puVar10
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_low
|
- &*(char *)(puVar10 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar10 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_low = (byte)E;
|
- ((char *)puVar10)[0x0] = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar10 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_low = (byte)E;
|
- *(char *)puVar10 = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_low = (byte)E;
|
- *(char *)(puVar10 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x0)
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(char *)((byte *)puVar10 + 0x0)
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_low
|
- ((char *)puVar10)[0x0]
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(char *)((ushort *)puVar10 + 0x0)
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_low
|
- (char)((ushort *)puVar10)[0x0]
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(char *)puVar10
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_low
|
- *(char *)(puVar10 + 0x0)
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
|
- *(byte *)((byte *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
|
- ((byte *)puVar10)[0x1]
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
|
- *(byte *)(puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
|
- puVar10[0x1]
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
)
...>
}


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
|
- *(undefined1 *)((byte *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
|
- ((undefined1 *)puVar10)[0x1]
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
|
- *(undefined1 *)(puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
|
- puVar10[0x1]
+ ((uw_object_hdr_t *)puVar10)->type_flags_high
)
...>
}


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar10 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_high
|
- &*(char *)((byte *)puVar10 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_high
|
- &((char *)puVar10)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_high
|
- &*(char *)(puVar10 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar10)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar10 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_high = (byte)E;
|
- ((char *)puVar10)[0x1] = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_high = (byte)E;
|
- *(char *)(puVar10 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar10)->type_flags_high = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x1)
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_high
|
- *(char *)((byte *)puVar10 + 0x1)
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_high
|
- ((char *)puVar10)[0x1]
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_high
|
- *(char *)(puVar10 + 0x1)
+ (char)((uw_object_hdr_t *)puVar10)->type_flags_high
)
...>
}


@receiver_2_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar10 + 0x2) = (char)V;
- *(char *)((char *)puVar10 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar10 + 0x2) = (char)V;
- *(byte *)((char *)puVar10 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar10 + 0x2) = (byte)V;
- *(char *)((char *)puVar10 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar10 + 0x2) = (byte)V;
- *(byte *)((char *)puVar10 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- *(ushort *)((byte *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- ((ushort *)puVar10)[0x1]
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- *(ushort *)((ushort *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- *(ushort *)(puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word
)
...>
}


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- *(undefined2 *)((byte *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- ((undefined2 *)puVar10)[0x1]
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- *(undefined2 *)((undefined2 *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- *(undefined2 *)(puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word
)
...>
}


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_signed
|
- *(short *)((byte *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_signed
|
- ((short *)puVar10)[0x1]
+ ((uw_object_hdr_t *)puVar10)->position_word_signed
|
- *(short *)((short *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->position_word_signed
|
- *(short *)(puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_signed
)
...>
}


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(byte *)((byte *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- ((byte *)puVar10)[0x2]
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(byte *)((ushort *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- (byte)((ushort *)puVar10)[0x1]
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(byte *)(puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- puVar10[0x2]
+ ((uw_object_hdr_t *)puVar10)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(undefined1 *)((byte *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- ((undefined1 *)puVar10)[0x2]
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(undefined1 *)((ushort *)puVar10 + 0x1)
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- (undefined1)((ushort *)puVar10)[0x1]
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(undefined1 *)(puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->position_word_low
|
- puVar10[0x2]
+ ((uw_object_hdr_t *)puVar10)->position_word_low
)
...>
}


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar10 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_low
|
- &*(char *)((byte *)puVar10 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_low
|
- &((char *)puVar10)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_low
|
- &*(char *)((ushort *)puVar10 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_low
|
- &*(char *)(puVar10 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_low
)
...>
}


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar10 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_low = (byte)E;
|
- ((char *)puVar10)[0x2] = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar10 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_low = (byte)E;
|
- *(char *)(puVar10 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x2)
+ (char)((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(char *)((byte *)puVar10 + 0x2)
+ (char)((uw_object_hdr_t *)puVar10)->position_word_low
|
- ((char *)puVar10)[0x2]
+ (char)((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(char *)((ushort *)puVar10 + 0x1)
+ (char)((uw_object_hdr_t *)puVar10)->position_word_low
|
- (char)((ushort *)puVar10)[0x1]
+ (char)((uw_object_hdr_t *)puVar10)->position_word_low
|
- *(char *)(puVar10 + 0x2)
+ (char)((uw_object_hdr_t *)puVar10)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->position_word_high
|
- *(byte *)((byte *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->position_word_high
|
- ((byte *)puVar10)[0x3]
+ ((uw_object_hdr_t *)puVar10)->position_word_high
|
- *(byte *)(puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->position_word_high
|
- puVar10[0x3]
+ ((uw_object_hdr_t *)puVar10)->position_word_high
)
...>
}


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->position_word_high
|
- *(undefined1 *)((byte *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->position_word_high
|
- ((undefined1 *)puVar10)[0x3]
+ ((uw_object_hdr_t *)puVar10)->position_word_high
|
- *(undefined1 *)(puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->position_word_high
|
- puVar10[0x3]
+ ((uw_object_hdr_t *)puVar10)->position_word_high
)
...>
}


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar10 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_high
|
- &*(char *)((byte *)puVar10 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_high
|
- &((char *)puVar10)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_high
|
- &*(char *)(puVar10 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar10)->position_word_high
)
...>
}


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar10 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_high = (byte)E;
|
- ((char *)puVar10)[0x3] = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_high = (byte)E;
|
- *(char *)(puVar10 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar10)->position_word_high = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x3)
+ (char)((uw_object_hdr_t *)puVar10)->position_word_high
|
- *(char *)((byte *)puVar10 + 0x3)
+ (char)((uw_object_hdr_t *)puVar10)->position_word_high
|
- ((char *)puVar10)[0x3]
+ (char)((uw_object_hdr_t *)puVar10)->position_word_high
|
- *(char *)(puVar10 + 0x3)
+ (char)((uw_object_hdr_t *)puVar10)->position_word_high
)
...>
}


@receiver_2_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar10 + 0x4) = (char)V;
- *(char *)((char *)puVar10 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar10 + 0x4) = (char)V;
- *(byte *)((char *)puVar10 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar10 + 0x4) = (byte)V;
- *(char *)((char *)puVar10 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar10 + 0x4) = (byte)V;
- *(byte *)((char *)puVar10 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- *(ushort *)((byte *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- ((ushort *)puVar10)[0x2]
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- *(ushort *)((ushort *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- *(ushort *)(puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word
)
...>
}


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- *(undefined2 *)((byte *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- ((undefined2 *)puVar10)[0x2]
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- *(undefined2 *)(puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word
)
...>
}


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_signed
|
- *(short *)((byte *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_signed
|
- ((short *)puVar10)[0x2]
+ ((uw_object_hdr_t *)puVar10)->chain_word_signed
|
- *(short *)((short *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->chain_word_signed
|
- *(short *)(puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_signed
)
...>
}


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(byte *)((byte *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- ((byte *)puVar10)[0x4]
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(byte *)((ushort *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- (byte)((ushort *)puVar10)[0x2]
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(byte *)(puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- puVar10[0x4]
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(undefined1 *)((byte *)puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- ((undefined1 *)puVar10)[0x4]
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar10 + 0x2)
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- (undefined1)((ushort *)puVar10)[0x2]
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(undefined1 *)(puVar10 + 0x4)
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
|
- puVar10[0x4]
+ ((uw_object_hdr_t *)puVar10)->chain_word_low
)
...>
}


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar10 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_low
|
- &*(char *)((byte *)puVar10 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_low
|
- &((char *)puVar10)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_low
|
- &*(char *)((ushort *)puVar10 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_low
|
- &*(char *)(puVar10 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_low
)
...>
}


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar10 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_low = (byte)E;
|
- ((char *)puVar10)[0x4] = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar10 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_low = (byte)E;
|
- *(char *)(puVar10 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x4)
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(char *)((byte *)puVar10 + 0x4)
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_low
|
- ((char *)puVar10)[0x4]
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(char *)((ushort *)puVar10 + 0x2)
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_low
|
- (char)((ushort *)puVar10)[0x2]
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_low
|
- *(char *)(puVar10 + 0x4)
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar10 + 0x5)
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
|
- *(byte *)((byte *)puVar10 + 0x5)
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
|
- ((byte *)puVar10)[0x5]
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
|
- *(byte *)(puVar10 + 0x5)
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
|
- puVar10[0x5]
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
)
...>
}


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar10 + 0x5)
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
|
- *(undefined1 *)((byte *)puVar10 + 0x5)
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
|
- ((undefined1 *)puVar10)[0x5]
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
|
- *(undefined1 *)(puVar10 + 0x5)
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
|
- puVar10[0x5]
+ ((uw_object_hdr_t *)puVar10)->chain_word_high
)
...>
}


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar10 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_high
|
- &*(char *)((byte *)puVar10 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_high
|
- &((char *)puVar10)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_high
|
- &*(char *)(puVar10 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar10)->chain_word_high
)
...>
}


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar10 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_high = (byte)E;
|
- ((char *)puVar10)[0x5] = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_high = (byte)E;
|
- *(char *)(puVar10 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar10)->chain_word_high = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x5)
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_high
|
- *(char *)((byte *)puVar10 + 0x5)
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_high
|
- ((char *)puVar10)[0x5]
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_high
|
- *(char *)(puVar10 + 0x5)
+ (char)((uw_object_hdr_t *)puVar10)->chain_word_high
)
...>
}


@receiver_2_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar10 + 0x6) = (char)V;
- *(char *)((char *)puVar10 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar10 + 0x6) = (char)V;
- *(byte *)((char *)puVar10 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar10 + 0x6) = (byte)V;
- *(char *)((char *)puVar10 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar10 + 0x6) = (byte)V;
- *(byte *)((char *)puVar10 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar10)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- *(ushort *)((byte *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- ((ushort *)puVar10)[0x3]
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- *(ushort *)((ushort *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- *(ushort *)(puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word
)
...>
}


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- *(undefined2 *)((byte *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- ((undefined2 *)puVar10)[0x3]
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- *(undefined2 *)((undefined2 *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- *(undefined2 *)(puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word
)
...>
}


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_signed
|
- *(short *)((byte *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_signed
|
- ((short *)puVar10)[0x3]
+ ((uw_object_hdr_t *)puVar10)->link_word_signed
|
- *(short *)((short *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->link_word_signed
|
- *(short *)(puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_signed
)
...>
}


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(byte *)((byte *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- ((byte *)puVar10)[0x6]
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(byte *)((ushort *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- (byte)((ushort *)puVar10)[0x3]
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(byte *)(puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- puVar10[0x6]
+ ((uw_object_hdr_t *)puVar10)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(undefined1 *)((byte *)puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- ((undefined1 *)puVar10)[0x6]
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(undefined1 *)((ushort *)puVar10 + 0x3)
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- (undefined1)((ushort *)puVar10)[0x3]
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(undefined1 *)(puVar10 + 0x6)
+ ((uw_object_hdr_t *)puVar10)->link_word_low
|
- puVar10[0x6]
+ ((uw_object_hdr_t *)puVar10)->link_word_low
)
...>
}


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar10 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_low
|
- &*(char *)((byte *)puVar10 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_low
|
- &((char *)puVar10)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_low
|
- &*(char *)((ushort *)puVar10 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_low
|
- &*(char *)(puVar10 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_low
)
...>
}


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar10 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_low = (byte)E;
|
- ((char *)puVar10)[0x6] = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar10 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_low = (byte)E;
|
- *(char *)(puVar10 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x6)
+ (char)((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(char *)((byte *)puVar10 + 0x6)
+ (char)((uw_object_hdr_t *)puVar10)->link_word_low
|
- ((char *)puVar10)[0x6]
+ (char)((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(char *)((ushort *)puVar10 + 0x3)
+ (char)((uw_object_hdr_t *)puVar10)->link_word_low
|
- (char)((ushort *)puVar10)[0x3]
+ (char)((uw_object_hdr_t *)puVar10)->link_word_low
|
- *(char *)(puVar10 + 0x6)
+ (char)((uw_object_hdr_t *)puVar10)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar10 + 0x7)
+ ((uw_object_hdr_t *)puVar10)->link_word_high
|
- *(byte *)((byte *)puVar10 + 0x7)
+ ((uw_object_hdr_t *)puVar10)->link_word_high
|
- ((byte *)puVar10)[0x7]
+ ((uw_object_hdr_t *)puVar10)->link_word_high
|
- *(byte *)(puVar10 + 0x7)
+ ((uw_object_hdr_t *)puVar10)->link_word_high
|
- puVar10[0x7]
+ ((uw_object_hdr_t *)puVar10)->link_word_high
)
...>
}


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar10 + 0x7)
+ ((uw_object_hdr_t *)puVar10)->link_word_high
|
- *(undefined1 *)((byte *)puVar10 + 0x7)
+ ((uw_object_hdr_t *)puVar10)->link_word_high
|
- ((undefined1 *)puVar10)[0x7]
+ ((uw_object_hdr_t *)puVar10)->link_word_high
|
- *(undefined1 *)(puVar10 + 0x7)
+ ((uw_object_hdr_t *)puVar10)->link_word_high
|
- puVar10[0x7]
+ ((uw_object_hdr_t *)puVar10)->link_word_high
)
...>
}


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar10 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_high
|
- &*(char *)((byte *)puVar10 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_high
|
- &((char *)puVar10)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_high
|
- &*(char *)(puVar10 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar10)->link_word_high
)
...>
}


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar10 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_high = (byte)E;
|
- ((char *)puVar10)[0x7] = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_high = (byte)E;
|
- *(char *)(puVar10 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar10)->link_word_high = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar10 + 0x7)
+ (char)((uw_object_hdr_t *)puVar10)->link_word_high
|
- *(char *)((byte *)puVar10 + 0x7)
+ (char)((uw_object_hdr_t *)puVar10)->link_word_high
|
- ((char *)puVar10)[0x7]
+ (char)((uw_object_hdr_t *)puVar10)->link_word_high
|
- *(char *)(puVar10 + 0x7)
+ (char)((uw_object_hdr_t *)puVar10)->link_word_high
)
...>
}


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p1 + 0x0) = (char)V;
- *(char *)((char *)_case8_p1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p1 + 0x0) = (char)V;
- *(byte *)((char *)_case8_p1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p1 + 0x0) = (byte)V;
- *(char *)((char *)_case8_p1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p1 + 0x0) = (byte)V;
- *(byte *)((char *)_case8_p1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *(ushort *)((byte *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- ((ushort *)_case8_p1)[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *(ushort *)((ushort *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *(ushort *)(_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- _case8_p1[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *_case8_p1
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
)
...>
}


@receiver_3_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *(undefined2 *)((byte *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- ((undefined2 *)_case8_p1)[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *(undefined2 *)((undefined2 *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *(undefined2 *)(_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- _case8_p1[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *_case8_p1
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_signed
|
- *(short *)((byte *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_signed
|
- ((short *)_case8_p1)[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_signed
|
- *(short *)((short *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_signed
|
- *(short *)(_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(byte *)((byte *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- ((byte *)_case8_p1)[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(byte *)((ushort *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- (byte)((ushort *)_case8_p1)[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(byte *)_case8_p1
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(byte *)(_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- (byte)_case8_p1[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(undefined1 *)((byte *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- ((undefined1 *)_case8_p1)[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(undefined1 *)((ushort *)_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- (undefined1)((ushort *)_case8_p1)[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(undefined1 *)_case8_p1
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(undefined1 *)(_case8_p1 + 0x0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- (undefined1)_case8_p1[0x0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low
)
...>
}


@receiver_3_w_0_0_address_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p1 + 0x0)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- &*(char *)((byte *)_case8_p1 + 0x0)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- &((char *)_case8_p1)[0x0]
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- &*(char *)((ushort *)_case8_p1 + 0x0)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- &*(char *)_case8_p1
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- &*(char *)(_case8_p1 + 0x0)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x0) = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)_case8_p1 + 0x0) = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low = (byte)E;
|
- ((char *)_case8_p1)[0x0] = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)_case8_p1 + 0x0) = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low = (byte)E;
|
- *(char *)_case8_p1 = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low = (byte)E;
|
- *(char *)(_case8_p1 + 0x0) = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x0)
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(char *)((byte *)_case8_p1 + 0x0)
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- ((char *)_case8_p1)[0x0]
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(char *)((ushort *)_case8_p1 + 0x0)
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- (char)((ushort *)_case8_p1)[0x0]
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(char *)_case8_p1
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- *(char *)(_case8_p1 + 0x0)
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_low
|
- (char)_case8_p1[0x0]
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high
|
- *(byte *)((byte *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high
|
- ((byte *)_case8_p1)[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high
|
- *(undefined1 *)((byte *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high
|
- ((undefined1 *)_case8_p1)[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high
)
...>
}


@receiver_3_w_0_0_address_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p1 + 0x1)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_high
|
- &*(char *)((byte *)_case8_p1 + 0x1)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_high
|
- &((char *)_case8_p1)[0x1]
+ (char *)&((uw_object_hdr_t *)_case8_p1)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x1) = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)_case8_p1 + 0x1) = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high = (byte)E;
|
- ((char *)_case8_p1)[0x1] = E;
+ ((uw_object_hdr_t *)_case8_p1)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x1)
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_high
|
- *(char *)((byte *)_case8_p1 + 0x1)
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_high
|
- ((char *)_case8_p1)[0x1]
+ (char)((uw_object_hdr_t *)_case8_p1)->type_flags_high
)
...>
}


@receiver_3_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p1 + 0x2) = (char)V;
- *(char *)((char *)_case8_p1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p1 + 0x2) = (char)V;
- *(byte *)((char *)_case8_p1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p1 + 0x2) = (byte)V;
- *(char *)((char *)_case8_p1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p1 + 0x2) = (byte)V;
- *(byte *)((char *)_case8_p1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- *(ushort *)((byte *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- ((ushort *)_case8_p1)[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- *(ushort *)((ushort *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- *(ushort *)(_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- _case8_p1[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word
)
...>
}


@receiver_3_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- *(undefined2 *)((byte *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- ((undefined2 *)_case8_p1)[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- *(undefined2 *)((undefined2 *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- *(undefined2 *)(_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- _case8_p1[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word
)
...>
}


@receiver_3_w_2_17_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_signed
|
- *(short *)((byte *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_signed
|
- ((short *)_case8_p1)[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_signed
|
- *(short *)((short *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_signed
|
- *(short *)(_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_signed
)
...>
}


@receiver_3_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(byte *)((byte *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- ((byte *)_case8_p1)[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(byte *)((ushort *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- (byte)((ushort *)_case8_p1)[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(byte *)(_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- (byte)_case8_p1[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(undefined1 *)((byte *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- ((undefined1 *)_case8_p1)[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(undefined1 *)((ushort *)_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- (undefined1)((ushort *)_case8_p1)[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(undefined1 *)(_case8_p1 + 0x1)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- (undefined1)_case8_p1[0x1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low
)
...>
}


@receiver_3_w_2_17_address_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p1 + 0x2)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- &*(char *)((byte *)_case8_p1 + 0x2)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- &((char *)_case8_p1)[0x2]
+ (char *)&((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- &*(char *)((ushort *)_case8_p1 + 0x1)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- &*(char *)(_case8_p1 + 0x1)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->position_word_low
)
...>
}


@receiver_3_w_2_17_store_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x2) = E;
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low = (byte)E;
|
- *(char *)((byte *)_case8_p1 + 0x2) = E;
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low = (byte)E;
|
- ((char *)_case8_p1)[0x2] = E;
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)_case8_p1 + 0x1) = E;
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low = (byte)E;
|
- *(char *)(_case8_p1 + 0x1) = E;
+ ((uw_object_hdr_t *)_case8_p1)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x2)
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(char *)((byte *)_case8_p1 + 0x2)
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- ((char *)_case8_p1)[0x2]
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(char *)((ushort *)_case8_p1 + 0x1)
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- (char)((ushort *)_case8_p1)[0x1]
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- *(char *)(_case8_p1 + 0x1)
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_low
|
- (char)_case8_p1[0x1]
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high
|
- *(byte *)((byte *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high
|
- ((byte *)_case8_p1)[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high
)
...>
}


@receiver_3_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high
|
- *(undefined1 *)((byte *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high
|
- ((undefined1 *)_case8_p1)[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high
)
...>
}


@receiver_3_w_2_17_address_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p1 + 0x3)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->position_word_high
|
- &*(char *)((byte *)_case8_p1 + 0x3)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->position_word_high
|
- &((char *)_case8_p1)[0x3]
+ (char *)&((uw_object_hdr_t *)_case8_p1)->position_word_high
)
...>
}


@receiver_3_w_2_17_store_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x3) = E;
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high = (byte)E;
|
- *(char *)((byte *)_case8_p1 + 0x3) = E;
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high = (byte)E;
|
- ((char *)_case8_p1)[0x3] = E;
+ ((uw_object_hdr_t *)_case8_p1)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x3)
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_high
|
- *(char *)((byte *)_case8_p1 + 0x3)
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_high
|
- ((char *)_case8_p1)[0x3]
+ (char)((uw_object_hdr_t *)_case8_p1)->position_word_high
)
...>
}


@receiver_3_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p1 + 0x4) = (char)V;
- *(char *)((char *)_case8_p1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p1 + 0x4) = (char)V;
- *(byte *)((char *)_case8_p1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p1 + 0x4) = (byte)V;
- *(char *)((char *)_case8_p1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p1 + 0x4) = (byte)V;
- *(byte *)((char *)_case8_p1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- *(ushort *)((byte *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- ((ushort *)_case8_p1)[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- *(ushort *)((ushort *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- *(ushort *)(_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- _case8_p1[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
)
...>
}


@receiver_3_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- *(undefined2 *)((byte *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- ((undefined2 *)_case8_p1)[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- *(undefined2 *)((undefined2 *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- *(undefined2 *)(_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- _case8_p1[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
)
...>
}


@receiver_3_w_4_34_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_signed
|
- *(short *)((byte *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_signed
|
- ((short *)_case8_p1)[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_signed
|
- *(short *)((short *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_signed
|
- *(short *)(_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_signed
)
...>
}


@receiver_3_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(byte *)((byte *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- ((byte *)_case8_p1)[0x4]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(byte *)((ushort *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- (byte)((ushort *)_case8_p1)[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(byte *)(_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- (byte)_case8_p1[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(undefined1 *)((byte *)_case8_p1 + 0x4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- ((undefined1 *)_case8_p1)[0x4]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(undefined1 *)((ushort *)_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- (undefined1)((ushort *)_case8_p1)[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(undefined1 *)(_case8_p1 + 0x2)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- (undefined1)_case8_p1[0x2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low
)
...>
}


@receiver_3_w_4_34_address_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p1 + 0x4)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- &*(char *)((byte *)_case8_p1 + 0x4)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- &((char *)_case8_p1)[0x4]
+ (char *)&((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- &*(char *)((ushort *)_case8_p1 + 0x2)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- &*(char *)(_case8_p1 + 0x2)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->chain_word_low
)
...>
}


@receiver_3_w_4_34_store_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x4) = E;
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)_case8_p1 + 0x4) = E;
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low = (byte)E;
|
- ((char *)_case8_p1)[0x4] = E;
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)_case8_p1 + 0x2) = E;
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low = (byte)E;
|
- *(char *)(_case8_p1 + 0x2) = E;
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x4)
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(char *)((byte *)_case8_p1 + 0x4)
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- ((char *)_case8_p1)[0x4]
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(char *)((ushort *)_case8_p1 + 0x2)
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- (char)((ushort *)_case8_p1)[0x2]
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- *(char *)(_case8_p1 + 0x2)
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_low
|
- (char)_case8_p1[0x2]
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p1 + 0x5)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high
|
- *(byte *)((byte *)_case8_p1 + 0x5)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high
|
- ((byte *)_case8_p1)[0x5]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high
)
...>
}


@receiver_3_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p1 + 0x5)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high
|
- *(undefined1 *)((byte *)_case8_p1 + 0x5)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high
|
- ((undefined1 *)_case8_p1)[0x5]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high
)
...>
}


@receiver_3_w_4_34_address_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p1 + 0x5)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->chain_word_high
|
- &*(char *)((byte *)_case8_p1 + 0x5)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->chain_word_high
|
- &((char *)_case8_p1)[0x5]
+ (char *)&((uw_object_hdr_t *)_case8_p1)->chain_word_high
)
...>
}


@receiver_3_w_4_34_store_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x5) = E;
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)_case8_p1 + 0x5) = E;
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high = (byte)E;
|
- ((char *)_case8_p1)[0x5] = E;
+ ((uw_object_hdr_t *)_case8_p1)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x5)
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_high
|
- *(char *)((byte *)_case8_p1 + 0x5)
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_high
|
- ((char *)_case8_p1)[0x5]
+ (char)((uw_object_hdr_t *)_case8_p1)->chain_word_high
)
...>
}


@receiver_3_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p1 + 0x6) = (char)V;
- *(char *)((char *)_case8_p1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p1 + 0x6) = (char)V;
- *(byte *)((char *)_case8_p1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p1 + 0x6) = (byte)V;
- *(char *)((char *)_case8_p1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p1 + 0x6) = (byte)V;
- *(byte *)((char *)_case8_p1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p1)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- *(ushort *)((byte *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- ((ushort *)_case8_p1)[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- *(ushort *)((ushort *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- *(ushort *)(_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- _case8_p1[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word
)
...>
}


@receiver_3_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- *(undefined2 *)((byte *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- ((undefined2 *)_case8_p1)[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- *(undefined2 *)((undefined2 *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- *(undefined2 *)(_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- _case8_p1[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word
)
...>
}


@receiver_3_w_6_51_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_signed
|
- *(short *)((byte *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_signed
|
- ((short *)_case8_p1)[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_signed
|
- *(short *)((short *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_signed
|
- *(short *)(_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_signed
)
...>
}


@receiver_3_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(byte *)((byte *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- ((byte *)_case8_p1)[0x6]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(byte *)((ushort *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- (byte)((ushort *)_case8_p1)[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(byte *)(_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- (byte)_case8_p1[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(undefined1 *)((byte *)_case8_p1 + 0x6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- ((undefined1 *)_case8_p1)[0x6]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(undefined1 *)((ushort *)_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- (undefined1)((ushort *)_case8_p1)[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(undefined1 *)(_case8_p1 + 0x3)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- (undefined1)_case8_p1[0x3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low
)
...>
}


@receiver_3_w_6_51_address_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p1 + 0x6)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- &*(char *)((byte *)_case8_p1 + 0x6)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- &((char *)_case8_p1)[0x6]
+ (char *)&((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- &*(char *)((ushort *)_case8_p1 + 0x3)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- &*(char *)(_case8_p1 + 0x3)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->link_word_low
)
...>
}


@receiver_3_w_6_51_store_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x6) = E;
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low = (byte)E;
|
- *(char *)((byte *)_case8_p1 + 0x6) = E;
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low = (byte)E;
|
- ((char *)_case8_p1)[0x6] = E;
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)_case8_p1 + 0x3) = E;
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low = (byte)E;
|
- *(char *)(_case8_p1 + 0x3) = E;
+ ((uw_object_hdr_t *)_case8_p1)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x6)
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(char *)((byte *)_case8_p1 + 0x6)
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- ((char *)_case8_p1)[0x6]
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(char *)((ushort *)_case8_p1 + 0x3)
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- (char)((ushort *)_case8_p1)[0x3]
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- *(char *)(_case8_p1 + 0x3)
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_low
|
- (char)_case8_p1[0x3]
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p1 + 0x7)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high
|
- *(byte *)((byte *)_case8_p1 + 0x7)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high
|
- ((byte *)_case8_p1)[0x7]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high
)
...>
}


@receiver_3_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p1 + 0x7)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high
|
- *(undefined1 *)((byte *)_case8_p1 + 0x7)
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high
|
- ((undefined1 *)_case8_p1)[0x7]
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high
)
...>
}


@receiver_3_w_6_51_address_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p1 + 0x7)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->link_word_high
|
- &*(char *)((byte *)_case8_p1 + 0x7)
+ (char *)&((uw_object_hdr_t *)_case8_p1)->link_word_high
|
- &((char *)_case8_p1)[0x7]
+ (char *)&((uw_object_hdr_t *)_case8_p1)->link_word_high
)
...>
}


@receiver_3_w_6_51_store_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x7) = E;
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high = (byte)E;
|
- *(char *)((byte *)_case8_p1 + 0x7) = E;
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high = (byte)E;
|
- ((char *)_case8_p1)[0x7] = E;
+ ((uw_object_hdr_t *)_case8_p1)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p1 + 0x7)
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_high
|
- *(char *)((byte *)_case8_p1 + 0x7)
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_high
|
- ((char *)_case8_p1)[0x7]
+ (char)((uw_object_hdr_t *)_case8_p1)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped_item + 0x0) = (char)V;
- *(char *)((char *)equipped_item + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped_item + 0x0) = (char)V;
- *(byte *)((char *)equipped_item + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped_item + 0x0) = (byte)V;
- *(char *)((char *)equipped_item + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped_item + 0x0) = (byte)V;
- *(byte *)((char *)equipped_item + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- *(ushort *)((byte *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- ((ushort *)equipped_item)[0x0]
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- *(ushort *)((ushort *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- *(ushort *)(equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
)
...>
}


@receiver_4_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- *(undefined2 *)((byte *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- ((undefined2 *)equipped_item)[0x0]
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- *(undefined2 *)((undefined2 *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- *(undefined2 *)(equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_signed
|
- *(short *)((byte *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_signed
|
- ((short *)equipped_item)[0x0]
+ ((uw_object_hdr_t *)equipped_item)->type_flags_signed
|
- *(short *)((short *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_signed
|
- *(short *)(equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(byte *)((byte *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- ((byte *)equipped_item)[0x0]
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(byte *)((ushort *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- (byte)((ushort *)equipped_item)[0x0]
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(byte *)equipped_item
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(byte *)(equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(undefined1 *)((byte *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- ((undefined1 *)equipped_item)[0x0]
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(undefined1 *)((ushort *)equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- (undefined1)((ushort *)equipped_item)[0x0]
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(undefined1 *)equipped_item
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(undefined1 *)(equipped_item + 0x0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low
)
...>
}


@receiver_4_w_0_0_address_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped_item + 0x0)
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- &*(char *)((byte *)equipped_item + 0x0)
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- &((char *)equipped_item)[0x0]
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- &*(char *)((ushort *)equipped_item + 0x0)
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- &*(char *)equipped_item
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- &*(char *)(equipped_item + 0x0)
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- &equipped_item[0x0]
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- &*equipped_item
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x0) = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low = (byte)E;
|
- *(char *)((byte *)equipped_item + 0x0) = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low = (byte)E;
|
- ((char *)equipped_item)[0x0] = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)equipped_item + 0x0) = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low = (byte)E;
|
- *(char *)equipped_item = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low = (byte)E;
|
- *(char *)(equipped_item + 0x0) = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low = (byte)E;
|
- equipped_item[0x0] = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low = (byte)E;
|
- *equipped_item = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x0)
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(char *)((byte *)equipped_item + 0x0)
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- ((char *)equipped_item)[0x0]
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(char *)((ushort *)equipped_item + 0x0)
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- (char)((ushort *)equipped_item)[0x0]
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(char *)equipped_item
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *(char *)(equipped_item + 0x0)
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- equipped_item[0x0]
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
|
- *equipped_item
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- *(byte *)((byte *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- ((byte *)equipped_item)[0x1]
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- *(byte *)(equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high
)
...>
}


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- *(undefined1 *)((byte *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- ((undefined1 *)equipped_item)[0x1]
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- *(undefined1 *)(equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high
)
...>
}


@receiver_4_w_0_0_address_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped_item + 0x1)
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- &*(char *)((byte *)equipped_item + 0x1)
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- &((char *)equipped_item)[0x1]
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- &*(char *)(equipped_item + 0x1)
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- &equipped_item[0x1]
+ (char *)&((uw_object_hdr_t *)equipped_item)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x1) = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high = (byte)E;
|
- *(char *)((byte *)equipped_item + 0x1) = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high = (byte)E;
|
- ((char *)equipped_item)[0x1] = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high = (byte)E;
|
- *(char *)(equipped_item + 0x1) = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high = (byte)E;
|
- equipped_item[0x1] = E;
+ ((uw_object_hdr_t *)equipped_item)->type_flags_high = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x1)
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- *(char *)((byte *)equipped_item + 0x1)
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- ((char *)equipped_item)[0x1]
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- *(char *)(equipped_item + 0x1)
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_high
|
- equipped_item[0x1]
+ (char)((uw_object_hdr_t *)equipped_item)->type_flags_high
)
...>
}


@receiver_4_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped_item + 0x2) = (char)V;
- *(char *)((char *)equipped_item + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped_item + 0x2) = (char)V;
- *(byte *)((char *)equipped_item + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped_item + 0x2) = (byte)V;
- *(char *)((char *)equipped_item + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped_item + 0x2) = (byte)V;
- *(byte *)((char *)equipped_item + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- *(ushort *)((byte *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- ((ushort *)equipped_item)[0x1]
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- *(ushort *)((ushort *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- *(ushort *)(equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word
)
...>
}


@receiver_4_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- *(undefined2 *)((byte *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- ((undefined2 *)equipped_item)[0x1]
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- *(undefined2 *)((undefined2 *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- *(undefined2 *)(equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word
)
...>
}


@receiver_4_w_2_17_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_signed
|
- *(short *)((byte *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_signed
|
- ((short *)equipped_item)[0x1]
+ ((uw_object_hdr_t *)equipped_item)->position_word_signed
|
- *(short *)((short *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->position_word_signed
|
- *(short *)(equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_signed
)
...>
}


@receiver_4_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(byte *)((byte *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- ((byte *)equipped_item)[0x2]
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(byte *)((ushort *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- (byte)((ushort *)equipped_item)[0x1]
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(byte *)(equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(undefined1 *)((byte *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- ((undefined1 *)equipped_item)[0x2]
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(undefined1 *)((ushort *)equipped_item + 0x1)
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- (undefined1)((ushort *)equipped_item)[0x1]
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(undefined1 *)(equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->position_word_low
)
...>
}


@receiver_4_w_2_17_address_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped_item + 0x2)
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_low
|
- &*(char *)((byte *)equipped_item + 0x2)
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_low
|
- &((char *)equipped_item)[0x2]
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_low
|
- &*(char *)((ushort *)equipped_item + 0x1)
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_low
|
- &*(char *)(equipped_item + 0x2)
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_low
|
- &equipped_item[0x2]
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_low
)
...>
}


@receiver_4_w_2_17_store_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x2) = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_low = (byte)E;
|
- *(char *)((byte *)equipped_item + 0x2) = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_low = (byte)E;
|
- ((char *)equipped_item)[0x2] = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_low = (byte)E;
|
- *(char *)((ushort *)equipped_item + 0x1) = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_low = (byte)E;
|
- *(char *)(equipped_item + 0x2) = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_low = (byte)E;
|
- equipped_item[0x2] = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x2)
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(char *)((byte *)equipped_item + 0x2)
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_low
|
- ((char *)equipped_item)[0x2]
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(char *)((ushort *)equipped_item + 0x1)
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_low
|
- (char)((ushort *)equipped_item)[0x1]
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_low
|
- *(char *)(equipped_item + 0x2)
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_low
|
- equipped_item[0x2]
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->position_word_high
|
- *(byte *)((byte *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->position_word_high
|
- ((byte *)equipped_item)[0x3]
+ ((uw_object_hdr_t *)equipped_item)->position_word_high
|
- *(byte *)(equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->position_word_high
)
...>
}


@receiver_4_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->position_word_high
|
- *(undefined1 *)((byte *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->position_word_high
|
- ((undefined1 *)equipped_item)[0x3]
+ ((uw_object_hdr_t *)equipped_item)->position_word_high
|
- *(undefined1 *)(equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->position_word_high
)
...>
}


@receiver_4_w_2_17_address_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped_item + 0x3)
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_high
|
- &*(char *)((byte *)equipped_item + 0x3)
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_high
|
- &((char *)equipped_item)[0x3]
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_high
|
- &*(char *)(equipped_item + 0x3)
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_high
|
- &equipped_item[0x3]
+ (char *)&((uw_object_hdr_t *)equipped_item)->position_word_high
)
...>
}


@receiver_4_w_2_17_store_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x3) = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_high = (byte)E;
|
- *(char *)((byte *)equipped_item + 0x3) = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_high = (byte)E;
|
- ((char *)equipped_item)[0x3] = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_high = (byte)E;
|
- *(char *)(equipped_item + 0x3) = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_high = (byte)E;
|
- equipped_item[0x3] = E;
+ ((uw_object_hdr_t *)equipped_item)->position_word_high = (byte)E;
)
...>
}


@receiver_4_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x3)
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_high
|
- *(char *)((byte *)equipped_item + 0x3)
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_high
|
- ((char *)equipped_item)[0x3]
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_high
|
- *(char *)(equipped_item + 0x3)
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_high
|
- equipped_item[0x3]
+ (char)((uw_object_hdr_t *)equipped_item)->position_word_high
)
...>
}


@receiver_4_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped_item + 0x4) = (char)V;
- *(char *)((char *)equipped_item + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped_item + 0x4) = (char)V;
- *(byte *)((char *)equipped_item + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped_item + 0x4) = (byte)V;
- *(char *)((char *)equipped_item + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped_item + 0x4) = (byte)V;
- *(byte *)((char *)equipped_item + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- *(ushort *)((byte *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- ((ushort *)equipped_item)[0x2]
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- *(ushort *)((ushort *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- *(ushort *)(equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
)
...>
}


@receiver_4_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- *(undefined2 *)((byte *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- ((undefined2 *)equipped_item)[0x2]
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- *(undefined2 *)((undefined2 *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- *(undefined2 *)(equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
)
...>
}


@receiver_4_w_4_34_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_signed
|
- *(short *)((byte *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_signed
|
- ((short *)equipped_item)[0x2]
+ ((uw_object_hdr_t *)equipped_item)->chain_word_signed
|
- *(short *)((short *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_signed
|
- *(short *)(equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_signed
)
...>
}


@receiver_4_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(byte *)((byte *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- ((byte *)equipped_item)[0x4]
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(byte *)((ushort *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- (byte)((ushort *)equipped_item)[0x2]
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(byte *)(equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(undefined1 *)((byte *)equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- ((undefined1 *)equipped_item)[0x4]
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(undefined1 *)((ushort *)equipped_item + 0x2)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- (undefined1)((ushort *)equipped_item)[0x2]
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(undefined1 *)(equipped_item + 0x4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low
)
...>
}


@receiver_4_w_4_34_address_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped_item + 0x4)
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- &*(char *)((byte *)equipped_item + 0x4)
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- &((char *)equipped_item)[0x4]
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- &*(char *)((ushort *)equipped_item + 0x2)
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- &*(char *)(equipped_item + 0x4)
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- &equipped_item[0x4]
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_low
)
...>
}


@receiver_4_w_4_34_store_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x4) = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low = (byte)E;
|
- *(char *)((byte *)equipped_item + 0x4) = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low = (byte)E;
|
- ((char *)equipped_item)[0x4] = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)equipped_item + 0x2) = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low = (byte)E;
|
- *(char *)(equipped_item + 0x4) = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low = (byte)E;
|
- equipped_item[0x4] = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x4)
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(char *)((byte *)equipped_item + 0x4)
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- ((char *)equipped_item)[0x4]
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(char *)((ushort *)equipped_item + 0x2)
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- (char)((ushort *)equipped_item)[0x2]
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- *(char *)(equipped_item + 0x4)
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_low
|
- equipped_item[0x4]
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped_item + 0x5)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- *(byte *)((byte *)equipped_item + 0x5)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- ((byte *)equipped_item)[0x5]
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- *(byte *)(equipped_item + 0x5)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high
)
...>
}


@receiver_4_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped_item + 0x5)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- *(undefined1 *)((byte *)equipped_item + 0x5)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- ((undefined1 *)equipped_item)[0x5]
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- *(undefined1 *)(equipped_item + 0x5)
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high
)
...>
}


@receiver_4_w_4_34_address_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped_item + 0x5)
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- &*(char *)((byte *)equipped_item + 0x5)
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- &((char *)equipped_item)[0x5]
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- &*(char *)(equipped_item + 0x5)
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- &equipped_item[0x5]
+ (char *)&((uw_object_hdr_t *)equipped_item)->chain_word_high
)
...>
}


@receiver_4_w_4_34_store_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x5) = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high = (byte)E;
|
- *(char *)((byte *)equipped_item + 0x5) = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high = (byte)E;
|
- ((char *)equipped_item)[0x5] = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high = (byte)E;
|
- *(char *)(equipped_item + 0x5) = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high = (byte)E;
|
- equipped_item[0x5] = E;
+ ((uw_object_hdr_t *)equipped_item)->chain_word_high = (byte)E;
)
...>
}


@receiver_4_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x5)
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- *(char *)((byte *)equipped_item + 0x5)
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- ((char *)equipped_item)[0x5]
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- *(char *)(equipped_item + 0x5)
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_high
|
- equipped_item[0x5]
+ (char)((uw_object_hdr_t *)equipped_item)->chain_word_high
)
...>
}


@receiver_4_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped_item + 0x6) = (char)V;
- *(char *)((char *)equipped_item + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped_item + 0x6) = (char)V;
- *(byte *)((char *)equipped_item + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped_item + 0x6) = (byte)V;
- *(char *)((char *)equipped_item + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped_item + 0x6) = (byte)V;
- *(byte *)((char *)equipped_item + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped_item)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- *(ushort *)((byte *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- ((ushort *)equipped_item)[0x3]
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- *(ushort *)((ushort *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- *(ushort *)(equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word
)
...>
}


@receiver_4_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- *(undefined2 *)((byte *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- ((undefined2 *)equipped_item)[0x3]
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- *(undefined2 *)((undefined2 *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- *(undefined2 *)(equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word
)
...>
}


@receiver_4_w_6_51_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_signed
|
- *(short *)((byte *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_signed
|
- ((short *)equipped_item)[0x3]
+ ((uw_object_hdr_t *)equipped_item)->link_word_signed
|
- *(short *)((short *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->link_word_signed
|
- *(short *)(equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_signed
)
...>
}


@receiver_4_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(byte *)((byte *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- ((byte *)equipped_item)[0x6]
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(byte *)((ushort *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- (byte)((ushort *)equipped_item)[0x3]
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(byte *)(equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(undefined1 *)((byte *)equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- ((undefined1 *)equipped_item)[0x6]
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(undefined1 *)((ushort *)equipped_item + 0x3)
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- (undefined1)((ushort *)equipped_item)[0x3]
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(undefined1 *)(equipped_item + 0x6)
+ ((uw_object_hdr_t *)equipped_item)->link_word_low
)
...>
}


@receiver_4_w_6_51_address_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped_item + 0x6)
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_low
|
- &*(char *)((byte *)equipped_item + 0x6)
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_low
|
- &((char *)equipped_item)[0x6]
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_low
|
- &*(char *)((ushort *)equipped_item + 0x3)
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_low
|
- &*(char *)(equipped_item + 0x6)
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_low
|
- &equipped_item[0x6]
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_low
)
...>
}


@receiver_4_w_6_51_store_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x6) = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_low = (byte)E;
|
- *(char *)((byte *)equipped_item + 0x6) = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_low = (byte)E;
|
- ((char *)equipped_item)[0x6] = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_low = (byte)E;
|
- *(char *)((ushort *)equipped_item + 0x3) = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_low = (byte)E;
|
- *(char *)(equipped_item + 0x6) = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_low = (byte)E;
|
- equipped_item[0x6] = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x6)
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(char *)((byte *)equipped_item + 0x6)
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_low
|
- ((char *)equipped_item)[0x6]
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(char *)((ushort *)equipped_item + 0x3)
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_low
|
- (char)((ushort *)equipped_item)[0x3]
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_low
|
- *(char *)(equipped_item + 0x6)
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_low
|
- equipped_item[0x6]
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped_item + 0x7)
+ ((uw_object_hdr_t *)equipped_item)->link_word_high
|
- *(byte *)((byte *)equipped_item + 0x7)
+ ((uw_object_hdr_t *)equipped_item)->link_word_high
|
- ((byte *)equipped_item)[0x7]
+ ((uw_object_hdr_t *)equipped_item)->link_word_high
|
- *(byte *)(equipped_item + 0x7)
+ ((uw_object_hdr_t *)equipped_item)->link_word_high
)
...>
}


@receiver_4_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped_item + 0x7)
+ ((uw_object_hdr_t *)equipped_item)->link_word_high
|
- *(undefined1 *)((byte *)equipped_item + 0x7)
+ ((uw_object_hdr_t *)equipped_item)->link_word_high
|
- ((undefined1 *)equipped_item)[0x7]
+ ((uw_object_hdr_t *)equipped_item)->link_word_high
|
- *(undefined1 *)(equipped_item + 0x7)
+ ((uw_object_hdr_t *)equipped_item)->link_word_high
)
...>
}


@receiver_4_w_6_51_address_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped_item + 0x7)
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_high
|
- &*(char *)((byte *)equipped_item + 0x7)
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_high
|
- &((char *)equipped_item)[0x7]
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_high
|
- &*(char *)(equipped_item + 0x7)
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_high
|
- &equipped_item[0x7]
+ (char *)&((uw_object_hdr_t *)equipped_item)->link_word_high
)
...>
}


@receiver_4_w_6_51_store_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x7) = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_high = (byte)E;
|
- *(char *)((byte *)equipped_item + 0x7) = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_high = (byte)E;
|
- ((char *)equipped_item)[0x7] = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_high = (byte)E;
|
- *(char *)(equipped_item + 0x7) = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_high = (byte)E;
|
- equipped_item[0x7] = E;
+ ((uw_object_hdr_t *)equipped_item)->link_word_high = (byte)E;
)
...>
}


@receiver_4_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped_item + 0x7)
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_high
|
- *(char *)((byte *)equipped_item + 0x7)
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_high
|
- ((char *)equipped_item)[0x7]
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_high
|
- *(char *)(equipped_item + 0x7)
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_high
|
- equipped_item[0x7]
+ (char)((uw_object_hdr_t *)equipped_item)->link_word_high
)
...>
}


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)linked_obj + 0x0) = (char)V;
- *(char *)((char *)linked_obj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)linked_obj + 0x0) = (char)V;
- *(byte *)((char *)linked_obj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)linked_obj + 0x0) = (byte)V;
- *(char *)((char *)linked_obj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)linked_obj + 0x0) = (byte)V;
- *(byte *)((char *)linked_obj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- *(ushort *)((byte *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- ((ushort *)linked_obj)[0x0]
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- *(ushort *)((ushort *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags
)
...>
}


@receiver_5_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- *(undefined2 *)((byte *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- ((undefined2 *)linked_obj)[0x0]
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- *(undefined2 *)((undefined2 *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_signed
|
- *(short *)((byte *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_signed
|
- ((short *)linked_obj)[0x0]
+ ((uw_object_hdr_t *)linked_obj)->type_flags_signed
|
- *(short *)((short *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(byte *)((byte *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- ((byte *)linked_obj)[0x0]
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(byte *)((ushort *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- (byte)((ushort *)linked_obj)[0x0]
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(byte *)linked_obj
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(undefined1 *)((byte *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- ((undefined1 *)linked_obj)[0x0]
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(undefined1 *)((ushort *)linked_obj + 0x0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- (undefined1)((ushort *)linked_obj)[0x0]
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(undefined1 *)linked_obj
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low
)
...>
}


@receiver_5_w_0_0_address_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)linked_obj + 0x0)
+ (char *)&((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- &*(char *)((byte *)linked_obj + 0x0)
+ (char *)&((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- &((char *)linked_obj)[0x0]
+ (char *)&((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- &*(char *)((ushort *)linked_obj + 0x0)
+ (char *)&((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- &*(char *)linked_obj
+ (char *)&((uw_object_hdr_t *)linked_obj)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x0) = E;
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low = (byte)E;
|
- *(char *)((byte *)linked_obj + 0x0) = E;
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low = (byte)E;
|
- ((char *)linked_obj)[0x0] = E;
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)linked_obj + 0x0) = E;
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low = (byte)E;
|
- *(char *)linked_obj = E;
+ ((uw_object_hdr_t *)linked_obj)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x0)
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(char *)((byte *)linked_obj + 0x0)
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- ((char *)linked_obj)[0x0]
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(char *)((ushort *)linked_obj + 0x0)
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- (char)((ushort *)linked_obj)[0x0]
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_low
|
- *(char *)linked_obj
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high
|
- *(byte *)((byte *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high
|
- ((byte *)linked_obj)[0x1]
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high
)
...>
}


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high
|
- *(undefined1 *)((byte *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high
|
- ((undefined1 *)linked_obj)[0x1]
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high
)
...>
}


@receiver_5_w_0_0_address_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)linked_obj + 0x1)
+ (char *)&((uw_object_hdr_t *)linked_obj)->type_flags_high
|
- &*(char *)((byte *)linked_obj + 0x1)
+ (char *)&((uw_object_hdr_t *)linked_obj)->type_flags_high
|
- &((char *)linked_obj)[0x1]
+ (char *)&((uw_object_hdr_t *)linked_obj)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x1) = E;
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high = (byte)E;
|
- *(char *)((byte *)linked_obj + 0x1) = E;
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high = (byte)E;
|
- ((char *)linked_obj)[0x1] = E;
+ ((uw_object_hdr_t *)linked_obj)->type_flags_high = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x1)
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_high
|
- *(char *)((byte *)linked_obj + 0x1)
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_high
|
- ((char *)linked_obj)[0x1]
+ (char)((uw_object_hdr_t *)linked_obj)->type_flags_high
)
...>
}


@receiver_5_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)linked_obj + 0x2) = (char)V;
- *(char *)((char *)linked_obj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)linked_obj + 0x2) = (char)V;
- *(byte *)((char *)linked_obj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)linked_obj + 0x2) = (byte)V;
- *(char *)((char *)linked_obj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)linked_obj + 0x2) = (byte)V;
- *(byte *)((char *)linked_obj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word
|
- *(ushort *)((byte *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word
|
- ((ushort *)linked_obj)[0x1]
+ ((uw_object_hdr_t *)linked_obj)->position_word
|
- *(ushort *)((ushort *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->position_word
)
...>
}


@receiver_5_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word
|
- *(undefined2 *)((byte *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word
|
- ((undefined2 *)linked_obj)[0x1]
+ ((uw_object_hdr_t *)linked_obj)->position_word
|
- *(undefined2 *)((undefined2 *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->position_word
)
...>
}


@receiver_5_w_2_17_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word_signed
|
- *(short *)((byte *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word_signed
|
- ((short *)linked_obj)[0x1]
+ ((uw_object_hdr_t *)linked_obj)->position_word_signed
|
- *(short *)((short *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->position_word_signed
)
...>
}


@receiver_5_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
|
- *(byte *)((byte *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
|
- ((byte *)linked_obj)[0x2]
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
|
- *(byte *)((ushort *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
|
- (byte)((ushort *)linked_obj)[0x1]
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
|
- *(undefined1 *)((byte *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
|
- ((undefined1 *)linked_obj)[0x2]
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
|
- *(undefined1 *)((ushort *)linked_obj + 0x1)
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
|
- (undefined1)((ushort *)linked_obj)[0x1]
+ ((uw_object_hdr_t *)linked_obj)->position_word_low
)
...>
}


@receiver_5_w_2_17_address_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)linked_obj + 0x2)
+ (char *)&((uw_object_hdr_t *)linked_obj)->position_word_low
|
- &*(char *)((byte *)linked_obj + 0x2)
+ (char *)&((uw_object_hdr_t *)linked_obj)->position_word_low
|
- &((char *)linked_obj)[0x2]
+ (char *)&((uw_object_hdr_t *)linked_obj)->position_word_low
|
- &*(char *)((ushort *)linked_obj + 0x1)
+ (char *)&((uw_object_hdr_t *)linked_obj)->position_word_low
)
...>
}


@receiver_5_w_2_17_store_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x2) = E;
+ ((uw_object_hdr_t *)linked_obj)->position_word_low = (byte)E;
|
- *(char *)((byte *)linked_obj + 0x2) = E;
+ ((uw_object_hdr_t *)linked_obj)->position_word_low = (byte)E;
|
- ((char *)linked_obj)[0x2] = E;
+ ((uw_object_hdr_t *)linked_obj)->position_word_low = (byte)E;
|
- *(char *)((ushort *)linked_obj + 0x1) = E;
+ ((uw_object_hdr_t *)linked_obj)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x2)
+ (char)((uw_object_hdr_t *)linked_obj)->position_word_low
|
- *(char *)((byte *)linked_obj + 0x2)
+ (char)((uw_object_hdr_t *)linked_obj)->position_word_low
|
- ((char *)linked_obj)[0x2]
+ (char)((uw_object_hdr_t *)linked_obj)->position_word_low
|
- *(char *)((ushort *)linked_obj + 0x1)
+ (char)((uw_object_hdr_t *)linked_obj)->position_word_low
|
- (char)((ushort *)linked_obj)[0x1]
+ (char)((uw_object_hdr_t *)linked_obj)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->position_word_high
|
- *(byte *)((byte *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->position_word_high
|
- ((byte *)linked_obj)[0x3]
+ ((uw_object_hdr_t *)linked_obj)->position_word_high
)
...>
}


@receiver_5_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->position_word_high
|
- *(undefined1 *)((byte *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->position_word_high
|
- ((undefined1 *)linked_obj)[0x3]
+ ((uw_object_hdr_t *)linked_obj)->position_word_high
)
...>
}


@receiver_5_w_2_17_address_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)linked_obj + 0x3)
+ (char *)&((uw_object_hdr_t *)linked_obj)->position_word_high
|
- &*(char *)((byte *)linked_obj + 0x3)
+ (char *)&((uw_object_hdr_t *)linked_obj)->position_word_high
|
- &((char *)linked_obj)[0x3]
+ (char *)&((uw_object_hdr_t *)linked_obj)->position_word_high
)
...>
}


@receiver_5_w_2_17_store_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x3) = E;
+ ((uw_object_hdr_t *)linked_obj)->position_word_high = (byte)E;
|
- *(char *)((byte *)linked_obj + 0x3) = E;
+ ((uw_object_hdr_t *)linked_obj)->position_word_high = (byte)E;
|
- ((char *)linked_obj)[0x3] = E;
+ ((uw_object_hdr_t *)linked_obj)->position_word_high = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x3)
+ (char)((uw_object_hdr_t *)linked_obj)->position_word_high
|
- *(char *)((byte *)linked_obj + 0x3)
+ (char)((uw_object_hdr_t *)linked_obj)->position_word_high
|
- ((char *)linked_obj)[0x3]
+ (char)((uw_object_hdr_t *)linked_obj)->position_word_high
)
...>
}


@receiver_5_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)linked_obj + 0x4) = (char)V;
- *(char *)((char *)linked_obj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)linked_obj + 0x4) = (char)V;
- *(byte *)((char *)linked_obj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)linked_obj + 0x4) = (byte)V;
- *(char *)((char *)linked_obj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)linked_obj + 0x4) = (byte)V;
- *(byte *)((char *)linked_obj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word
|
- *(ushort *)((byte *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word
|
- ((ushort *)linked_obj)[0x2]
+ ((uw_object_hdr_t *)linked_obj)->chain_word
|
- *(ushort *)((ushort *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->chain_word
)
...>
}


@receiver_5_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word
|
- *(undefined2 *)((byte *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word
|
- ((undefined2 *)linked_obj)[0x2]
+ ((uw_object_hdr_t *)linked_obj)->chain_word
|
- *(undefined2 *)((undefined2 *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->chain_word
)
...>
}


@receiver_5_w_4_34_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_signed
|
- *(short *)((byte *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_signed
|
- ((short *)linked_obj)[0x2]
+ ((uw_object_hdr_t *)linked_obj)->chain_word_signed
|
- *(short *)((short *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_signed
)
...>
}


@receiver_5_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- *(byte *)((byte *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- ((byte *)linked_obj)[0x4]
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- *(byte *)((ushort *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- (byte)((ushort *)linked_obj)[0x2]
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- *(undefined1 *)((byte *)linked_obj + 0x4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- ((undefined1 *)linked_obj)[0x4]
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- *(undefined1 *)((ushort *)linked_obj + 0x2)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- (undefined1)((ushort *)linked_obj)[0x2]
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low
)
...>
}


@receiver_5_w_4_34_address_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)linked_obj + 0x4)
+ (char *)&((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- &*(char *)((byte *)linked_obj + 0x4)
+ (char *)&((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- &((char *)linked_obj)[0x4]
+ (char *)&((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- &*(char *)((ushort *)linked_obj + 0x2)
+ (char *)&((uw_object_hdr_t *)linked_obj)->chain_word_low
)
...>
}


@receiver_5_w_4_34_store_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x4) = E;
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low = (byte)E;
|
- *(char *)((byte *)linked_obj + 0x4) = E;
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low = (byte)E;
|
- ((char *)linked_obj)[0x4] = E;
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)linked_obj + 0x2) = E;
+ ((uw_object_hdr_t *)linked_obj)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x4)
+ (char)((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- *(char *)((byte *)linked_obj + 0x4)
+ (char)((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- ((char *)linked_obj)[0x4]
+ (char)((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- *(char *)((ushort *)linked_obj + 0x2)
+ (char)((uw_object_hdr_t *)linked_obj)->chain_word_low
|
- (char)((ushort *)linked_obj)[0x2]
+ (char)((uw_object_hdr_t *)linked_obj)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)linked_obj + 0x5)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high
|
- *(byte *)((byte *)linked_obj + 0x5)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high
|
- ((byte *)linked_obj)[0x5]
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high
)
...>
}


@receiver_5_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)linked_obj + 0x5)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high
|
- *(undefined1 *)((byte *)linked_obj + 0x5)
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high
|
- ((undefined1 *)linked_obj)[0x5]
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high
)
...>
}


@receiver_5_w_4_34_address_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)linked_obj + 0x5)
+ (char *)&((uw_object_hdr_t *)linked_obj)->chain_word_high
|
- &*(char *)((byte *)linked_obj + 0x5)
+ (char *)&((uw_object_hdr_t *)linked_obj)->chain_word_high
|
- &((char *)linked_obj)[0x5]
+ (char *)&((uw_object_hdr_t *)linked_obj)->chain_word_high
)
...>
}


@receiver_5_w_4_34_store_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x5) = E;
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high = (byte)E;
|
- *(char *)((byte *)linked_obj + 0x5) = E;
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high = (byte)E;
|
- ((char *)linked_obj)[0x5] = E;
+ ((uw_object_hdr_t *)linked_obj)->chain_word_high = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x5)
+ (char)((uw_object_hdr_t *)linked_obj)->chain_word_high
|
- *(char *)((byte *)linked_obj + 0x5)
+ (char)((uw_object_hdr_t *)linked_obj)->chain_word_high
|
- ((char *)linked_obj)[0x5]
+ (char)((uw_object_hdr_t *)linked_obj)->chain_word_high
)
...>
}


@receiver_5_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)linked_obj + 0x6) = (char)V;
- *(char *)((char *)linked_obj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)linked_obj + 0x6) = (char)V;
- *(byte *)((char *)linked_obj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)linked_obj + 0x6) = (byte)V;
- *(char *)((char *)linked_obj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)linked_obj + 0x6) = (byte)V;
- *(byte *)((char *)linked_obj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)linked_obj)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word
|
- *(ushort *)((byte *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word
|
- ((ushort *)linked_obj)[0x3]
+ ((uw_object_hdr_t *)linked_obj)->link_word
|
- *(ushort *)((ushort *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->link_word
)
...>
}


@receiver_5_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word
|
- *(undefined2 *)((byte *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word
|
- ((undefined2 *)linked_obj)[0x3]
+ ((uw_object_hdr_t *)linked_obj)->link_word
|
- *(undefined2 *)((undefined2 *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->link_word
)
...>
}


@receiver_5_w_6_51_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word_signed
|
- *(short *)((byte *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word_signed
|
- ((short *)linked_obj)[0x3]
+ ((uw_object_hdr_t *)linked_obj)->link_word_signed
|
- *(short *)((short *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->link_word_signed
)
...>
}


@receiver_5_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
|
- *(byte *)((byte *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
|
- ((byte *)linked_obj)[0x6]
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
|
- *(byte *)((ushort *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
|
- (byte)((ushort *)linked_obj)[0x3]
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
|
- *(undefined1 *)((byte *)linked_obj + 0x6)
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
|
- ((undefined1 *)linked_obj)[0x6]
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
|
- *(undefined1 *)((ushort *)linked_obj + 0x3)
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
|
- (undefined1)((ushort *)linked_obj)[0x3]
+ ((uw_object_hdr_t *)linked_obj)->link_word_low
)
...>
}


@receiver_5_w_6_51_address_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)linked_obj + 0x6)
+ (char *)&((uw_object_hdr_t *)linked_obj)->link_word_low
|
- &*(char *)((byte *)linked_obj + 0x6)
+ (char *)&((uw_object_hdr_t *)linked_obj)->link_word_low
|
- &((char *)linked_obj)[0x6]
+ (char *)&((uw_object_hdr_t *)linked_obj)->link_word_low
|
- &*(char *)((ushort *)linked_obj + 0x3)
+ (char *)&((uw_object_hdr_t *)linked_obj)->link_word_low
)
...>
}


@receiver_5_w_6_51_store_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x6) = E;
+ ((uw_object_hdr_t *)linked_obj)->link_word_low = (byte)E;
|
- *(char *)((byte *)linked_obj + 0x6) = E;
+ ((uw_object_hdr_t *)linked_obj)->link_word_low = (byte)E;
|
- ((char *)linked_obj)[0x6] = E;
+ ((uw_object_hdr_t *)linked_obj)->link_word_low = (byte)E;
|
- *(char *)((ushort *)linked_obj + 0x3) = E;
+ ((uw_object_hdr_t *)linked_obj)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x6)
+ (char)((uw_object_hdr_t *)linked_obj)->link_word_low
|
- *(char *)((byte *)linked_obj + 0x6)
+ (char)((uw_object_hdr_t *)linked_obj)->link_word_low
|
- ((char *)linked_obj)[0x6]
+ (char)((uw_object_hdr_t *)linked_obj)->link_word_low
|
- *(char *)((ushort *)linked_obj + 0x3)
+ (char)((uw_object_hdr_t *)linked_obj)->link_word_low
|
- (char)((ushort *)linked_obj)[0x3]
+ (char)((uw_object_hdr_t *)linked_obj)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)linked_obj + 0x7)
+ ((uw_object_hdr_t *)linked_obj)->link_word_high
|
- *(byte *)((byte *)linked_obj + 0x7)
+ ((uw_object_hdr_t *)linked_obj)->link_word_high
|
- ((byte *)linked_obj)[0x7]
+ ((uw_object_hdr_t *)linked_obj)->link_word_high
)
...>
}


@receiver_5_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)linked_obj + 0x7)
+ ((uw_object_hdr_t *)linked_obj)->link_word_high
|
- *(undefined1 *)((byte *)linked_obj + 0x7)
+ ((uw_object_hdr_t *)linked_obj)->link_word_high
|
- ((undefined1 *)linked_obj)[0x7]
+ ((uw_object_hdr_t *)linked_obj)->link_word_high
)
...>
}


@receiver_5_w_6_51_address_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)linked_obj + 0x7)
+ (char *)&((uw_object_hdr_t *)linked_obj)->link_word_high
|
- &*(char *)((byte *)linked_obj + 0x7)
+ (char *)&((uw_object_hdr_t *)linked_obj)->link_word_high
|
- &((char *)linked_obj)[0x7]
+ (char *)&((uw_object_hdr_t *)linked_obj)->link_word_high
)
...>
}


@receiver_5_w_6_51_store_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x7) = E;
+ ((uw_object_hdr_t *)linked_obj)->link_word_high = (byte)E;
|
- *(char *)((byte *)linked_obj + 0x7) = E;
+ ((uw_object_hdr_t *)linked_obj)->link_word_high = (byte)E;
|
- ((char *)linked_obj)[0x7] = E;
+ ((uw_object_hdr_t *)linked_obj)->link_word_high = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)linked_obj + 0x7)
+ (char)((uw_object_hdr_t *)linked_obj)->link_word_high
|
- *(char *)((byte *)linked_obj + 0x7)
+ (char)((uw_object_hdr_t *)linked_obj)->link_word_high
|
- ((char *)linked_obj)[0x7]
+ (char)((uw_object_hdr_t *)linked_obj)->link_word_high
)
...>
}


@receiver_6_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p2 + 0x0) = (char)V;
- *(char *)((char *)_case8_p2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p2 + 0x0) = (char)V;
- *(byte *)((char *)_case8_p2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p2 + 0x0) = (byte)V;
- *(char *)((char *)_case8_p2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p2 + 0x0) = (byte)V;
- *(byte *)((char *)_case8_p2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *(ushort *)((byte *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- ((ushort *)_case8_p2)[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *(ushort *)((ushort *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *(ushort *)(_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- _case8_p2[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *_case8_p2
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
)
...>
}


@receiver_6_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *(undefined2 *)((byte *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- ((undefined2 *)_case8_p2)[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *(undefined2 *)((undefined2 *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *(undefined2 *)(_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- _case8_p2[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *_case8_p2
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
)
...>
}


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_signed
|
- *(short *)((byte *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_signed
|
- ((short *)_case8_p2)[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_signed
|
- *(short *)((short *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_signed
|
- *(short *)(_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_signed
)
...>
}


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(byte *)((byte *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- ((byte *)_case8_p2)[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(byte *)((ushort *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- (byte)((ushort *)_case8_p2)[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(byte *)_case8_p2
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(byte *)(_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- (byte)_case8_p2[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(undefined1 *)((byte *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- ((undefined1 *)_case8_p2)[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(undefined1 *)((ushort *)_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- (undefined1)((ushort *)_case8_p2)[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(undefined1 *)_case8_p2
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(undefined1 *)(_case8_p2 + 0x0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- (undefined1)_case8_p2[0x0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low
)
...>
}


@receiver_6_w_0_0_address_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p2 + 0x0)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- &*(char *)((byte *)_case8_p2 + 0x0)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- &((char *)_case8_p2)[0x0]
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- &*(char *)((ushort *)_case8_p2 + 0x0)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- &*(char *)_case8_p2
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- &*(char *)(_case8_p2 + 0x0)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_low
)
...>
}


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x0) = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low = (byte)E;
|
- *(char *)((byte *)_case8_p2 + 0x0) = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low = (byte)E;
|
- ((char *)_case8_p2)[0x0] = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)_case8_p2 + 0x0) = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low = (byte)E;
|
- *(char *)_case8_p2 = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low = (byte)E;
|
- *(char *)(_case8_p2 + 0x0) = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_low = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x0)
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(char *)((byte *)_case8_p2 + 0x0)
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- ((char *)_case8_p2)[0x0]
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(char *)((ushort *)_case8_p2 + 0x0)
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- (char)((ushort *)_case8_p2)[0x0]
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(char *)_case8_p2
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- *(char *)(_case8_p2 + 0x0)
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_low
|
- (char)_case8_p2[0x0]
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high
|
- *(byte *)((byte *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high
|
- ((byte *)_case8_p2)[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high
)
...>
}


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high
|
- *(undefined1 *)((byte *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high
|
- ((undefined1 *)_case8_p2)[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high
)
...>
}


@receiver_6_w_0_0_address_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p2 + 0x1)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_high
|
- &*(char *)((byte *)_case8_p2 + 0x1)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_high
|
- &((char *)_case8_p2)[0x1]
+ (char *)&((uw_object_hdr_t *)_case8_p2)->type_flags_high
)
...>
}


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x1) = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high = (byte)E;
|
- *(char *)((byte *)_case8_p2 + 0x1) = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high = (byte)E;
|
- ((char *)_case8_p2)[0x1] = E;
+ ((uw_object_hdr_t *)_case8_p2)->type_flags_high = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x1)
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_high
|
- *(char *)((byte *)_case8_p2 + 0x1)
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_high
|
- ((char *)_case8_p2)[0x1]
+ (char)((uw_object_hdr_t *)_case8_p2)->type_flags_high
)
...>
}


@receiver_6_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p2 + 0x2) = (char)V;
- *(char *)((char *)_case8_p2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p2 + 0x2) = (char)V;
- *(byte *)((char *)_case8_p2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p2 + 0x2) = (byte)V;
- *(char *)((char *)_case8_p2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p2 + 0x2) = (byte)V;
- *(byte *)((char *)_case8_p2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- *(ushort *)((byte *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- ((ushort *)_case8_p2)[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- *(ushort *)((ushort *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- *(ushort *)(_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- _case8_p2[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word
)
...>
}


@receiver_6_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- *(undefined2 *)((byte *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- ((undefined2 *)_case8_p2)[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- *(undefined2 *)((undefined2 *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- *(undefined2 *)(_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- _case8_p2[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word
)
...>
}


@receiver_6_w_2_17_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_signed
|
- *(short *)((byte *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_signed
|
- ((short *)_case8_p2)[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_signed
|
- *(short *)((short *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_signed
|
- *(short *)(_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_signed
)
...>
}


@receiver_6_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(byte *)((byte *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- ((byte *)_case8_p2)[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(byte *)((ushort *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- (byte)((ushort *)_case8_p2)[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(byte *)(_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- (byte)_case8_p2[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
)
...>
}


@receiver_6_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(undefined1 *)((byte *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- ((undefined1 *)_case8_p2)[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(undefined1 *)((ushort *)_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- (undefined1)((ushort *)_case8_p2)[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(undefined1 *)(_case8_p2 + 0x1)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- (undefined1)_case8_p2[0x1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low
)
...>
}


@receiver_6_w_2_17_address_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p2 + 0x2)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- &*(char *)((byte *)_case8_p2 + 0x2)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- &((char *)_case8_p2)[0x2]
+ (char *)&((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- &*(char *)((ushort *)_case8_p2 + 0x1)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- &*(char *)(_case8_p2 + 0x1)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->position_word_low
)
...>
}


@receiver_6_w_2_17_store_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x2) = E;
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low = (byte)E;
|
- *(char *)((byte *)_case8_p2 + 0x2) = E;
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low = (byte)E;
|
- ((char *)_case8_p2)[0x2] = E;
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low = (byte)E;
|
- *(char *)((ushort *)_case8_p2 + 0x1) = E;
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low = (byte)E;
|
- *(char *)(_case8_p2 + 0x1) = E;
+ ((uw_object_hdr_t *)_case8_p2)->position_word_low = (byte)E;
)
...>
}


@receiver_6_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x2)
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(char *)((byte *)_case8_p2 + 0x2)
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- ((char *)_case8_p2)[0x2]
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(char *)((ushort *)_case8_p2 + 0x1)
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- (char)((ushort *)_case8_p2)[0x1]
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- *(char *)(_case8_p2 + 0x1)
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_low
|
- (char)_case8_p2[0x1]
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_low
)
...>
}


@receiver_6_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high
|
- *(byte *)((byte *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high
|
- ((byte *)_case8_p2)[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high
)
...>
}


@receiver_6_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high
|
- *(undefined1 *)((byte *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high
|
- ((undefined1 *)_case8_p2)[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high
)
...>
}


@receiver_6_w_2_17_address_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p2 + 0x3)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->position_word_high
|
- &*(char *)((byte *)_case8_p2 + 0x3)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->position_word_high
|
- &((char *)_case8_p2)[0x3]
+ (char *)&((uw_object_hdr_t *)_case8_p2)->position_word_high
)
...>
}


@receiver_6_w_2_17_store_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x3) = E;
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high = (byte)E;
|
- *(char *)((byte *)_case8_p2 + 0x3) = E;
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high = (byte)E;
|
- ((char *)_case8_p2)[0x3] = E;
+ ((uw_object_hdr_t *)_case8_p2)->position_word_high = (byte)E;
)
...>
}


@receiver_6_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x3)
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_high
|
- *(char *)((byte *)_case8_p2 + 0x3)
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_high
|
- ((char *)_case8_p2)[0x3]
+ (char)((uw_object_hdr_t *)_case8_p2)->position_word_high
)
...>
}


@receiver_6_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p2 + 0x4) = (char)V;
- *(char *)((char *)_case8_p2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p2 + 0x4) = (char)V;
- *(byte *)((char *)_case8_p2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p2 + 0x4) = (byte)V;
- *(char *)((char *)_case8_p2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p2 + 0x4) = (byte)V;
- *(byte *)((char *)_case8_p2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- *(ushort *)((byte *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- ((ushort *)_case8_p2)[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- *(ushort *)((ushort *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- *(ushort *)(_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- _case8_p2[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
)
...>
}


@receiver_6_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- *(undefined2 *)((byte *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- ((undefined2 *)_case8_p2)[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- *(undefined2 *)((undefined2 *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- *(undefined2 *)(_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- _case8_p2[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
)
...>
}


@receiver_6_w_4_34_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_signed
|
- *(short *)((byte *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_signed
|
- ((short *)_case8_p2)[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_signed
|
- *(short *)((short *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_signed
|
- *(short *)(_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_signed
)
...>
}


@receiver_6_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(byte *)((byte *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- ((byte *)_case8_p2)[0x4]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(byte *)((ushort *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- (byte)((ushort *)_case8_p2)[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(byte *)(_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- (byte)_case8_p2[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
)
...>
}


@receiver_6_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(undefined1 *)((byte *)_case8_p2 + 0x4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- ((undefined1 *)_case8_p2)[0x4]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(undefined1 *)((ushort *)_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- (undefined1)((ushort *)_case8_p2)[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(undefined1 *)(_case8_p2 + 0x2)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- (undefined1)_case8_p2[0x2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low
)
...>
}


@receiver_6_w_4_34_address_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p2 + 0x4)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- &*(char *)((byte *)_case8_p2 + 0x4)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- &((char *)_case8_p2)[0x4]
+ (char *)&((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- &*(char *)((ushort *)_case8_p2 + 0x2)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- &*(char *)(_case8_p2 + 0x2)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->chain_word_low
)
...>
}


@receiver_6_w_4_34_store_4@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x4) = E;
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low = (byte)E;
|
- *(char *)((byte *)_case8_p2 + 0x4) = E;
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low = (byte)E;
|
- ((char *)_case8_p2)[0x4] = E;
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)_case8_p2 + 0x2) = E;
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low = (byte)E;
|
- *(char *)(_case8_p2 + 0x2) = E;
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_low = (byte)E;
)
...>
}


@receiver_6_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x4)
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(char *)((byte *)_case8_p2 + 0x4)
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- ((char *)_case8_p2)[0x4]
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(char *)((ushort *)_case8_p2 + 0x2)
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- (char)((ushort *)_case8_p2)[0x2]
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- *(char *)(_case8_p2 + 0x2)
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_low
|
- (char)_case8_p2[0x2]
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_low
)
...>
}


@receiver_6_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p2 + 0x5)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high
|
- *(byte *)((byte *)_case8_p2 + 0x5)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high
|
- ((byte *)_case8_p2)[0x5]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high
)
...>
}


@receiver_6_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p2 + 0x5)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high
|
- *(undefined1 *)((byte *)_case8_p2 + 0x5)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high
|
- ((undefined1 *)_case8_p2)[0x5]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high
)
...>
}


@receiver_6_w_4_34_address_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p2 + 0x5)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->chain_word_high
|
- &*(char *)((byte *)_case8_p2 + 0x5)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->chain_word_high
|
- &((char *)_case8_p2)[0x5]
+ (char *)&((uw_object_hdr_t *)_case8_p2)->chain_word_high
)
...>
}


@receiver_6_w_4_34_store_5@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x5) = E;
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high = (byte)E;
|
- *(char *)((byte *)_case8_p2 + 0x5) = E;
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high = (byte)E;
|
- ((char *)_case8_p2)[0x5] = E;
+ ((uw_object_hdr_t *)_case8_p2)->chain_word_high = (byte)E;
)
...>
}


@receiver_6_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x5)
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_high
|
- *(char *)((byte *)_case8_p2 + 0x5)
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_high
|
- ((char *)_case8_p2)[0x5]
+ (char)((uw_object_hdr_t *)_case8_p2)->chain_word_high
)
...>
}


@receiver_6_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p2 + 0x6) = (char)V;
- *(char *)((char *)_case8_p2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_case8_p2 + 0x6) = (char)V;
- *(byte *)((char *)_case8_p2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p2 + 0x6) = (byte)V;
- *(char *)((char *)_case8_p2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_case8_p2 + 0x6) = (byte)V;
- *(byte *)((char *)_case8_p2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_case8_p2)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_word_ushort@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- *(ushort *)((byte *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- ((ushort *)_case8_p2)[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- *(ushort *)((ushort *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- *(ushort *)(_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- _case8_p2[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word
)
...>
}


@receiver_6_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- *(undefined2 *)((byte *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- ((undefined2 *)_case8_p2)[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- *(undefined2 *)((undefined2 *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- *(undefined2 *)(_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- _case8_p2[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word
)
...>
}


@receiver_6_w_6_51_word_short@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_signed
|
- *(short *)((byte *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_signed
|
- ((short *)_case8_p2)[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_signed
|
- *(short *)((short *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_signed
|
- *(short *)(_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_signed
)
...>
}


@receiver_6_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(byte *)((byte *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- ((byte *)_case8_p2)[0x6]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(byte *)((ushort *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- (byte)((ushort *)_case8_p2)[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(byte *)(_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- (byte)_case8_p2[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
)
...>
}


@receiver_6_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(undefined1 *)((byte *)_case8_p2 + 0x6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- ((undefined1 *)_case8_p2)[0x6]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(undefined1 *)((ushort *)_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- (undefined1)((ushort *)_case8_p2)[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(undefined1 *)(_case8_p2 + 0x3)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- (undefined1)_case8_p2[0x3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low
)
...>
}


@receiver_6_w_6_51_address_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p2 + 0x6)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- &*(char *)((byte *)_case8_p2 + 0x6)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- &((char *)_case8_p2)[0x6]
+ (char *)&((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- &*(char *)((ushort *)_case8_p2 + 0x3)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- &*(char *)(_case8_p2 + 0x3)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->link_word_low
)
...>
}


@receiver_6_w_6_51_store_6@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x6) = E;
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low = (byte)E;
|
- *(char *)((byte *)_case8_p2 + 0x6) = E;
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low = (byte)E;
|
- ((char *)_case8_p2)[0x6] = E;
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low = (byte)E;
|
- *(char *)((ushort *)_case8_p2 + 0x3) = E;
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low = (byte)E;
|
- *(char *)(_case8_p2 + 0x3) = E;
+ ((uw_object_hdr_t *)_case8_p2)->link_word_low = (byte)E;
)
...>
}


@receiver_6_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x6)
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(char *)((byte *)_case8_p2 + 0x6)
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- ((char *)_case8_p2)[0x6]
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(char *)((ushort *)_case8_p2 + 0x3)
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- (char)((ushort *)_case8_p2)[0x3]
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- *(char *)(_case8_p2 + 0x3)
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_low
|
- (char)_case8_p2[0x3]
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_low
)
...>
}


@receiver_6_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_case8_p2 + 0x7)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high
|
- *(byte *)((byte *)_case8_p2 + 0x7)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high
|
- ((byte *)_case8_p2)[0x7]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high
)
...>
}


@receiver_6_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_case8_p2 + 0x7)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high
|
- *(undefined1 *)((byte *)_case8_p2 + 0x7)
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high
|
- ((undefined1 *)_case8_p2)[0x7]
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high
)
...>
}


@receiver_6_w_6_51_address_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_case8_p2 + 0x7)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->link_word_high
|
- &*(char *)((byte *)_case8_p2 + 0x7)
+ (char *)&((uw_object_hdr_t *)_case8_p2)->link_word_high
|
- &((char *)_case8_p2)[0x7]
+ (char *)&((uw_object_hdr_t *)_case8_p2)->link_word_high
)
...>
}


@receiver_6_w_6_51_store_7@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x7) = E;
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high = (byte)E;
|
- *(char *)((byte *)_case8_p2 + 0x7) = E;
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high = (byte)E;
|
- ((char *)_case8_p2)[0x7] = E;
+ ((uw_object_hdr_t *)_case8_p2)->link_word_high = (byte)E;
)
...>
}


@receiver_6_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_case8_p2 + 0x7)
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_high
|
- *(char *)((byte *)_case8_p2 + 0x7)
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_high
|
- ((char *)_case8_p2)[0x7]
+ (char)((uw_object_hdr_t *)_case8_p2)->link_word_high
)
...>
}


@receiver_7_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_0_0_word_ushort@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_word_short@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_address_0@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_store_0@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_address_1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_store_1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_2_17_word_ushort@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_word_short@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_address_2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_store_2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_address_3@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_store_3@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_4_34_word_ushort@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_word_short@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_address_4@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_store_4@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_address_5@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_store_5@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@receiver_7_w_6_51_word_ushort@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_word_short@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_address_6@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_store_6@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_address_7@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_store_7@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_7_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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


@receiver_8_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_0_0_word_ushort@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_word_short@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_address_0@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_store_0@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_address_1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_store_1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_2_17_word_ushort@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_word_short@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_address_2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_store_2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_address_3@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_store_3@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_4_34_word_ushort@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_word_short@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_address_4@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_store_4@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_address_5@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_store_5@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@receiver_8_w_6_51_word_ushort@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_word_short@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_address_6@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_store_6@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_address_7@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_store_7@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_8_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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


@receiver_9_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_0_0_word_ushort@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- pObj[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *pObj
+ ((uw_object_hdr_t *)pObj)->type_flags
)
...>
}


@receiver_9_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *(undefined2 *)((byte *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- ((undefined2 *)pObj)[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *(undefined2 *)((undefined2 *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *(undefined2 *)(pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- pObj[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *pObj
+ ((uw_object_hdr_t *)pObj)->type_flags
)
...>
}


@receiver_9_w_0_0_word_short@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_signed
)
...>
}


@receiver_9_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- (byte)pObj[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- (undefined1)pObj[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_9_w_0_0_address_0@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_low
|
- &*(char *)((byte *)pObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_low
|
- &((char *)pObj)[0x0]
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_low
|
- &*(char *)((ushort *)pObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_low
|
- &*(char *)pObj
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_low
|
- &*(char *)(pObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_9_w_0_0_store_0@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pObj + 0x0) = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_low = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pObj + 0x0)
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
|
- (char)pObj[0x0]
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_0_0_address_1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_high
|
- &*(char *)((byte *)pObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_high
|
- &((char *)pObj)[0x1]
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_high
)
...>
}


@receiver_9_w_0_0_store_1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_9_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_2_17_word_ushort@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- pObj[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word
)
...>
}


@receiver_9_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- *(undefined2 *)((byte *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- ((undefined2 *)pObj)[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word
|
- *(undefined2 *)((undefined2 *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- *(undefined2 *)(pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- pObj[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word
)
...>
}


@receiver_9_w_2_17_word_short@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word_signed
)
...>
}


@receiver_9_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- (byte)pObj[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_9_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- (undefined1)pObj[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_9_w_2_17_address_2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_low
|
- &*(char *)((byte *)pObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_low
|
- &((char *)pObj)[0x2]
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_low
|
- &*(char *)((ushort *)pObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_low
|
- &*(char *)(pObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_9_w_2_17_store_2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pObj + 0x1) = E;
+ ((uw_object_hdr_t *)pObj)->position_word_low = (byte)E;
)
...>
}


@receiver_9_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pObj + 0x1)
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
|
- (char)pObj[0x1]
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_9_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_2_17_address_3@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_high
|
- &*(char *)((byte *)pObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_high
|
- &((char *)pObj)[0x3]
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_high
)
...>
}


@receiver_9_w_2_17_store_3@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_9_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_4_34_word_ushort@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- pObj[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word
)
...>
}


@receiver_9_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- *(undefined2 *)((byte *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- ((undefined2 *)pObj)[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- *(undefined2 *)((undefined2 *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- *(undefined2 *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- pObj[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word
)
...>
}


@receiver_9_w_4_34_word_short@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word_signed
)
...>
}


@receiver_9_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- (byte)pObj[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_9_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- (undefined1)pObj[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_9_w_4_34_address_4@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_low
|
- &*(char *)((byte *)pObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_low
|
- &((char *)pObj)[0x4]
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_low
|
- &*(char *)((ushort *)pObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_low
|
- &*(char *)(pObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_9_w_4_34_store_4@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pObj + 0x2) = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_low = (byte)E;
)
...>
}


@receiver_9_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pObj + 0x2)
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
|
- (char)pObj[0x2]
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_9_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_4_34_address_5@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_high
|
- &*(char *)((byte *)pObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_high
|
- &((char *)pObj)[0x5]
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_high
)
...>
}


@receiver_9_w_4_34_store_5@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_9_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_9_w_6_51_word_ushort@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- pObj[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word
)
...>
}


@receiver_9_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- *(undefined2 *)((byte *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- ((undefined2 *)pObj)[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word
|
- *(undefined2 *)((undefined2 *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- *(undefined2 *)(pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- pObj[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word
)
...>
}


@receiver_9_w_6_51_word_short@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word_signed
)
...>
}


@receiver_9_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- (byte)pObj[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_9_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- (undefined1)pObj[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_9_w_6_51_address_6@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_low
|
- &*(char *)((byte *)pObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_low
|
- &((char *)pObj)[0x6]
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_low
|
- &*(char *)((ushort *)pObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_low
|
- &*(char *)(pObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_9_w_6_51_store_6@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pObj + 0x3) = E;
+ ((uw_object_hdr_t *)pObj)->link_word_low = (byte)E;
)
...>
}


@receiver_9_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pObj + 0x3)
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
|
- (char)pObj[0x3]
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_9_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_6_51_address_7@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_high
|
- &*(char *)((byte *)pObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_high
|
- &((char *)pObj)[0x7]
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_high
)
...>
}


@receiver_9_w_6_51_store_7@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_9_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_10_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_0_0_word_ushort@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
)
...>
}


@receiver_10_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- *(undefined2 *)((byte *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- ((undefined2 *)pbVar5)[0x0]
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- *(undefined2 *)((undefined2 *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- *(undefined2 *)(pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
)
...>
}


@receiver_10_w_0_0_word_short@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_signed
)
...>
}


@receiver_10_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
)
...>
}


@receiver_10_w_0_0_address_0@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- &*(char *)((byte *)pbVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- &((char *)pbVar5)[0x0]
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- &*(char *)((ushort *)pbVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- &*(char *)pbVar5
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- &*(char *)(pbVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- &pbVar5[0x0]
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- &*pbVar5
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_low
)
...>
}


@receiver_10_w_0_0_store_0@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low = (byte)E;
|
- pbVar5[0x0] = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low = (byte)E;
|
- *pbVar5 = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- pbVar5[0x0]
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *pbVar5
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high
)
...>
}


@receiver_10_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high
)
...>
}


@receiver_10_w_0_0_address_1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- &*(char *)((byte *)pbVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- &((char *)pbVar5)[0x1]
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- &*(char *)(pbVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- &pbVar5[0x1]
+ (char *)&((uw_object_hdr_t *)pbVar5)->type_flags_high
)
...>
}


@receiver_10_w_0_0_store_1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high = (byte)E;
|
- pbVar5[0x1] = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- pbVar5[0x1]
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_high
)
...>
}


@receiver_10_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_2_17_word_ushort@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word
)
...>
}


@receiver_10_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- *(undefined2 *)((byte *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- ((undefined2 *)pbVar5)[0x1]
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- *(undefined2 *)((undefined2 *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- *(undefined2 *)(pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word
)
...>
}


@receiver_10_w_2_17_word_short@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_signed
)
...>
}


@receiver_10_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
)
...>
}


@receiver_10_w_2_17_address_2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_low
|
- &*(char *)((byte *)pbVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_low
|
- &((char *)pbVar5)[0x2]
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_low
|
- &*(char *)((ushort *)pbVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_low
|
- &*(char *)(pbVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_low
|
- &pbVar5[0x2]
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_low
)
...>
}


@receiver_10_w_2_17_store_2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_low = (byte)E;
|
- pbVar5[0x2] = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_low = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_low
|
- pbVar5[0x2]
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->position_word_high
)
...>
}


@receiver_10_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->position_word_high
)
...>
}


@receiver_10_w_2_17_address_3@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_high
|
- &*(char *)((byte *)pbVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_high
|
- &((char *)pbVar5)[0x3]
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_high
|
- &*(char *)(pbVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_high
|
- &pbVar5[0x3]
+ (char *)&((uw_object_hdr_t *)pbVar5)->position_word_high
)
...>
}


@receiver_10_w_2_17_store_3@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_high = (byte)E;
|
- pbVar5[0x3] = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_high = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_high
|
- pbVar5[0x3]
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_high
)
...>
}


@receiver_10_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_4_34_word_ushort@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
)
...>
}


@receiver_10_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- *(undefined2 *)((byte *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- ((undefined2 *)pbVar5)[0x2]
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- *(undefined2 *)((undefined2 *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- *(undefined2 *)(pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
)
...>
}


@receiver_10_w_4_34_word_short@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_signed
)
...>
}


@receiver_10_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
)
...>
}


@receiver_10_w_4_34_address_4@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- &*(char *)((byte *)pbVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- &((char *)pbVar5)[0x4]
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- &*(char *)((ushort *)pbVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- &*(char *)(pbVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- &pbVar5[0x4]
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_low
)
...>
}


@receiver_10_w_4_34_store_4@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low = (byte)E;
|
- pbVar5[0x4] = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- pbVar5[0x4]
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar5 + 0x5)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high
)
...>
}


@receiver_10_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar5 + 0x5)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high
)
...>
}


@receiver_10_w_4_34_address_5@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- &*(char *)((byte *)pbVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- &((char *)pbVar5)[0x5]
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- &*(char *)(pbVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- &pbVar5[0x5]
+ (char *)&((uw_object_hdr_t *)pbVar5)->chain_word_high
)
...>
}


@receiver_10_w_4_34_store_5@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high = (byte)E;
|
- pbVar5[0x5] = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- pbVar5[0x5]
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_high
)
...>
}


@receiver_10_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
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

@receiver_10_w_6_51_word_ushort@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word
)
...>
}


@receiver_10_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- *(undefined2 *)((byte *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- ((undefined2 *)pbVar5)[0x3]
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- *(undefined2 *)((undefined2 *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- *(undefined2 *)(pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word
)
...>
}


@receiver_10_w_6_51_word_short@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_signed
)
...>
}


@receiver_10_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
)
...>
}


@receiver_10_w_6_51_address_6@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_low
|
- &*(char *)((byte *)pbVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_low
|
- &((char *)pbVar5)[0x6]
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_low
|
- &*(char *)((ushort *)pbVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_low
|
- &*(char *)(pbVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_low
|
- &pbVar5[0x6]
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_low
)
...>
}


@receiver_10_w_6_51_store_6@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_low = (byte)E;
|
- pbVar5[0x6] = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_low = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_low
|
- pbVar5[0x6]
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar5 + 0x7)
+ ((uw_object_hdr_t *)pbVar5)->link_word_high
)
...>
}


@receiver_10_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar5 + 0x7)
+ ((uw_object_hdr_t *)pbVar5)->link_word_high
)
...>
}


@receiver_10_w_6_51_address_7@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_high
|
- &*(char *)((byte *)pbVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_high
|
- &((char *)pbVar5)[0x7]
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_high
|
- &*(char *)(pbVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_high
|
- &pbVar5[0x7]
+ (char *)&((uw_object_hdr_t *)pbVar5)->link_word_high
)
...>
}


@receiver_10_w_6_51_store_7@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_high = (byte)E;
|
- pbVar5[0x7] = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_high = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar5 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_high
|
- pbVar5[0x7]
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_high
)
...>
}


@receiver_11_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_0_0_word_ushort@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
)
...>
}


@receiver_11_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- *(undefined2 *)((byte *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- ((undefined2 *)pbVar1)[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- *(undefined2 *)((undefined2 *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- *(undefined2 *)(pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
)
...>
}


@receiver_11_w_0_0_word_short@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_signed
)
...>
}


@receiver_11_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- pbVar1[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *pbVar1
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- pbVar1[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *pbVar1
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
)
...>
}


@receiver_11_w_0_0_address_0@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- &*(char *)((byte *)pbVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- &((char *)pbVar1)[0x0]
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- &*(char *)((ushort *)pbVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- &*(char *)pbVar1
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- &*(char *)(pbVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_low
)
...>
}


@receiver_11_w_0_0_store_0@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- pbVar1[0x1]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
)
...>
}


@receiver_11_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- pbVar1[0x1]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
)
...>
}


@receiver_11_w_0_0_address_1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- &*(char *)((byte *)pbVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- &((char *)pbVar1)[0x1]
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- &*(char *)(pbVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar1)->type_flags_high
)
...>
}


@receiver_11_w_0_0_store_1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_high
)
...>
}


@receiver_11_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_2_17_word_ushort@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word
)
...>
}


@receiver_11_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- *(undefined2 *)((byte *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- ((undefined2 *)pbVar1)[0x1]
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- *(undefined2 *)((undefined2 *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- *(undefined2 *)(pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word
)
...>
}


@receiver_11_w_2_17_word_short@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_signed
)
...>
}


@receiver_11_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- pbVar1[0x2]
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
)
...>
}


@receiver_11_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- pbVar1[0x2]
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
)
...>
}


@receiver_11_w_2_17_address_2@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_low
|
- &*(char *)((byte *)pbVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_low
|
- &((char *)pbVar1)[0x2]
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_low
|
- &*(char *)((ushort *)pbVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_low
|
- &*(char *)(pbVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_low
)
...>
}


@receiver_11_w_2_17_store_2@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_11_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_low
)
...>
}


@receiver_11_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
|
- pbVar1[0x3]
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
)
...>
}


@receiver_11_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
|
- pbVar1[0x3]
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
)
...>
}


@receiver_11_w_2_17_address_3@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_high
|
- &*(char *)((byte *)pbVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_high
|
- &((char *)pbVar1)[0x3]
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_high
|
- &*(char *)(pbVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar1)->position_word_high
)
...>
}


@receiver_11_w_2_17_store_3@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_11_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_high
)
...>
}


@receiver_11_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_4_34_word_ushort@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
)
...>
}


@receiver_11_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- *(undefined2 *)((byte *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- ((undefined2 *)pbVar1)[0x2]
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- *(undefined2 *)((undefined2 *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- *(undefined2 *)(pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
)
...>
}


@receiver_11_w_4_34_word_short@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_signed
)
...>
}


@receiver_11_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- pbVar1[0x4]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
)
...>
}


@receiver_11_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- pbVar1[0x4]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
)
...>
}


@receiver_11_w_4_34_address_4@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- &*(char *)((byte *)pbVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- &((char *)pbVar1)[0x4]
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- &*(char *)((ushort *)pbVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- &*(char *)(pbVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_low
)
...>
}


@receiver_11_w_4_34_store_4@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_11_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_low
)
...>
}


@receiver_11_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar1 + 0x5)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- pbVar1[0x5]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
)
...>
}


@receiver_11_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar1 + 0x5)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- pbVar1[0x5]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
)
...>
}


@receiver_11_w_4_34_address_5@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- &*(char *)((byte *)pbVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- &((char *)pbVar1)[0x5]
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- &*(char *)(pbVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar1)->chain_word_high
)
...>
}


@receiver_11_w_4_34_store_5@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_11_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_high
)
...>
}


@receiver_11_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@receiver_11_w_6_51_word_ushort@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word
)
...>
}


@receiver_11_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- *(undefined2 *)((byte *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- ((undefined2 *)pbVar1)[0x3]
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- *(undefined2 *)((undefined2 *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- *(undefined2 *)(pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word
)
...>
}


@receiver_11_w_6_51_word_short@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_signed
)
...>
}


@receiver_11_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- pbVar1[0x6]
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
)
...>
}


@receiver_11_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- pbVar1[0x6]
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
)
...>
}


@receiver_11_w_6_51_address_6@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_low
|
- &*(char *)((byte *)pbVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_low
|
- &((char *)pbVar1)[0x6]
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_low
|
- &*(char *)((ushort *)pbVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_low
|
- &*(char *)(pbVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_low
)
...>
}


@receiver_11_w_6_51_store_6@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_11_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_low
)
...>
}


@receiver_11_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pbVar1 + 0x7)
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
|
- pbVar1[0x7]
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
)
...>
}


@receiver_11_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pbVar1 + 0x7)
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
|
- pbVar1[0x7]
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
)
...>
}


@receiver_11_w_6_51_address_7@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_high
|
- &*(char *)((byte *)pbVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_high
|
- &((char *)pbVar1)[0x7]
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_high
|
- &*(char *)(pbVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar1)->link_word_high
)
...>
}


@receiver_11_w_6_51_store_7@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_11_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pbVar1 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_high
)
...>
}


@receiver_12_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_0_0_word_ushort@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_12_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *(undefined2 *)((byte *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- ((undefined2 *)iVar2)[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}


@receiver_12_w_0_0_word_short@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_12_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_0_0_address_0@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &*(char *)((byte *)iVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &((char *)iVar2)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &*(char *)((ushort *)iVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &*(char *)iVar2
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_12_w_0_0_store_0@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_12_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_0_0_address_1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_high
|
- &*(char *)((byte *)iVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_high
|
- &((char *)iVar2)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_high
)
...>
}


@receiver_12_w_0_0_store_1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_12_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_2_17_word_ushort@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_12_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- *(undefined2 *)((byte *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- ((undefined2 *)iVar2)[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- *(undefined2 *)((undefined2 *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}


@receiver_12_w_2_17_word_short@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_12_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_2_17_address_2@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
|
- &*(char *)((byte *)iVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
|
- &((char *)iVar2)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
|
- &*(char *)((ushort *)iVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_12_w_2_17_store_2@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_12_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_2_17_address_3@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_high
|
- &*(char *)((byte *)iVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_high
|
- &((char *)iVar2)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_high
)
...>
}


@receiver_12_w_2_17_store_3@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_12_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_4_34_word_ushort@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_12_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- *(undefined2 *)((byte *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- ((undefined2 *)iVar2)[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}


@receiver_12_w_4_34_word_short@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_12_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_4_34_address_4@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
|
- &*(char *)((byte *)iVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
|
- &((char *)iVar2)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
|
- &*(char *)((ushort *)iVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_12_w_4_34_store_4@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_12_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_4_34_address_5@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_high
|
- &*(char *)((byte *)iVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_high
|
- &((char *)iVar2)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_high
)
...>
}


@receiver_12_w_4_34_store_5@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_12_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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

@receiver_12_w_6_51_word_ushort@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_12_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- *(undefined2 *)((byte *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- ((undefined2 *)iVar2)[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- *(undefined2 *)((undefined2 *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}


@receiver_12_w_6_51_word_short@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_12_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_6_51_address_6@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
|
- &*(char *)((byte *)iVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
|
- &((char *)iVar2)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
|
- &*(char *)((ushort *)iVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_12_w_6_51_store_6@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_12_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_6_51_address_7@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_high
|
- &*(char *)((byte *)iVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_high
|
- &((char *)iVar2)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_high
)
...>
}


@receiver_12_w_6_51_store_7@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_12_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_13_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNew + 0x0) = (char)V;
- *(char *)((char *)pNew + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNew + 0x0) = (char)V;
- *(byte *)((char *)pNew + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNew + 0x0) = (byte)V;
- *(char *)((char *)pNew + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNew + 0x0) = (byte)V;
- *(byte *)((char *)pNew + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_word_ushort@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- *(ushort *)((byte *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- ((ushort *)pNew)[0x0]
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- *(ushort *)((ushort *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- *(ushort *)(pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags
)
...>
}


@receiver_13_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- *(undefined2 *)((byte *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- ((undefined2 *)pNew)[0x0]
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- *(undefined2 *)((undefined2 *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- *(undefined2 *)(pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags
)
...>
}


@receiver_13_w_0_0_word_short@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_signed
|
- *(short *)((byte *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_signed
|
- ((short *)pNew)[0x0]
+ ((uw_object_hdr_t *)pNew)->type_flags_signed
|
- *(short *)((short *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_signed
|
- *(short *)(pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_signed
)
...>
}


@receiver_13_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(byte *)((byte *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- ((byte *)pNew)[0x0]
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(byte *)((ushort *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- (byte)((ushort *)pNew)[0x0]
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(byte *)pNew
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(byte *)(pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_low
)
...>
}


@receiver_13_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(undefined1 *)((byte *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- ((undefined1 *)pNew)[0x0]
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(undefined1 *)((ushort *)pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- (undefined1)((ushort *)pNew)[0x0]
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(undefined1 *)pNew
+ ((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(undefined1 *)(pNew + 0x0)
+ ((uw_object_hdr_t *)pNew)->type_flags_low
)
...>
}


@receiver_13_w_0_0_address_0@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNew + 0x0)
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_low
|
- &*(char *)((byte *)pNew + 0x0)
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_low
|
- &((char *)pNew)[0x0]
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_low
|
- &*(char *)((ushort *)pNew + 0x0)
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_low
|
- &*(char *)pNew
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_low
|
- &*(char *)(pNew + 0x0)
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_low
|
- &pNew[0x0]
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_low
|
- &*pNew
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_low
)
...>
}


@receiver_13_w_0_0_store_0@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x0) = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pNew + 0x0) = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_low = (byte)E;
|
- ((char *)pNew)[0x0] = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pNew + 0x0) = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_low = (byte)E;
|
- *(char *)pNew = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_low = (byte)E;
|
- *(char *)(pNew + 0x0) = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_low = (byte)E;
|
- pNew[0x0] = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_low = (byte)E;
|
- *pNew = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_low = (byte)E;
)
...>
}


@receiver_13_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x0)
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(char *)((byte *)pNew + 0x0)
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
|
- ((char *)pNew)[0x0]
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(char *)((ushort *)pNew + 0x0)
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
|
- (char)((ushort *)pNew)[0x0]
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(char *)pNew
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
|
- *(char *)(pNew + 0x0)
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
|
- pNew[0x0]
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
|
- *pNew
+ (char)((uw_object_hdr_t *)pNew)->type_flags_low
)
...>
}


@receiver_13_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->type_flags_high
|
- *(byte *)((byte *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->type_flags_high
|
- ((byte *)pNew)[0x1]
+ ((uw_object_hdr_t *)pNew)->type_flags_high
|
- *(byte *)(pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->type_flags_high
)
...>
}


@receiver_13_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->type_flags_high
|
- *(undefined1 *)((byte *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->type_flags_high
|
- ((undefined1 *)pNew)[0x1]
+ ((uw_object_hdr_t *)pNew)->type_flags_high
|
- *(undefined1 *)(pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->type_flags_high
)
...>
}


@receiver_13_w_0_0_address_1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNew + 0x1)
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_high
|
- &*(char *)((byte *)pNew + 0x1)
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_high
|
- &((char *)pNew)[0x1]
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_high
|
- &*(char *)(pNew + 0x1)
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_high
|
- &pNew[0x1]
+ (char *)&((uw_object_hdr_t *)pNew)->type_flags_high
)
...>
}


@receiver_13_w_0_0_store_1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x1) = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pNew + 0x1) = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_high = (byte)E;
|
- ((char *)pNew)[0x1] = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_high = (byte)E;
|
- *(char *)(pNew + 0x1) = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_high = (byte)E;
|
- pNew[0x1] = E;
+ ((uw_object_hdr_t *)pNew)->type_flags_high = (byte)E;
)
...>
}


@receiver_13_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x1)
+ (char)((uw_object_hdr_t *)pNew)->type_flags_high
|
- *(char *)((byte *)pNew + 0x1)
+ (char)((uw_object_hdr_t *)pNew)->type_flags_high
|
- ((char *)pNew)[0x1]
+ (char)((uw_object_hdr_t *)pNew)->type_flags_high
|
- *(char *)(pNew + 0x1)
+ (char)((uw_object_hdr_t *)pNew)->type_flags_high
|
- pNew[0x1]
+ (char)((uw_object_hdr_t *)pNew)->type_flags_high
)
...>
}


@receiver_13_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNew + 0x2) = (char)V;
- *(char *)((char *)pNew + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNew + 0x2) = (char)V;
- *(byte *)((char *)pNew + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNew + 0x2) = (byte)V;
- *(char *)((char *)pNew + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNew + 0x2) = (byte)V;
- *(byte *)((char *)pNew + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_word_ushort@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word
|
- *(ushort *)((byte *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word
|
- ((ushort *)pNew)[0x1]
+ ((uw_object_hdr_t *)pNew)->position_word
|
- *(ushort *)((ushort *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->position_word
|
- *(ushort *)(pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word
)
...>
}


@receiver_13_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word
|
- *(undefined2 *)((byte *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word
|
- ((undefined2 *)pNew)[0x1]
+ ((uw_object_hdr_t *)pNew)->position_word
|
- *(undefined2 *)((undefined2 *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->position_word
|
- *(undefined2 *)(pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word
)
...>
}


@receiver_13_w_2_17_word_short@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_signed
|
- *(short *)((byte *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_signed
|
- ((short *)pNew)[0x1]
+ ((uw_object_hdr_t *)pNew)->position_word_signed
|
- *(short *)((short *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->position_word_signed
|
- *(short *)(pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_signed
)
...>
}


@receiver_13_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- *(byte *)((byte *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- ((byte *)pNew)[0x2]
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- *(byte *)((ushort *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- (byte)((ushort *)pNew)[0x1]
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- *(byte *)(pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_low
)
...>
}


@receiver_13_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- *(undefined1 *)((byte *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- ((undefined1 *)pNew)[0x2]
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- *(undefined1 *)((ushort *)pNew + 0x1)
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- (undefined1)((ushort *)pNew)[0x1]
+ ((uw_object_hdr_t *)pNew)->position_word_low
|
- *(undefined1 *)(pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->position_word_low
)
...>
}


@receiver_13_w_2_17_address_2@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNew + 0x2)
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_low
|
- &*(char *)((byte *)pNew + 0x2)
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_low
|
- &((char *)pNew)[0x2]
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_low
|
- &*(char *)((ushort *)pNew + 0x1)
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_low
|
- &*(char *)(pNew + 0x2)
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_low
|
- &pNew[0x2]
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_low
)
...>
}


@receiver_13_w_2_17_store_2@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x2) = E;
+ ((uw_object_hdr_t *)pNew)->position_word_low = (byte)E;
|
- *(char *)((byte *)pNew + 0x2) = E;
+ ((uw_object_hdr_t *)pNew)->position_word_low = (byte)E;
|
- ((char *)pNew)[0x2] = E;
+ ((uw_object_hdr_t *)pNew)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pNew + 0x1) = E;
+ ((uw_object_hdr_t *)pNew)->position_word_low = (byte)E;
|
- *(char *)(pNew + 0x2) = E;
+ ((uw_object_hdr_t *)pNew)->position_word_low = (byte)E;
|
- pNew[0x2] = E;
+ ((uw_object_hdr_t *)pNew)->position_word_low = (byte)E;
)
...>
}


@receiver_13_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x2)
+ (char)((uw_object_hdr_t *)pNew)->position_word_low
|
- *(char *)((byte *)pNew + 0x2)
+ (char)((uw_object_hdr_t *)pNew)->position_word_low
|
- ((char *)pNew)[0x2]
+ (char)((uw_object_hdr_t *)pNew)->position_word_low
|
- *(char *)((ushort *)pNew + 0x1)
+ (char)((uw_object_hdr_t *)pNew)->position_word_low
|
- (char)((ushort *)pNew)[0x1]
+ (char)((uw_object_hdr_t *)pNew)->position_word_low
|
- *(char *)(pNew + 0x2)
+ (char)((uw_object_hdr_t *)pNew)->position_word_low
|
- pNew[0x2]
+ (char)((uw_object_hdr_t *)pNew)->position_word_low
)
...>
}


@receiver_13_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->position_word_high
|
- *(byte *)((byte *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->position_word_high
|
- ((byte *)pNew)[0x3]
+ ((uw_object_hdr_t *)pNew)->position_word_high
|
- *(byte *)(pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->position_word_high
)
...>
}


@receiver_13_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->position_word_high
|
- *(undefined1 *)((byte *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->position_word_high
|
- ((undefined1 *)pNew)[0x3]
+ ((uw_object_hdr_t *)pNew)->position_word_high
|
- *(undefined1 *)(pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->position_word_high
)
...>
}


@receiver_13_w_2_17_address_3@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNew + 0x3)
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_high
|
- &*(char *)((byte *)pNew + 0x3)
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_high
|
- &((char *)pNew)[0x3]
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_high
|
- &*(char *)(pNew + 0x3)
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_high
|
- &pNew[0x3]
+ (char *)&((uw_object_hdr_t *)pNew)->position_word_high
)
...>
}


@receiver_13_w_2_17_store_3@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x3) = E;
+ ((uw_object_hdr_t *)pNew)->position_word_high = (byte)E;
|
- *(char *)((byte *)pNew + 0x3) = E;
+ ((uw_object_hdr_t *)pNew)->position_word_high = (byte)E;
|
- ((char *)pNew)[0x3] = E;
+ ((uw_object_hdr_t *)pNew)->position_word_high = (byte)E;
|
- *(char *)(pNew + 0x3) = E;
+ ((uw_object_hdr_t *)pNew)->position_word_high = (byte)E;
|
- pNew[0x3] = E;
+ ((uw_object_hdr_t *)pNew)->position_word_high = (byte)E;
)
...>
}


@receiver_13_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x3)
+ (char)((uw_object_hdr_t *)pNew)->position_word_high
|
- *(char *)((byte *)pNew + 0x3)
+ (char)((uw_object_hdr_t *)pNew)->position_word_high
|
- ((char *)pNew)[0x3]
+ (char)((uw_object_hdr_t *)pNew)->position_word_high
|
- *(char *)(pNew + 0x3)
+ (char)((uw_object_hdr_t *)pNew)->position_word_high
|
- pNew[0x3]
+ (char)((uw_object_hdr_t *)pNew)->position_word_high
)
...>
}


@receiver_13_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNew + 0x4) = (char)V;
- *(char *)((char *)pNew + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNew + 0x4) = (char)V;
- *(byte *)((char *)pNew + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNew + 0x4) = (byte)V;
- *(char *)((char *)pNew + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNew + 0x4) = (byte)V;
- *(byte *)((char *)pNew + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_word_ushort@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- *(ushort *)((byte *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- ((ushort *)pNew)[0x2]
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- *(ushort *)((ushort *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- *(ushort *)(pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word
)
...>
}


@receiver_13_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- *(undefined2 *)((byte *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- ((undefined2 *)pNew)[0x2]
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- *(undefined2 *)((undefined2 *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- *(undefined2 *)(pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word
)
...>
}


@receiver_13_w_4_34_word_short@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_signed
|
- *(short *)((byte *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_signed
|
- ((short *)pNew)[0x2]
+ ((uw_object_hdr_t *)pNew)->chain_word_signed
|
- *(short *)((short *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->chain_word_signed
|
- *(short *)(pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_signed
)
...>
}


@receiver_13_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(byte *)((byte *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- ((byte *)pNew)[0x4]
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(byte *)((ushort *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- (byte)((ushort *)pNew)[0x2]
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(byte *)(pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_low
)
...>
}


@receiver_13_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(undefined1 *)((byte *)pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- ((undefined1 *)pNew)[0x4]
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(undefined1 *)((ushort *)pNew + 0x2)
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- (undefined1)((ushort *)pNew)[0x2]
+ ((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(undefined1 *)(pNew + 0x4)
+ ((uw_object_hdr_t *)pNew)->chain_word_low
)
...>
}


@receiver_13_w_4_34_address_4@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNew + 0x4)
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_low
|
- &*(char *)((byte *)pNew + 0x4)
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_low
|
- &((char *)pNew)[0x4]
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_low
|
- &*(char *)((ushort *)pNew + 0x2)
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_low
|
- &*(char *)(pNew + 0x4)
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_low
|
- &pNew[0x4]
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_low
)
...>
}


@receiver_13_w_4_34_store_4@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x4) = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pNew + 0x4) = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_low = (byte)E;
|
- ((char *)pNew)[0x4] = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pNew + 0x2) = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_low = (byte)E;
|
- *(char *)(pNew + 0x4) = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_low = (byte)E;
|
- pNew[0x4] = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_low = (byte)E;
)
...>
}


@receiver_13_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x4)
+ (char)((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(char *)((byte *)pNew + 0x4)
+ (char)((uw_object_hdr_t *)pNew)->chain_word_low
|
- ((char *)pNew)[0x4]
+ (char)((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(char *)((ushort *)pNew + 0x2)
+ (char)((uw_object_hdr_t *)pNew)->chain_word_low
|
- (char)((ushort *)pNew)[0x2]
+ (char)((uw_object_hdr_t *)pNew)->chain_word_low
|
- *(char *)(pNew + 0x4)
+ (char)((uw_object_hdr_t *)pNew)->chain_word_low
|
- pNew[0x4]
+ (char)((uw_object_hdr_t *)pNew)->chain_word_low
)
...>
}


@receiver_13_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNew + 0x5)
+ ((uw_object_hdr_t *)pNew)->chain_word_high
|
- *(byte *)((byte *)pNew + 0x5)
+ ((uw_object_hdr_t *)pNew)->chain_word_high
|
- ((byte *)pNew)[0x5]
+ ((uw_object_hdr_t *)pNew)->chain_word_high
|
- *(byte *)(pNew + 0x5)
+ ((uw_object_hdr_t *)pNew)->chain_word_high
)
...>
}


@receiver_13_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNew + 0x5)
+ ((uw_object_hdr_t *)pNew)->chain_word_high
|
- *(undefined1 *)((byte *)pNew + 0x5)
+ ((uw_object_hdr_t *)pNew)->chain_word_high
|
- ((undefined1 *)pNew)[0x5]
+ ((uw_object_hdr_t *)pNew)->chain_word_high
|
- *(undefined1 *)(pNew + 0x5)
+ ((uw_object_hdr_t *)pNew)->chain_word_high
)
...>
}


@receiver_13_w_4_34_address_5@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNew + 0x5)
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_high
|
- &*(char *)((byte *)pNew + 0x5)
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_high
|
- &((char *)pNew)[0x5]
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_high
|
- &*(char *)(pNew + 0x5)
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_high
|
- &pNew[0x5]
+ (char *)&((uw_object_hdr_t *)pNew)->chain_word_high
)
...>
}


@receiver_13_w_4_34_store_5@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x5) = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pNew + 0x5) = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_high = (byte)E;
|
- ((char *)pNew)[0x5] = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_high = (byte)E;
|
- *(char *)(pNew + 0x5) = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_high = (byte)E;
|
- pNew[0x5] = E;
+ ((uw_object_hdr_t *)pNew)->chain_word_high = (byte)E;
)
...>
}


@receiver_13_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x5)
+ (char)((uw_object_hdr_t *)pNew)->chain_word_high
|
- *(char *)((byte *)pNew + 0x5)
+ (char)((uw_object_hdr_t *)pNew)->chain_word_high
|
- ((char *)pNew)[0x5]
+ (char)((uw_object_hdr_t *)pNew)->chain_word_high
|
- *(char *)(pNew + 0x5)
+ (char)((uw_object_hdr_t *)pNew)->chain_word_high
|
- pNew[0x5]
+ (char)((uw_object_hdr_t *)pNew)->chain_word_high
)
...>
}


@receiver_13_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNew + 0x6) = (char)V;
- *(char *)((char *)pNew + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNew + 0x6) = (char)V;
- *(byte *)((char *)pNew + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNew + 0x6) = (byte)V;
- *(char *)((char *)pNew + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNew + 0x6) = (byte)V;
- *(byte *)((char *)pNew + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNew)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_word_ushort@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word
|
- *(ushort *)((byte *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word
|
- ((ushort *)pNew)[0x3]
+ ((uw_object_hdr_t *)pNew)->link_word
|
- *(ushort *)((ushort *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->link_word
|
- *(ushort *)(pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word
)
...>
}


@receiver_13_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word
|
- *(undefined2 *)((byte *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word
|
- ((undefined2 *)pNew)[0x3]
+ ((uw_object_hdr_t *)pNew)->link_word
|
- *(undefined2 *)((undefined2 *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->link_word
|
- *(undefined2 *)(pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word
)
...>
}


@receiver_13_w_6_51_word_short@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_signed
|
- *(short *)((byte *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_signed
|
- ((short *)pNew)[0x3]
+ ((uw_object_hdr_t *)pNew)->link_word_signed
|
- *(short *)((short *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->link_word_signed
|
- *(short *)(pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_signed
)
...>
}


@receiver_13_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- *(byte *)((byte *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- ((byte *)pNew)[0x6]
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- *(byte *)((ushort *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- (byte)((ushort *)pNew)[0x3]
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- *(byte *)(pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_low
)
...>
}


@receiver_13_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- *(undefined1 *)((byte *)pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- ((undefined1 *)pNew)[0x6]
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- *(undefined1 *)((ushort *)pNew + 0x3)
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- (undefined1)((ushort *)pNew)[0x3]
+ ((uw_object_hdr_t *)pNew)->link_word_low
|
- *(undefined1 *)(pNew + 0x6)
+ ((uw_object_hdr_t *)pNew)->link_word_low
)
...>
}


@receiver_13_w_6_51_address_6@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNew + 0x6)
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_low
|
- &*(char *)((byte *)pNew + 0x6)
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_low
|
- &((char *)pNew)[0x6]
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_low
|
- &*(char *)((ushort *)pNew + 0x3)
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_low
|
- &*(char *)(pNew + 0x6)
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_low
|
- &pNew[0x6]
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_low
)
...>
}


@receiver_13_w_6_51_store_6@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x6) = E;
+ ((uw_object_hdr_t *)pNew)->link_word_low = (byte)E;
|
- *(char *)((byte *)pNew + 0x6) = E;
+ ((uw_object_hdr_t *)pNew)->link_word_low = (byte)E;
|
- ((char *)pNew)[0x6] = E;
+ ((uw_object_hdr_t *)pNew)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pNew + 0x3) = E;
+ ((uw_object_hdr_t *)pNew)->link_word_low = (byte)E;
|
- *(char *)(pNew + 0x6) = E;
+ ((uw_object_hdr_t *)pNew)->link_word_low = (byte)E;
|
- pNew[0x6] = E;
+ ((uw_object_hdr_t *)pNew)->link_word_low = (byte)E;
)
...>
}


@receiver_13_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x6)
+ (char)((uw_object_hdr_t *)pNew)->link_word_low
|
- *(char *)((byte *)pNew + 0x6)
+ (char)((uw_object_hdr_t *)pNew)->link_word_low
|
- ((char *)pNew)[0x6]
+ (char)((uw_object_hdr_t *)pNew)->link_word_low
|
- *(char *)((ushort *)pNew + 0x3)
+ (char)((uw_object_hdr_t *)pNew)->link_word_low
|
- (char)((ushort *)pNew)[0x3]
+ (char)((uw_object_hdr_t *)pNew)->link_word_low
|
- *(char *)(pNew + 0x6)
+ (char)((uw_object_hdr_t *)pNew)->link_word_low
|
- pNew[0x6]
+ (char)((uw_object_hdr_t *)pNew)->link_word_low
)
...>
}


@receiver_13_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNew + 0x7)
+ ((uw_object_hdr_t *)pNew)->link_word_high
|
- *(byte *)((byte *)pNew + 0x7)
+ ((uw_object_hdr_t *)pNew)->link_word_high
|
- ((byte *)pNew)[0x7]
+ ((uw_object_hdr_t *)pNew)->link_word_high
|
- *(byte *)(pNew + 0x7)
+ ((uw_object_hdr_t *)pNew)->link_word_high
)
...>
}


@receiver_13_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNew + 0x7)
+ ((uw_object_hdr_t *)pNew)->link_word_high
|
- *(undefined1 *)((byte *)pNew + 0x7)
+ ((uw_object_hdr_t *)pNew)->link_word_high
|
- ((undefined1 *)pNew)[0x7]
+ ((uw_object_hdr_t *)pNew)->link_word_high
|
- *(undefined1 *)(pNew + 0x7)
+ ((uw_object_hdr_t *)pNew)->link_word_high
)
...>
}


@receiver_13_w_6_51_address_7@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNew + 0x7)
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_high
|
- &*(char *)((byte *)pNew + 0x7)
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_high
|
- &((char *)pNew)[0x7]
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_high
|
- &*(char *)(pNew + 0x7)
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_high
|
- &pNew[0x7]
+ (char *)&((uw_object_hdr_t *)pNew)->link_word_high
)
...>
}


@receiver_13_w_6_51_store_7@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x7) = E;
+ ((uw_object_hdr_t *)pNew)->link_word_high = (byte)E;
|
- *(char *)((byte *)pNew + 0x7) = E;
+ ((uw_object_hdr_t *)pNew)->link_word_high = (byte)E;
|
- ((char *)pNew)[0x7] = E;
+ ((uw_object_hdr_t *)pNew)->link_word_high = (byte)E;
|
- *(char *)(pNew + 0x7) = E;
+ ((uw_object_hdr_t *)pNew)->link_word_high = (byte)E;
|
- pNew[0x7] = E;
+ ((uw_object_hdr_t *)pNew)->link_word_high = (byte)E;
)
...>
}


@receiver_13_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNew + 0x7)
+ (char)((uw_object_hdr_t *)pNew)->link_word_high
|
- *(char *)((byte *)pNew + 0x7)
+ (char)((uw_object_hdr_t *)pNew)->link_word_high
|
- ((char *)pNew)[0x7]
+ (char)((uw_object_hdr_t *)pNew)->link_word_high
|
- *(char *)(pNew + 0x7)
+ (char)((uw_object_hdr_t *)pNew)->link_word_high
|
- pNew[0x7]
+ (char)((uw_object_hdr_t *)pNew)->link_word_high
)
...>
}


@receiver_14_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_0_0_word_ushort@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_14_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(undefined2 *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- ((undefined2 *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
)
...>
}


@receiver_14_w_0_0_word_short@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_14_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_0_0_address_0@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &*(char *)((byte *)iVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &((char *)iVar3)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &*(char *)((ushort *)iVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &*(char *)iVar3
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_14_w_0_0_store_0@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_14_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_0_0_address_1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_high
|
- &*(char *)((byte *)iVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_high
|
- &((char *)iVar3)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_14_w_0_0_store_1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_14_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_2_17_word_ushort@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_14_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(undefined2 *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- ((undefined2 *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(undefined2 *)((undefined2 *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word
)
...>
}


@receiver_14_w_2_17_word_short@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_14_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_2_17_address_2@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
|
- &*(char *)((byte *)iVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
|
- &((char *)iVar3)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
|
- &*(char *)((ushort *)iVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_14_w_2_17_store_2@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_14_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_2_17_address_3@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_high
|
- &*(char *)((byte *)iVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_high
|
- &((char *)iVar3)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_14_w_2_17_store_3@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_14_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_4_34_word_ushort@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_14_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(undefined2 *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- ((undefined2 *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word
)
...>
}


@receiver_14_w_4_34_word_short@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_14_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_4_34_address_4@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
|
- &*(char *)((byte *)iVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
|
- &((char *)iVar3)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
|
- &*(char *)((ushort *)iVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_14_w_4_34_store_4@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_14_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_4_34_address_5@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_high
|
- &*(char *)((byte *)iVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_high
|
- &((char *)iVar3)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_14_w_4_34_store_5@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_14_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@receiver_14_w_6_51_word_ushort@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_14_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(undefined2 *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- ((undefined2 *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(undefined2 *)((undefined2 *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word
)
...>
}


@receiver_14_w_6_51_word_short@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_14_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_6_51_address_6@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
|
- &*(char *)((byte *)iVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
|
- &((char *)iVar3)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
|
- &*(char *)((ushort *)iVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_14_w_6_51_store_6@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_14_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_14_w_6_51_address_7@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_high
|
- &*(char *)((byte *)iVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_high
|
- &((char *)iVar3)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_14_w_6_51_store_7@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_14_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_15_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_0_0_word_ushort@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}


@receiver_15_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *(undefined2 *)((byte *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- ((undefined2 *)iVar2)[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *(undefined2 *)(iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}


@receiver_15_w_0_0_word_short@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_signed
)
...>
}


@receiver_15_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_15_w_0_0_address_0@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &*(char *)((byte *)iVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &((char *)iVar2)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &*(char *)((ushort *)iVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &*(char *)iVar2
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &*(char *)(iVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &iVar2[0x0]
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
|
- &*iVar2
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_15_w_0_0_store_0@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_low = (byte)E;
|
- iVar2[0x0] = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_low = (byte)E;
|
- *iVar2 = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x0)
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
|
- iVar2[0x0]
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *iVar2
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->type_flags_high
)
...>
}


@receiver_15_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->type_flags_high
)
...>
}


@receiver_15_w_0_0_address_1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_high
|
- &*(char *)((byte *)iVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_high
|
- &((char *)iVar2)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_high
|
- &*(char *)(iVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_high
|
- &iVar2[0x1]
+ (char *)&((uw_object_hdr_t *)iVar2)->type_flags_high
)
...>
}


@receiver_15_w_0_0_store_1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_high = (byte)E;
|
- iVar2[0x1] = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_high = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x1)
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_high
|
- iVar2[0x1]
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_high
)
...>
}


@receiver_15_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_2_17_word_ushort@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}


@receiver_15_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- *(undefined2 *)((byte *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- ((undefined2 *)iVar2)[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- *(undefined2 *)((undefined2 *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- *(undefined2 *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}


@receiver_15_w_2_17_word_short@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_signed
)
...>
}


@receiver_15_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_15_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_15_w_2_17_address_2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
|
- &*(char *)((byte *)iVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
|
- &((char *)iVar2)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
|
- &*(char *)((ushort *)iVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
|
- &*(char *)(iVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
|
- &iVar2[0x2]
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_15_w_2_17_store_2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_low = (byte)E;
|
- iVar2[0x2] = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_15_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x2)
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
|
- iVar2[0x2]
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_15_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->position_word_high
)
...>
}


@receiver_15_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->position_word_high
)
...>
}


@receiver_15_w_2_17_address_3@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_high
|
- &*(char *)((byte *)iVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_high
|
- &((char *)iVar2)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_high
|
- &*(char *)(iVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_high
|
- &iVar2[0x3]
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_high
)
...>
}


@receiver_15_w_2_17_store_3@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_high = (byte)E;
|
- iVar2[0x3] = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_high = (byte)E;
)
...>
}


@receiver_15_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x3)
+ (char)((uw_object_hdr_t *)iVar2)->position_word_high
|
- iVar2[0x3]
+ (char)((uw_object_hdr_t *)iVar2)->position_word_high
)
...>
}


@receiver_15_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_4_34_word_ushort@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}


@receiver_15_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- *(undefined2 *)((byte *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- ((undefined2 *)iVar2)[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- *(undefined2 *)(iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}


@receiver_15_w_4_34_word_short@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_signed
)
...>
}


@receiver_15_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_15_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_15_w_4_34_address_4@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
|
- &*(char *)((byte *)iVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
|
- &((char *)iVar2)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
|
- &*(char *)((ushort *)iVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
|
- &*(char *)(iVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
|
- &iVar2[0x4]
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_15_w_4_34_store_4@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_low = (byte)E;
|
- iVar2[0x4] = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_15_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x4)
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
|
- iVar2[0x4]
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_15_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar2 + 0x5)
+ ((uw_object_hdr_t *)iVar2)->chain_word_high
)
...>
}


@receiver_15_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar2 + 0x5)
+ ((uw_object_hdr_t *)iVar2)->chain_word_high
)
...>
}


@receiver_15_w_4_34_address_5@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_high
|
- &*(char *)((byte *)iVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_high
|
- &((char *)iVar2)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_high
|
- &*(char *)(iVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_high
|
- &iVar2[0x5]
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_high
)
...>
}


@receiver_15_w_4_34_store_5@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_high = (byte)E;
|
- iVar2[0x5] = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_high = (byte)E;
)
...>
}


@receiver_15_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x5)
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_high
|
- iVar2[0x5]
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_high
)
...>
}


@receiver_15_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@receiver_15_w_6_51_word_ushort@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}


@receiver_15_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- *(undefined2 *)((byte *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- ((undefined2 *)iVar2)[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- *(undefined2 *)((undefined2 *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- *(undefined2 *)(iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}


@receiver_15_w_6_51_word_short@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_signed
)
...>
}


@receiver_15_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_15_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_15_w_6_51_address_6@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
|
- &*(char *)((byte *)iVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
|
- &((char *)iVar2)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
|
- &*(char *)((ushort *)iVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
|
- &*(char *)(iVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
|
- &iVar2[0x6]
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_15_w_6_51_store_6@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_low = (byte)E;
|
- iVar2[0x6] = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_15_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x6)
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
|
- iVar2[0x6]
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_15_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar2 + 0x7)
+ ((uw_object_hdr_t *)iVar2)->link_word_high
)
...>
}


@receiver_15_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar2 + 0x7)
+ ((uw_object_hdr_t *)iVar2)->link_word_high
)
...>
}


@receiver_15_w_6_51_address_7@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_high
|
- &*(char *)((byte *)iVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_high
|
- &((char *)iVar2)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_high
|
- &*(char *)(iVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_high
|
- &iVar2[0x7]
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_high
)
...>
}


@receiver_15_w_6_51_store_7@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_high = (byte)E;
|
- iVar2[0x7] = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_high = (byte)E;
)
...>
}


@receiver_15_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar2 + 0x7)
+ (char)((uw_object_hdr_t *)iVar2)->link_word_high
|
- iVar2[0x7]
+ (char)((uw_object_hdr_t *)iVar2)->link_word_high
)
...>
}


@receiver_16_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_0_0_word_ushort@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_word_short@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_address_0@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_store_0@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_address_1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_store_1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_2_17_word_ushort@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_word_short@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_address_2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_store_2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_address_3@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_store_3@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_4_34_word_ushort@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_word_short@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_address_4@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_store_4@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_address_5@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_store_5@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_16_w_6_51_word_ushort@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_word_short@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_address_6@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_store_6@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_address_7@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_store_7@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_16_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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


@receiver_17_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_0_0_word_ushort@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- puVar3[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}


@receiver_17_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(undefined2 *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- ((undefined2 *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(undefined2 *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- puVar3[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}


@receiver_17_w_0_0_word_short@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
)
...>
}


@receiver_17_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (byte)puVar3[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_17_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (undefined1)puVar3[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_17_w_0_0_address_0@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)((byte *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &((char *)puVar3)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)((ushort *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)puVar3
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)(puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_17_w_0_0_store_0@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_17_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (char)puVar3[0x0]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_17_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_0_0_address_1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
|
- &*(char *)((byte *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
|
- &((char *)puVar3)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@receiver_17_w_0_0_store_1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_17_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_2_17_word_ushort@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- puVar3[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}


@receiver_17_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(undefined2 *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- ((undefined2 *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(undefined2 *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- puVar3[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}


@receiver_17_w_2_17_word_short@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
)
...>
}


@receiver_17_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (byte)puVar3[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_17_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (undefined1)puVar3[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_17_w_2_17_address_2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &*(char *)((byte *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &((char *)puVar3)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &*(char *)((ushort *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &*(char *)(puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_17_w_2_17_store_2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_17_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- (char)puVar3[0x1]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_17_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_2_17_address_3@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
|
- &*(char *)((byte *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
|
- &((char *)puVar3)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@receiver_17_w_2_17_store_3@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_17_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_4_34_word_ushort@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- puVar3[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}


@receiver_17_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(undefined2 *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- ((undefined2 *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(undefined2 *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- puVar3[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}


@receiver_17_w_4_34_word_short@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
)
...>
}


@receiver_17_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (byte)puVar3[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_17_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (undefined1)puVar3[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_17_w_4_34_address_4@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &*(char *)((byte *)puVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &((char *)puVar3)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &*(char *)((ushort *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &*(char *)(puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_17_w_4_34_store_4@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_17_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (char)puVar3[0x2]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_17_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_4_34_address_5@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
|
- &*(char *)((byte *)puVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
|
- &((char *)puVar3)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@receiver_17_w_4_34_store_5@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_17_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@receiver_17_w_6_51_word_ushort@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- puVar3[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}


@receiver_17_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(undefined2 *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- ((undefined2 *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(undefined2 *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- puVar3[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}


@receiver_17_w_6_51_word_short@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
)
...>
}


@receiver_17_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (byte)puVar3[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_17_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (undefined1)puVar3[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_17_w_6_51_address_6@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &*(char *)((byte *)puVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &((char *)puVar3)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &*(char *)((ushort *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &*(char *)(puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_17_w_6_51_store_6@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_17_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- (char)puVar3[0x3]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_17_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_17_w_6_51_address_7@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
|
- &*(char *)((byte *)puVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
|
- &((char *)puVar3)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@receiver_17_w_6_51_store_7@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_17_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
