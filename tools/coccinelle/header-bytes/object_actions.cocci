@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((undefined2 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((undefined2 *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((byte *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &((char *)object)[0x0]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((ushort *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)object
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)(object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)object[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &*(char *)((byte *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &((char *)object)[0x1]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- object[0x1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((undefined2 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((undefined2 *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- object[0x1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
)
...>
}


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)object[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)object[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((byte *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &((char *)object)[0x2]
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((ushort *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)(object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)object[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &*(char *)((byte *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &((char *)object)[0x3]
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((undefined2 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((undefined2 *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
)
...>
}


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((byte *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &((char *)object)[0x4]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((ushort *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)(object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)object[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &*(char *)((byte *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &((char *)object)[0x5]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- object[0x3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((undefined2 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((undefined2 *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- object[0x3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
)
...>
}


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)object[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)object[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((byte *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &((char *)object)[0x6]
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((ushort *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)(object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)object[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &*(char *)((byte *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &((char *)object)[0x7]
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)reference + 0x0) = (char)V;
- *(char *)((char *)reference + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)reference)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)reference + 0x0) = (char)V;
- *(byte *)((char *)reference + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)reference)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)reference + 0x0) = (byte)V;
- *(char *)((char *)reference + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)reference)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)reference + 0x0) = (byte)V;
- *(byte *)((char *)reference + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)reference)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *(ushort *)((byte *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- ((ushort *)reference)[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *(ushort *)((ushort *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *(ushort *)(reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- reference[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *reference
+ ((uw_object_hdr_t *)reference)->type_flags
)
...>
}


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *(undefined2 *)((byte *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- ((undefined2 *)reference)[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *(undefined2 *)((undefined2 *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *(undefined2 *)(reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- reference[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *reference
+ ((uw_object_hdr_t *)reference)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_signed
|
- *(short *)((byte *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_signed
|
- ((short *)reference)[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags_signed
|
- *(short *)((short *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_signed
|
- *(short *)(reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- *(byte *)((byte *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- ((byte *)reference)[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- *(byte *)((ushort *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- (byte)((ushort *)reference)[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- *(byte *)reference
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- *(byte *)(reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- (byte)reference[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- *(undefined1 *)((byte *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- ((undefined1 *)reference)[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- *(undefined1 *)((ushort *)reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- (undefined1)((ushort *)reference)[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- *(undefined1 *)reference
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- *(undefined1 *)(reference + 0x0)
+ ((uw_object_hdr_t *)reference)->type_flags_low
|
- (undefined1)reference[0x0]
+ ((uw_object_hdr_t *)reference)->type_flags_low
)
...>
}


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)reference + 0x0)
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_low
|
- &*(char *)((byte *)reference + 0x0)
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_low
|
- &((char *)reference)[0x0]
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_low
|
- &*(char *)((ushort *)reference + 0x0)
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_low
|
- &*(char *)reference
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_low
|
- &*(char *)(reference + 0x0)
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x0) = E;
+ ((uw_object_hdr_t *)reference)->type_flags_low = (byte)E;
|
- *(char *)((byte *)reference + 0x0) = E;
+ ((uw_object_hdr_t *)reference)->type_flags_low = (byte)E;
|
- ((char *)reference)[0x0] = E;
+ ((uw_object_hdr_t *)reference)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)reference + 0x0) = E;
+ ((uw_object_hdr_t *)reference)->type_flags_low = (byte)E;
|
- *(char *)reference = E;
+ ((uw_object_hdr_t *)reference)->type_flags_low = (byte)E;
|
- *(char *)(reference + 0x0) = E;
+ ((uw_object_hdr_t *)reference)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x0)
+ (char)((uw_object_hdr_t *)reference)->type_flags_low
|
- *(char *)((byte *)reference + 0x0)
+ (char)((uw_object_hdr_t *)reference)->type_flags_low
|
- ((char *)reference)[0x0]
+ (char)((uw_object_hdr_t *)reference)->type_flags_low
|
- *(char *)((ushort *)reference + 0x0)
+ (char)((uw_object_hdr_t *)reference)->type_flags_low
|
- (char)((ushort *)reference)[0x0]
+ (char)((uw_object_hdr_t *)reference)->type_flags_low
|
- *(char *)reference
+ (char)((uw_object_hdr_t *)reference)->type_flags_low
|
- *(char *)(reference + 0x0)
+ (char)((uw_object_hdr_t *)reference)->type_flags_low
|
- (char)reference[0x0]
+ (char)((uw_object_hdr_t *)reference)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->type_flags_high
|
- *(byte *)((byte *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->type_flags_high
|
- ((byte *)reference)[0x1]
+ ((uw_object_hdr_t *)reference)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->type_flags_high
|
- *(undefined1 *)((byte *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->type_flags_high
|
- ((undefined1 *)reference)[0x1]
+ ((uw_object_hdr_t *)reference)->type_flags_high
)
...>
}


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)reference + 0x1)
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_high
|
- &*(char *)((byte *)reference + 0x1)
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_high
|
- &((char *)reference)[0x1]
+ (char *)&((uw_object_hdr_t *)reference)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x1) = E;
+ ((uw_object_hdr_t *)reference)->type_flags_high = (byte)E;
|
- *(char *)((byte *)reference + 0x1) = E;
+ ((uw_object_hdr_t *)reference)->type_flags_high = (byte)E;
|
- ((char *)reference)[0x1] = E;
+ ((uw_object_hdr_t *)reference)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x1)
+ (char)((uw_object_hdr_t *)reference)->type_flags_high
|
- *(char *)((byte *)reference + 0x1)
+ (char)((uw_object_hdr_t *)reference)->type_flags_high
|
- ((char *)reference)[0x1]
+ (char)((uw_object_hdr_t *)reference)->type_flags_high
)
...>
}


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)reference + 0x2) = (char)V;
- *(char *)((char *)reference + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)reference)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)reference + 0x2) = (char)V;
- *(byte *)((char *)reference + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)reference)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)reference + 0x2) = (byte)V;
- *(char *)((char *)reference + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)reference)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)reference + 0x2) = (byte)V;
- *(byte *)((char *)reference + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)reference)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word
|
- *(ushort *)((byte *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word
|
- ((ushort *)reference)[0x1]
+ ((uw_object_hdr_t *)reference)->position_word
|
- *(ushort *)((ushort *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word
|
- *(ushort *)(reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word
|
- reference[0x1]
+ ((uw_object_hdr_t *)reference)->position_word
)
...>
}


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word
|
- *(undefined2 *)((byte *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word
|
- ((undefined2 *)reference)[0x1]
+ ((uw_object_hdr_t *)reference)->position_word
|
- *(undefined2 *)((undefined2 *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word
|
- *(undefined2 *)(reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word
|
- reference[0x1]
+ ((uw_object_hdr_t *)reference)->position_word
)
...>
}


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word_signed
|
- *(short *)((byte *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word_signed
|
- ((short *)reference)[0x1]
+ ((uw_object_hdr_t *)reference)->position_word_signed
|
- *(short *)((short *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word_signed
|
- *(short *)(reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word_signed
)
...>
}


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- *(byte *)((byte *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- ((byte *)reference)[0x2]
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- *(byte *)((ushort *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- (byte)((ushort *)reference)[0x1]
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- *(byte *)(reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- (byte)reference[0x1]
+ ((uw_object_hdr_t *)reference)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- *(undefined1 *)((byte *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- ((undefined1 *)reference)[0x2]
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- *(undefined1 *)((ushort *)reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- (undefined1)((ushort *)reference)[0x1]
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- *(undefined1 *)(reference + 0x1)
+ ((uw_object_hdr_t *)reference)->position_word_low
|
- (undefined1)reference[0x1]
+ ((uw_object_hdr_t *)reference)->position_word_low
)
...>
}


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)reference + 0x2)
+ (char *)&((uw_object_hdr_t *)reference)->position_word_low
|
- &*(char *)((byte *)reference + 0x2)
+ (char *)&((uw_object_hdr_t *)reference)->position_word_low
|
- &((char *)reference)[0x2]
+ (char *)&((uw_object_hdr_t *)reference)->position_word_low
|
- &*(char *)((ushort *)reference + 0x1)
+ (char *)&((uw_object_hdr_t *)reference)->position_word_low
|
- &*(char *)(reference + 0x1)
+ (char *)&((uw_object_hdr_t *)reference)->position_word_low
)
...>
}


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x2) = E;
+ ((uw_object_hdr_t *)reference)->position_word_low = (byte)E;
|
- *(char *)((byte *)reference + 0x2) = E;
+ ((uw_object_hdr_t *)reference)->position_word_low = (byte)E;
|
- ((char *)reference)[0x2] = E;
+ ((uw_object_hdr_t *)reference)->position_word_low = (byte)E;
|
- *(char *)((ushort *)reference + 0x1) = E;
+ ((uw_object_hdr_t *)reference)->position_word_low = (byte)E;
|
- *(char *)(reference + 0x1) = E;
+ ((uw_object_hdr_t *)reference)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x2)
+ (char)((uw_object_hdr_t *)reference)->position_word_low
|
- *(char *)((byte *)reference + 0x2)
+ (char)((uw_object_hdr_t *)reference)->position_word_low
|
- ((char *)reference)[0x2]
+ (char)((uw_object_hdr_t *)reference)->position_word_low
|
- *(char *)((ushort *)reference + 0x1)
+ (char)((uw_object_hdr_t *)reference)->position_word_low
|
- (char)((ushort *)reference)[0x1]
+ (char)((uw_object_hdr_t *)reference)->position_word_low
|
- *(char *)(reference + 0x1)
+ (char)((uw_object_hdr_t *)reference)->position_word_low
|
- (char)reference[0x1]
+ (char)((uw_object_hdr_t *)reference)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->position_word_high
|
- *(byte *)((byte *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->position_word_high
|
- ((byte *)reference)[0x3]
+ ((uw_object_hdr_t *)reference)->position_word_high
)
...>
}


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->position_word_high
|
- *(undefined1 *)((byte *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->position_word_high
|
- ((undefined1 *)reference)[0x3]
+ ((uw_object_hdr_t *)reference)->position_word_high
)
...>
}


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)reference + 0x3)
+ (char *)&((uw_object_hdr_t *)reference)->position_word_high
|
- &*(char *)((byte *)reference + 0x3)
+ (char *)&((uw_object_hdr_t *)reference)->position_word_high
|
- &((char *)reference)[0x3]
+ (char *)&((uw_object_hdr_t *)reference)->position_word_high
)
...>
}


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x3) = E;
+ ((uw_object_hdr_t *)reference)->position_word_high = (byte)E;
|
- *(char *)((byte *)reference + 0x3) = E;
+ ((uw_object_hdr_t *)reference)->position_word_high = (byte)E;
|
- ((char *)reference)[0x3] = E;
+ ((uw_object_hdr_t *)reference)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x3)
+ (char)((uw_object_hdr_t *)reference)->position_word_high
|
- *(char *)((byte *)reference + 0x3)
+ (char)((uw_object_hdr_t *)reference)->position_word_high
|
- ((char *)reference)[0x3]
+ (char)((uw_object_hdr_t *)reference)->position_word_high
)
...>
}


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)reference + 0x4) = (char)V;
- *(char *)((char *)reference + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)reference)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)reference + 0x4) = (char)V;
- *(byte *)((char *)reference + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)reference)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)reference + 0x4) = (byte)V;
- *(char *)((char *)reference + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)reference)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)reference + 0x4) = (byte)V;
- *(byte *)((char *)reference + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)reference)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- *(ushort *)((byte *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- ((ushort *)reference)[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word
|
- *(ushort *)((ushort *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- *(ushort *)(reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- reference[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word
)
...>
}


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- *(undefined2 *)((byte *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- ((undefined2 *)reference)[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word
|
- *(undefined2 *)((undefined2 *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- *(undefined2 *)(reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- reference[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word
)
...>
}


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word_signed
|
- *(short *)((byte *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word_signed
|
- ((short *)reference)[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word_signed
|
- *(short *)((short *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word_signed
|
- *(short *)(reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word_signed
)
...>
}


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- *(byte *)((byte *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- ((byte *)reference)[0x4]
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- *(byte *)((ushort *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- (byte)((ushort *)reference)[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- *(byte *)(reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- (byte)reference[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- *(undefined1 *)((byte *)reference + 0x4)
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- ((undefined1 *)reference)[0x4]
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- *(undefined1 *)((ushort *)reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- (undefined1)((ushort *)reference)[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- *(undefined1 *)(reference + 0x2)
+ ((uw_object_hdr_t *)reference)->chain_word_low
|
- (undefined1)reference[0x2]
+ ((uw_object_hdr_t *)reference)->chain_word_low
)
...>
}


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)reference + 0x4)
+ (char *)&((uw_object_hdr_t *)reference)->chain_word_low
|
- &*(char *)((byte *)reference + 0x4)
+ (char *)&((uw_object_hdr_t *)reference)->chain_word_low
|
- &((char *)reference)[0x4]
+ (char *)&((uw_object_hdr_t *)reference)->chain_word_low
|
- &*(char *)((ushort *)reference + 0x2)
+ (char *)&((uw_object_hdr_t *)reference)->chain_word_low
|
- &*(char *)(reference + 0x2)
+ (char *)&((uw_object_hdr_t *)reference)->chain_word_low
)
...>
}


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x4) = E;
+ ((uw_object_hdr_t *)reference)->chain_word_low = (byte)E;
|
- *(char *)((byte *)reference + 0x4) = E;
+ ((uw_object_hdr_t *)reference)->chain_word_low = (byte)E;
|
- ((char *)reference)[0x4] = E;
+ ((uw_object_hdr_t *)reference)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)reference + 0x2) = E;
+ ((uw_object_hdr_t *)reference)->chain_word_low = (byte)E;
|
- *(char *)(reference + 0x2) = E;
+ ((uw_object_hdr_t *)reference)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x4)
+ (char)((uw_object_hdr_t *)reference)->chain_word_low
|
- *(char *)((byte *)reference + 0x4)
+ (char)((uw_object_hdr_t *)reference)->chain_word_low
|
- ((char *)reference)[0x4]
+ (char)((uw_object_hdr_t *)reference)->chain_word_low
|
- *(char *)((ushort *)reference + 0x2)
+ (char)((uw_object_hdr_t *)reference)->chain_word_low
|
- (char)((ushort *)reference)[0x2]
+ (char)((uw_object_hdr_t *)reference)->chain_word_low
|
- *(char *)(reference + 0x2)
+ (char)((uw_object_hdr_t *)reference)->chain_word_low
|
- (char)reference[0x2]
+ (char)((uw_object_hdr_t *)reference)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)reference + 0x5)
+ ((uw_object_hdr_t *)reference)->chain_word_high
|
- *(byte *)((byte *)reference + 0x5)
+ ((uw_object_hdr_t *)reference)->chain_word_high
|
- ((byte *)reference)[0x5]
+ ((uw_object_hdr_t *)reference)->chain_word_high
)
...>
}


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)reference + 0x5)
+ ((uw_object_hdr_t *)reference)->chain_word_high
|
- *(undefined1 *)((byte *)reference + 0x5)
+ ((uw_object_hdr_t *)reference)->chain_word_high
|
- ((undefined1 *)reference)[0x5]
+ ((uw_object_hdr_t *)reference)->chain_word_high
)
...>
}


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)reference + 0x5)
+ (char *)&((uw_object_hdr_t *)reference)->chain_word_high
|
- &*(char *)((byte *)reference + 0x5)
+ (char *)&((uw_object_hdr_t *)reference)->chain_word_high
|
- &((char *)reference)[0x5]
+ (char *)&((uw_object_hdr_t *)reference)->chain_word_high
)
...>
}


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x5) = E;
+ ((uw_object_hdr_t *)reference)->chain_word_high = (byte)E;
|
- *(char *)((byte *)reference + 0x5) = E;
+ ((uw_object_hdr_t *)reference)->chain_word_high = (byte)E;
|
- ((char *)reference)[0x5] = E;
+ ((uw_object_hdr_t *)reference)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x5)
+ (char)((uw_object_hdr_t *)reference)->chain_word_high
|
- *(char *)((byte *)reference + 0x5)
+ (char)((uw_object_hdr_t *)reference)->chain_word_high
|
- ((char *)reference)[0x5]
+ (char)((uw_object_hdr_t *)reference)->chain_word_high
)
...>
}


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)reference + 0x6) = (char)V;
- *(char *)((char *)reference + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)reference)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)reference + 0x6) = (char)V;
- *(byte *)((char *)reference + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)reference)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)reference + 0x6) = (byte)V;
- *(char *)((char *)reference + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)reference)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)reference + 0x6) = (byte)V;
- *(byte *)((char *)reference + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)reference)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word
|
- *(ushort *)((byte *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word
|
- ((ushort *)reference)[0x3]
+ ((uw_object_hdr_t *)reference)->link_word
|
- *(ushort *)((ushort *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word
|
- *(ushort *)(reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word
|
- reference[0x3]
+ ((uw_object_hdr_t *)reference)->link_word
)
...>
}


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word
|
- *(undefined2 *)((byte *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word
|
- ((undefined2 *)reference)[0x3]
+ ((uw_object_hdr_t *)reference)->link_word
|
- *(undefined2 *)((undefined2 *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word
|
- *(undefined2 *)(reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word
|
- reference[0x3]
+ ((uw_object_hdr_t *)reference)->link_word
)
...>
}


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word_signed
|
- *(short *)((byte *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word_signed
|
- ((short *)reference)[0x3]
+ ((uw_object_hdr_t *)reference)->link_word_signed
|
- *(short *)((short *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word_signed
|
- *(short *)(reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word_signed
)
...>
}


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- *(byte *)((byte *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- ((byte *)reference)[0x6]
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- *(byte *)((ushort *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- (byte)((ushort *)reference)[0x3]
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- *(byte *)(reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- (byte)reference[0x3]
+ ((uw_object_hdr_t *)reference)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- *(undefined1 *)((byte *)reference + 0x6)
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- ((undefined1 *)reference)[0x6]
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- *(undefined1 *)((ushort *)reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- (undefined1)((ushort *)reference)[0x3]
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- *(undefined1 *)(reference + 0x3)
+ ((uw_object_hdr_t *)reference)->link_word_low
|
- (undefined1)reference[0x3]
+ ((uw_object_hdr_t *)reference)->link_word_low
)
...>
}


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)reference + 0x6)
+ (char *)&((uw_object_hdr_t *)reference)->link_word_low
|
- &*(char *)((byte *)reference + 0x6)
+ (char *)&((uw_object_hdr_t *)reference)->link_word_low
|
- &((char *)reference)[0x6]
+ (char *)&((uw_object_hdr_t *)reference)->link_word_low
|
- &*(char *)((ushort *)reference + 0x3)
+ (char *)&((uw_object_hdr_t *)reference)->link_word_low
|
- &*(char *)(reference + 0x3)
+ (char *)&((uw_object_hdr_t *)reference)->link_word_low
)
...>
}


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x6) = E;
+ ((uw_object_hdr_t *)reference)->link_word_low = (byte)E;
|
- *(char *)((byte *)reference + 0x6) = E;
+ ((uw_object_hdr_t *)reference)->link_word_low = (byte)E;
|
- ((char *)reference)[0x6] = E;
+ ((uw_object_hdr_t *)reference)->link_word_low = (byte)E;
|
- *(char *)((ushort *)reference + 0x3) = E;
+ ((uw_object_hdr_t *)reference)->link_word_low = (byte)E;
|
- *(char *)(reference + 0x3) = E;
+ ((uw_object_hdr_t *)reference)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x6)
+ (char)((uw_object_hdr_t *)reference)->link_word_low
|
- *(char *)((byte *)reference + 0x6)
+ (char)((uw_object_hdr_t *)reference)->link_word_low
|
- ((char *)reference)[0x6]
+ (char)((uw_object_hdr_t *)reference)->link_word_low
|
- *(char *)((ushort *)reference + 0x3)
+ (char)((uw_object_hdr_t *)reference)->link_word_low
|
- (char)((ushort *)reference)[0x3]
+ (char)((uw_object_hdr_t *)reference)->link_word_low
|
- *(char *)(reference + 0x3)
+ (char)((uw_object_hdr_t *)reference)->link_word_low
|
- (char)reference[0x3]
+ (char)((uw_object_hdr_t *)reference)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)reference + 0x7)
+ ((uw_object_hdr_t *)reference)->link_word_high
|
- *(byte *)((byte *)reference + 0x7)
+ ((uw_object_hdr_t *)reference)->link_word_high
|
- ((byte *)reference)[0x7]
+ ((uw_object_hdr_t *)reference)->link_word_high
)
...>
}


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)reference + 0x7)
+ ((uw_object_hdr_t *)reference)->link_word_high
|
- *(undefined1 *)((byte *)reference + 0x7)
+ ((uw_object_hdr_t *)reference)->link_word_high
|
- ((undefined1 *)reference)[0x7]
+ ((uw_object_hdr_t *)reference)->link_word_high
)
...>
}


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)reference + 0x7)
+ (char *)&((uw_object_hdr_t *)reference)->link_word_high
|
- &*(char *)((byte *)reference + 0x7)
+ (char *)&((uw_object_hdr_t *)reference)->link_word_high
|
- &((char *)reference)[0x7]
+ (char *)&((uw_object_hdr_t *)reference)->link_word_high
)
...>
}


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x7) = E;
+ ((uw_object_hdr_t *)reference)->link_word_high = (byte)E;
|
- *(char *)((byte *)reference + 0x7) = E;
+ ((uw_object_hdr_t *)reference)->link_word_high = (byte)E;
|
- ((char *)reference)[0x7] = E;
+ ((uw_object_hdr_t *)reference)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)reference + 0x7)
+ (char)((uw_object_hdr_t *)reference)->link_word_high
|
- *(char *)((byte *)reference + 0x7)
+ (char)((uw_object_hdr_t *)reference)->link_word_high
|
- ((char *)reference)[0x7]
+ (char)((uw_object_hdr_t *)reference)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(check_object_combination\)$";
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


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
)
...>
}


@receiver_3_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(undefined2 *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- ((undefined2 *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(undefined2 *)(iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &*(char *)((byte *)iVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &((char *)iVar4)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &*(char *)((ushort *)iVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &*(char *)iVar4
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &*(char *)(iVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &iVar4[0x0]
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &*iVar4
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- iVar4[0x0] = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- *iVar4 = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x0)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- iVar4[0x0]
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *iVar4
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_3_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_high
|
- &*(char *)((byte *)iVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_high
|
- &((char *)iVar4)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_high
|
- &*(char *)(iVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_high
|
- &iVar4[0x1]
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_high = (byte)E;
|
- iVar4[0x1] = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x1)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_high
|
- iVar4[0x1]
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_3_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
)
...>
}


@receiver_3_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(undefined2 *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- ((undefined2 *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(undefined2 *)((undefined2 *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(undefined2 *)(iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
)
...>
}


@receiver_3_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
)
...>
}


@receiver_3_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_3_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
|
- &*(char *)((byte *)iVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
|
- &((char *)iVar4)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
|
- &*(char *)((ushort *)iVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
|
- &*(char *)(iVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
|
- &iVar4[0x2]
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_3_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
|
- iVar4[0x2] = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x2)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- iVar4[0x2]
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_3_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_3_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_high
|
- &*(char *)((byte *)iVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_high
|
- &((char *)iVar4)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_high
|
- &*(char *)(iVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_high
|
- &iVar4[0x3]
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_3_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)E;
|
- iVar4[0x3] = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x3)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_high
|
- iVar4[0x3]
+ (char)((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_3_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
)
...>
}


@receiver_3_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(undefined2 *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- ((undefined2 *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(undefined2 *)(iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
)
...>
}


@receiver_3_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
)
...>
}


@receiver_3_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
|
- &*(char *)((byte *)iVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
|
- &((char *)iVar4)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
|
- &*(char *)((ushort *)iVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
|
- &*(char *)(iVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
|
- &iVar4[0x4]
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
|
- iVar4[0x4] = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x4)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- iVar4[0x4]
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_3_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_3_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_high
|
- &*(char *)((byte *)iVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_high
|
- &((char *)iVar4)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_high
|
- &*(char *)(iVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_high
|
- &iVar4[0x5]
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_3_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_high = (byte)E;
|
- iVar4[0x5] = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x5)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_high
|
- iVar4[0x5]
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_3_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@receiver_3_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
)
...>
}


@receiver_3_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(undefined2 *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- ((undefined2 *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(undefined2 *)((undefined2 *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(undefined2 *)(iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
)
...>
}


@receiver_3_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
)
...>
}


@receiver_3_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_3_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
|
- &*(char *)((byte *)iVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
|
- &((char *)iVar4)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
|
- &*(char *)((ushort *)iVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
|
- &*(char *)(iVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
|
- &iVar4[0x6]
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_3_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
|
- iVar4[0x6] = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x6)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- iVar4[0x6]
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_3_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_3_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_high
|
- &*(char *)((byte *)iVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_high
|
- &((char *)iVar4)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_high
|
- &*(char *)(iVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_high
|
- &iVar4[0x7]
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_3_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_high = (byte)E;
|
- iVar4[0x7] = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar4 + 0x7)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_high
|
- iVar4[0x7]
+ (char)((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
|
- iVar2[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *iVar2
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}


@receiver_4_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
|
- iVar2[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *iVar2
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
|
- (byte)iVar2[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
|
- (undefined1)iVar2[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_4_w_0_0_address_0@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- (char)iVar2[0x0]
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_0_0_address_1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_2_17_word_ushort@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(ushort *)(iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- iVar2[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}


@receiver_4_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(undefined2 *)(iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- iVar2[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}


@receiver_4_w_2_17_word_short@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(short *)(iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word_signed
)
...>
}


@receiver_4_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(byte *)(iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- (byte)iVar2[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(undefined1 *)(iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- (undefined1)iVar2[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_4_w_2_17_address_2@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- &*(char *)(iVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_4_w_2_17_store_2@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(char *)(iVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(char *)(iVar2 + 0x1)
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
|
- (char)iVar2[0x1]
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_2_17_address_3@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_2_17_store_3@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_4_34_word_ushort@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(ushort *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- iVar2[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}


@receiver_4_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(undefined2 *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- iVar2[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}


@receiver_4_w_4_34_word_short@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(short *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word_signed
)
...>
}


@receiver_4_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(byte *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- (byte)iVar2[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(undefined1 *)(iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- (undefined1)iVar2[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_4_w_4_34_address_4@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- &*(char *)(iVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_4_w_4_34_store_4@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(char *)(iVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(char *)(iVar2 + 0x2)
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
|
- (char)iVar2[0x2]
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_4_34_address_5@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_4_34_store_5@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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

@receiver_4_w_6_51_word_ushort@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(ushort *)(iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- iVar2[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}


@receiver_4_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(undefined2 *)(iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- iVar2[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}


@receiver_4_w_6_51_word_short@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(short *)(iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word_signed
)
...>
}


@receiver_4_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(byte *)(iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- (byte)iVar2[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(undefined1 *)(iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- (undefined1)iVar2[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_4_w_6_51_address_6@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- &*(char *)(iVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_4_w_6_51_store_6@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(char *)(iVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- *(char *)(iVar2 + 0x3)
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
|
- (char)iVar2[0x3]
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_6_51_address_7@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_6_51_store_7@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_4_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar2 + 0x0) = (char)V;
- *(char *)((char *)uVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar2 + 0x0) = (char)V;
- *(byte *)((char *)uVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar2 + 0x0) = (byte)V;
- *(char *)((char *)uVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar2 + 0x0) = (byte)V;
- *(byte *)((char *)uVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- *(ushort *)((byte *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- ((ushort *)uVar2)[0x0]
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- *(ushort *)((ushort *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags
)
...>
}


@receiver_5_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- *(undefined2 *)((byte *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- ((undefined2 *)uVar2)[0x0]
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- *(undefined2 *)((undefined2 *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_signed
|
- *(short *)((byte *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_signed
|
- ((short *)uVar2)[0x0]
+ ((uw_object_hdr_t *)uVar2)->type_flags_signed
|
- *(short *)((short *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(byte *)((byte *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- ((byte *)uVar2)[0x0]
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(byte *)((ushort *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- (byte)((ushort *)uVar2)[0x0]
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(byte *)uVar2
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(undefined1 *)((byte *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- ((undefined1 *)uVar2)[0x0]
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(undefined1 *)((ushort *)uVar2 + 0x0)
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- (undefined1)((ushort *)uVar2)[0x0]
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(undefined1 *)uVar2
+ ((uw_object_hdr_t *)uVar2)->type_flags_low
)
...>
}


@receiver_5_w_0_0_address_0@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar2)->type_flags_low
|
- &*(char *)((byte *)uVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar2)->type_flags_low
|
- &((char *)uVar2)[0x0]
+ (char *)&((uw_object_hdr_t *)uVar2)->type_flags_low
|
- &*(char *)((ushort *)uVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar2)->type_flags_low
|
- &*(char *)uVar2
+ (char *)&((uw_object_hdr_t *)uVar2)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar2)->type_flags_low = (byte)E;
|
- *(char *)((byte *)uVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar2)->type_flags_low = (byte)E;
|
- ((char *)uVar2)[0x0] = E;
+ ((uw_object_hdr_t *)uVar2)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)uVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar2)->type_flags_low = (byte)E;
|
- *(char *)uVar2 = E;
+ ((uw_object_hdr_t *)uVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x0)
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(char *)((byte *)uVar2 + 0x0)
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_low
|
- ((char *)uVar2)[0x0]
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(char *)((ushort *)uVar2 + 0x0)
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_low
|
- (char)((ushort *)uVar2)[0x0]
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_low
|
- *(char *)uVar2
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->type_flags_high
|
- *(byte *)((byte *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->type_flags_high
|
- ((byte *)uVar2)[0x1]
+ ((uw_object_hdr_t *)uVar2)->type_flags_high
)
...>
}


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->type_flags_high
|
- *(undefined1 *)((byte *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->type_flags_high
|
- ((undefined1 *)uVar2)[0x1]
+ ((uw_object_hdr_t *)uVar2)->type_flags_high
)
...>
}


@receiver_5_w_0_0_address_1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar2)->type_flags_high
|
- &*(char *)((byte *)uVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar2)->type_flags_high
|
- &((char *)uVar2)[0x1]
+ (char *)&((uw_object_hdr_t *)uVar2)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar2)->type_flags_high = (byte)E;
|
- *(char *)((byte *)uVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar2)->type_flags_high = (byte)E;
|
- ((char *)uVar2)[0x1] = E;
+ ((uw_object_hdr_t *)uVar2)->type_flags_high = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x1)
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_high
|
- *(char *)((byte *)uVar2 + 0x1)
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_high
|
- ((char *)uVar2)[0x1]
+ (char)((uw_object_hdr_t *)uVar2)->type_flags_high
)
...>
}


@receiver_5_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar2 + 0x2) = (char)V;
- *(char *)((char *)uVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar2 + 0x2) = (char)V;
- *(byte *)((char *)uVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar2 + 0x2) = (byte)V;
- *(char *)((char *)uVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar2 + 0x2) = (byte)V;
- *(byte *)((char *)uVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_word_ushort@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word
|
- *(ushort *)((byte *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word
|
- ((ushort *)uVar2)[0x1]
+ ((uw_object_hdr_t *)uVar2)->position_word
|
- *(ushort *)((ushort *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->position_word
)
...>
}


@receiver_5_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word
|
- *(undefined2 *)((byte *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word
|
- ((undefined2 *)uVar2)[0x1]
+ ((uw_object_hdr_t *)uVar2)->position_word
|
- *(undefined2 *)((undefined2 *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->position_word
)
...>
}


@receiver_5_w_2_17_word_short@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word_signed
|
- *(short *)((byte *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word_signed
|
- ((short *)uVar2)[0x1]
+ ((uw_object_hdr_t *)uVar2)->position_word_signed
|
- *(short *)((short *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->position_word_signed
)
...>
}


@receiver_5_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word_low
|
- *(byte *)((byte *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word_low
|
- ((byte *)uVar2)[0x2]
+ ((uw_object_hdr_t *)uVar2)->position_word_low
|
- *(byte *)((ushort *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->position_word_low
|
- (byte)((ushort *)uVar2)[0x1]
+ ((uw_object_hdr_t *)uVar2)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word_low
|
- *(undefined1 *)((byte *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->position_word_low
|
- ((undefined1 *)uVar2)[0x2]
+ ((uw_object_hdr_t *)uVar2)->position_word_low
|
- *(undefined1 *)((ushort *)uVar2 + 0x1)
+ ((uw_object_hdr_t *)uVar2)->position_word_low
|
- (undefined1)((ushort *)uVar2)[0x1]
+ ((uw_object_hdr_t *)uVar2)->position_word_low
)
...>
}


@receiver_5_w_2_17_address_2@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar2)->position_word_low
|
- &*(char *)((byte *)uVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar2)->position_word_low
|
- &((char *)uVar2)[0x2]
+ (char *)&((uw_object_hdr_t *)uVar2)->position_word_low
|
- &*(char *)((ushort *)uVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar2)->position_word_low
)
...>
}


@receiver_5_w_2_17_store_2@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar2)->position_word_low = (byte)E;
|
- *(char *)((byte *)uVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar2)->position_word_low = (byte)E;
|
- ((char *)uVar2)[0x2] = E;
+ ((uw_object_hdr_t *)uVar2)->position_word_low = (byte)E;
|
- *(char *)((ushort *)uVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x2)
+ (char)((uw_object_hdr_t *)uVar2)->position_word_low
|
- *(char *)((byte *)uVar2 + 0x2)
+ (char)((uw_object_hdr_t *)uVar2)->position_word_low
|
- ((char *)uVar2)[0x2]
+ (char)((uw_object_hdr_t *)uVar2)->position_word_low
|
- *(char *)((ushort *)uVar2 + 0x1)
+ (char)((uw_object_hdr_t *)uVar2)->position_word_low
|
- (char)((ushort *)uVar2)[0x1]
+ (char)((uw_object_hdr_t *)uVar2)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->position_word_high
|
- *(byte *)((byte *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->position_word_high
|
- ((byte *)uVar2)[0x3]
+ ((uw_object_hdr_t *)uVar2)->position_word_high
)
...>
}


@receiver_5_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->position_word_high
|
- *(undefined1 *)((byte *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->position_word_high
|
- ((undefined1 *)uVar2)[0x3]
+ ((uw_object_hdr_t *)uVar2)->position_word_high
)
...>
}


@receiver_5_w_2_17_address_3@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar2)->position_word_high
|
- &*(char *)((byte *)uVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar2)->position_word_high
|
- &((char *)uVar2)[0x3]
+ (char *)&((uw_object_hdr_t *)uVar2)->position_word_high
)
...>
}


@receiver_5_w_2_17_store_3@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar2)->position_word_high = (byte)E;
|
- *(char *)((byte *)uVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar2)->position_word_high = (byte)E;
|
- ((char *)uVar2)[0x3] = E;
+ ((uw_object_hdr_t *)uVar2)->position_word_high = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x3)
+ (char)((uw_object_hdr_t *)uVar2)->position_word_high
|
- *(char *)((byte *)uVar2 + 0x3)
+ (char)((uw_object_hdr_t *)uVar2)->position_word_high
|
- ((char *)uVar2)[0x3]
+ (char)((uw_object_hdr_t *)uVar2)->position_word_high
)
...>
}


@receiver_5_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar2 + 0x4) = (char)V;
- *(char *)((char *)uVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar2 + 0x4) = (char)V;
- *(byte *)((char *)uVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar2 + 0x4) = (byte)V;
- *(char *)((char *)uVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar2 + 0x4) = (byte)V;
- *(byte *)((char *)uVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_word_ushort@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word
|
- *(ushort *)((byte *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word
|
- ((ushort *)uVar2)[0x2]
+ ((uw_object_hdr_t *)uVar2)->chain_word
|
- *(ushort *)((ushort *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->chain_word
)
...>
}


@receiver_5_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word
|
- *(undefined2 *)((byte *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word
|
- ((undefined2 *)uVar2)[0x2]
+ ((uw_object_hdr_t *)uVar2)->chain_word
|
- *(undefined2 *)((undefined2 *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->chain_word
)
...>
}


@receiver_5_w_4_34_word_short@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word_signed
|
- *(short *)((byte *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word_signed
|
- ((short *)uVar2)[0x2]
+ ((uw_object_hdr_t *)uVar2)->chain_word_signed
|
- *(short *)((short *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->chain_word_signed
)
...>
}


@receiver_5_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
|
- *(byte *)((byte *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
|
- ((byte *)uVar2)[0x4]
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
|
- *(byte *)((ushort *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
|
- (byte)((ushort *)uVar2)[0x2]
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
|
- *(undefined1 *)((byte *)uVar2 + 0x4)
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
|
- ((undefined1 *)uVar2)[0x4]
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
|
- *(undefined1 *)((ushort *)uVar2 + 0x2)
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
|
- (undefined1)((ushort *)uVar2)[0x2]
+ ((uw_object_hdr_t *)uVar2)->chain_word_low
)
...>
}


@receiver_5_w_4_34_address_4@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)uVar2)->chain_word_low
|
- &*(char *)((byte *)uVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)uVar2)->chain_word_low
|
- &((char *)uVar2)[0x4]
+ (char *)&((uw_object_hdr_t *)uVar2)->chain_word_low
|
- &*(char *)((ushort *)uVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar2)->chain_word_low
)
...>
}


@receiver_5_w_4_34_store_4@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar2)->chain_word_low = (byte)E;
|
- *(char *)((byte *)uVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar2)->chain_word_low = (byte)E;
|
- ((char *)uVar2)[0x4] = E;
+ ((uw_object_hdr_t *)uVar2)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)uVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x4)
+ (char)((uw_object_hdr_t *)uVar2)->chain_word_low
|
- *(char *)((byte *)uVar2 + 0x4)
+ (char)((uw_object_hdr_t *)uVar2)->chain_word_low
|
- ((char *)uVar2)[0x4]
+ (char)((uw_object_hdr_t *)uVar2)->chain_word_low
|
- *(char *)((ushort *)uVar2 + 0x2)
+ (char)((uw_object_hdr_t *)uVar2)->chain_word_low
|
- (char)((ushort *)uVar2)[0x2]
+ (char)((uw_object_hdr_t *)uVar2)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar2 + 0x5)
+ ((uw_object_hdr_t *)uVar2)->chain_word_high
|
- *(byte *)((byte *)uVar2 + 0x5)
+ ((uw_object_hdr_t *)uVar2)->chain_word_high
|
- ((byte *)uVar2)[0x5]
+ ((uw_object_hdr_t *)uVar2)->chain_word_high
)
...>
}


@receiver_5_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar2 + 0x5)
+ ((uw_object_hdr_t *)uVar2)->chain_word_high
|
- *(undefined1 *)((byte *)uVar2 + 0x5)
+ ((uw_object_hdr_t *)uVar2)->chain_word_high
|
- ((undefined1 *)uVar2)[0x5]
+ ((uw_object_hdr_t *)uVar2)->chain_word_high
)
...>
}


@receiver_5_w_4_34_address_5@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)uVar2)->chain_word_high
|
- &*(char *)((byte *)uVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)uVar2)->chain_word_high
|
- &((char *)uVar2)[0x5]
+ (char *)&((uw_object_hdr_t *)uVar2)->chain_word_high
)
...>
}


@receiver_5_w_4_34_store_5@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar2)->chain_word_high = (byte)E;
|
- *(char *)((byte *)uVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar2)->chain_word_high = (byte)E;
|
- ((char *)uVar2)[0x5] = E;
+ ((uw_object_hdr_t *)uVar2)->chain_word_high = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x5)
+ (char)((uw_object_hdr_t *)uVar2)->chain_word_high
|
- *(char *)((byte *)uVar2 + 0x5)
+ (char)((uw_object_hdr_t *)uVar2)->chain_word_high
|
- ((char *)uVar2)[0x5]
+ (char)((uw_object_hdr_t *)uVar2)->chain_word_high
)
...>
}


@receiver_5_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar2 + 0x6) = (char)V;
- *(char *)((char *)uVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar2 + 0x6) = (char)V;
- *(byte *)((char *)uVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar2 + 0x6) = (byte)V;
- *(char *)((char *)uVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar2 + 0x6) = (byte)V;
- *(byte *)((char *)uVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar2)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_word_ushort@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word
|
- *(ushort *)((byte *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word
|
- ((ushort *)uVar2)[0x3]
+ ((uw_object_hdr_t *)uVar2)->link_word
|
- *(ushort *)((ushort *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->link_word
)
...>
}


@receiver_5_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word
|
- *(undefined2 *)((byte *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word
|
- ((undefined2 *)uVar2)[0x3]
+ ((uw_object_hdr_t *)uVar2)->link_word
|
- *(undefined2 *)((undefined2 *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->link_word
)
...>
}


@receiver_5_w_6_51_word_short@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word_signed
|
- *(short *)((byte *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word_signed
|
- ((short *)uVar2)[0x3]
+ ((uw_object_hdr_t *)uVar2)->link_word_signed
|
- *(short *)((short *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->link_word_signed
)
...>
}


@receiver_5_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word_low
|
- *(byte *)((byte *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word_low
|
- ((byte *)uVar2)[0x6]
+ ((uw_object_hdr_t *)uVar2)->link_word_low
|
- *(byte *)((ushort *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->link_word_low
|
- (byte)((ushort *)uVar2)[0x3]
+ ((uw_object_hdr_t *)uVar2)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word_low
|
- *(undefined1 *)((byte *)uVar2 + 0x6)
+ ((uw_object_hdr_t *)uVar2)->link_word_low
|
- ((undefined1 *)uVar2)[0x6]
+ ((uw_object_hdr_t *)uVar2)->link_word_low
|
- *(undefined1 *)((ushort *)uVar2 + 0x3)
+ ((uw_object_hdr_t *)uVar2)->link_word_low
|
- (undefined1)((ushort *)uVar2)[0x3]
+ ((uw_object_hdr_t *)uVar2)->link_word_low
)
...>
}


@receiver_5_w_6_51_address_6@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)uVar2)->link_word_low
|
- &*(char *)((byte *)uVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)uVar2)->link_word_low
|
- &((char *)uVar2)[0x6]
+ (char *)&((uw_object_hdr_t *)uVar2)->link_word_low
|
- &*(char *)((ushort *)uVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar2)->link_word_low
)
...>
}


@receiver_5_w_6_51_store_6@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar2)->link_word_low = (byte)E;
|
- *(char *)((byte *)uVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar2)->link_word_low = (byte)E;
|
- ((char *)uVar2)[0x6] = E;
+ ((uw_object_hdr_t *)uVar2)->link_word_low = (byte)E;
|
- *(char *)((ushort *)uVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x6)
+ (char)((uw_object_hdr_t *)uVar2)->link_word_low
|
- *(char *)((byte *)uVar2 + 0x6)
+ (char)((uw_object_hdr_t *)uVar2)->link_word_low
|
- ((char *)uVar2)[0x6]
+ (char)((uw_object_hdr_t *)uVar2)->link_word_low
|
- *(char *)((ushort *)uVar2 + 0x3)
+ (char)((uw_object_hdr_t *)uVar2)->link_word_low
|
- (char)((ushort *)uVar2)[0x3]
+ (char)((uw_object_hdr_t *)uVar2)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar2 + 0x7)
+ ((uw_object_hdr_t *)uVar2)->link_word_high
|
- *(byte *)((byte *)uVar2 + 0x7)
+ ((uw_object_hdr_t *)uVar2)->link_word_high
|
- ((byte *)uVar2)[0x7]
+ ((uw_object_hdr_t *)uVar2)->link_word_high
)
...>
}


@receiver_5_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar2 + 0x7)
+ ((uw_object_hdr_t *)uVar2)->link_word_high
|
- *(undefined1 *)((byte *)uVar2 + 0x7)
+ ((uw_object_hdr_t *)uVar2)->link_word_high
|
- ((undefined1 *)uVar2)[0x7]
+ ((uw_object_hdr_t *)uVar2)->link_word_high
)
...>
}


@receiver_5_w_6_51_address_7@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)uVar2)->link_word_high
|
- &*(char *)((byte *)uVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)uVar2)->link_word_high
|
- &((char *)uVar2)[0x7]
+ (char *)&((uw_object_hdr_t *)uVar2)->link_word_high
)
...>
}


@receiver_5_w_6_51_store_7@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar2)->link_word_high = (byte)E;
|
- *(char *)((byte *)uVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar2)->link_word_high = (byte)E;
|
- ((char *)uVar2)[0x7] = E;
+ ((uw_object_hdr_t *)uVar2)->link_word_high = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar2 + 0x7)
+ (char)((uw_object_hdr_t *)uVar2)->link_word_high
|
- *(char *)((byte *)uVar2 + 0x7)
+ (char)((uw_object_hdr_t *)uVar2)->link_word_high
|
- ((char *)uVar2)[0x7]
+ (char)((uw_object_hdr_t *)uVar2)->link_word_high
)
...>
}


@receiver_6_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_address_0@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_address_1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_2_17_word_ushort@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_word_short@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_address_2@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_store_2@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_address_3@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_store_3@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_4_34_word_ushort@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_word_short@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_address_4@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_store_4@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_address_5@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_store_5@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@receiver_6_w_6_51_word_ushort@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_word_short@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_address_6@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_store_6@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_address_7@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_store_7@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_6_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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


@receiver_7_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_0_0_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
)
...>
}


@receiver_7_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
)
...>
}


@receiver_7_w_0_0_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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


@receiver_7_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
)
...>
}


@receiver_7_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
)
...>
}


@receiver_7_w_0_0_address_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- &pObj[0x0]
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_low
|
- &*pObj
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_7_w_0_0_store_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- pObj[0x0] = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_low = (byte)E;
|
- *pObj = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_low = (byte)E;
)
...>
}


@receiver_7_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- pObj[0x0]
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
|
- *pObj
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_7_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(byte *)(pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->type_flags_high
)
...>
}


@receiver_7_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(undefined1 *)(pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->type_flags_high
)
...>
}


@receiver_7_w_0_0_address_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- &*(char *)(pObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_high
|
- &pObj[0x1]
+ (char *)&((uw_object_hdr_t *)pObj)->type_flags_high
)
...>
}


@receiver_7_w_0_0_store_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(char *)(pObj + 0x1) = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_high = (byte)E;
|
- pObj[0x1] = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_high = (byte)E;
)
...>
}


@receiver_7_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(char *)(pObj + 0x1)
+ (char)((uw_object_hdr_t *)pObj)->type_flags_high
|
- pObj[0x1]
+ (char)((uw_object_hdr_t *)pObj)->type_flags_high
)
...>
}


@receiver_7_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_2_17_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(ushort *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word
)
...>
}


@receiver_7_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(undefined2 *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word
)
...>
}


@receiver_7_w_2_17_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(short *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_signed
)
...>
}


@receiver_7_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(byte *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_7_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(undefined1 *)(pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_7_w_2_17_address_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- &*(char *)(pObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_low
|
- &pObj[0x2]
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_7_w_2_17_store_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(char *)(pObj + 0x2) = E;
+ ((uw_object_hdr_t *)pObj)->position_word_low = (byte)E;
|
- pObj[0x2] = E;
+ ((uw_object_hdr_t *)pObj)->position_word_low = (byte)E;
)
...>
}


@receiver_7_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(char *)(pObj + 0x2)
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
|
- pObj[0x2]
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_7_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(byte *)(pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->position_word_high
)
...>
}


@receiver_7_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(undefined1 *)(pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->position_word_high
)
...>
}


@receiver_7_w_2_17_address_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- &*(char *)(pObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_high
|
- &pObj[0x3]
+ (char *)&((uw_object_hdr_t *)pObj)->position_word_high
)
...>
}


@receiver_7_w_2_17_store_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(char *)(pObj + 0x3) = E;
+ ((uw_object_hdr_t *)pObj)->position_word_high = (byte)E;
|
- pObj[0x3] = E;
+ ((uw_object_hdr_t *)pObj)->position_word_high = (byte)E;
)
...>
}


@receiver_7_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(char *)(pObj + 0x3)
+ (char)((uw_object_hdr_t *)pObj)->position_word_high
|
- pObj[0x3]
+ (char)((uw_object_hdr_t *)pObj)->position_word_high
)
...>
}


@receiver_7_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_4_34_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(ushort *)(pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word
)
...>
}


@receiver_7_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(undefined2 *)(pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word
)
...>
}


@receiver_7_w_4_34_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(short *)(pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_signed
)
...>
}


@receiver_7_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(byte *)(pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_7_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(undefined1 *)(pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_7_w_4_34_address_4@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- &*(char *)(pObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_low
|
- &pObj[0x4]
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_7_w_4_34_store_4@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(char *)(pObj + 0x4) = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_low = (byte)E;
|
- pObj[0x4] = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_low = (byte)E;
)
...>
}


@receiver_7_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(char *)(pObj + 0x4)
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
|
- pObj[0x4]
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_7_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(byte *)(pObj + 0x5)
+ ((uw_object_hdr_t *)pObj)->chain_word_high
)
...>
}


@receiver_7_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(undefined1 *)(pObj + 0x5)
+ ((uw_object_hdr_t *)pObj)->chain_word_high
)
...>
}


@receiver_7_w_4_34_address_5@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- &*(char *)(pObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_high
|
- &pObj[0x5]
+ (char *)&((uw_object_hdr_t *)pObj)->chain_word_high
)
...>
}


@receiver_7_w_4_34_store_5@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(char *)(pObj + 0x5) = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_high = (byte)E;
|
- pObj[0x5] = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_high = (byte)E;
)
...>
}


@receiver_7_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(char *)(pObj + 0x5)
+ (char)((uw_object_hdr_t *)pObj)->chain_word_high
|
- pObj[0x5]
+ (char)((uw_object_hdr_t *)pObj)->chain_word_high
)
...>
}


@receiver_7_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@receiver_7_w_6_51_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(ushort *)(pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word
)
...>
}


@receiver_7_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(undefined2 *)(pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word
)
...>
}


@receiver_7_w_6_51_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(short *)(pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_signed
)
...>
}


@receiver_7_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(byte *)(pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_7_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(undefined1 *)(pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_7_w_6_51_address_6@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- &*(char *)(pObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_low
|
- &pObj[0x6]
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_7_w_6_51_store_6@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(char *)(pObj + 0x6) = E;
+ ((uw_object_hdr_t *)pObj)->link_word_low = (byte)E;
|
- pObj[0x6] = E;
+ ((uw_object_hdr_t *)pObj)->link_word_low = (byte)E;
)
...>
}


@receiver_7_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
- *(char *)(pObj + 0x6)
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
|
- pObj[0x6]
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_7_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(byte *)(pObj + 0x7)
+ ((uw_object_hdr_t *)pObj)->link_word_high
)
...>
}


@receiver_7_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(undefined1 *)(pObj + 0x7)
+ ((uw_object_hdr_t *)pObj)->link_word_high
)
...>
}


@receiver_7_w_6_51_address_7@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- &*(char *)(pObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_high
|
- &pObj[0x7]
+ (char *)&((uw_object_hdr_t *)pObj)->link_word_high
)
...>
}


@receiver_7_w_6_51_store_7@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(char *)(pObj + 0x7) = E;
+ ((uw_object_hdr_t *)pObj)->link_word_high = (byte)E;
|
- pObj[0x7] = E;
+ ((uw_object_hdr_t *)pObj)->link_word_high = (byte)E;
)
...>
}


@receiver_7_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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
|
- *(char *)(pObj + 0x7)
+ (char)((uw_object_hdr_t *)pObj)->link_word_high
|
- pObj[0x7]
+ (char)((uw_object_hdr_t *)pObj)->link_word_high
)
...>
}


@receiver_8_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_scratch + 0x0) = (char)V;
- *(char *)((char *)saved_scratch + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_scratch + 0x0) = (char)V;
- *(byte *)((char *)saved_scratch + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_scratch + 0x0) = (byte)V;
- *(char *)((char *)saved_scratch + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_scratch + 0x0) = (byte)V;
- *(byte *)((char *)saved_scratch + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
|
- *(ushort *)((byte *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
|
- ((ushort *)saved_scratch)[0x0]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
|
- *(ushort *)((ushort *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
)
...>
}


@receiver_8_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
|
- *(undefined2 *)((byte *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
|
- ((undefined2 *)saved_scratch)[0x0]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
|
- *(undefined2 *)((undefined2 *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
)
...>
}


@receiver_8_w_0_0_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_signed
|
- *(short *)((byte *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_signed
|
- ((short *)saved_scratch)[0x0]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_signed
|
- *(short *)((short *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_signed
)
...>
}


@receiver_8_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(byte *)((byte *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- ((byte *)saved_scratch)[0x0]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(byte *)((ushort *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- (byte)((ushort *)saved_scratch)[0x0]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(byte *)saved_scratch
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(undefined1 *)((byte *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- ((undefined1 *)saved_scratch)[0x0]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(undefined1 *)((ushort *)saved_scratch + 0x0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- (undefined1)((ushort *)saved_scratch)[0x0]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(undefined1 *)saved_scratch
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low
)
...>
}


@receiver_8_w_0_0_address_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_scratch + 0x0)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- &*(char *)((byte *)saved_scratch + 0x0)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- &((char *)saved_scratch)[0x0]
+ (char *)&((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- &*(char *)((ushort *)saved_scratch + 0x0)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- &*(char *)saved_scratch
+ (char *)&((uw_object_hdr_t *)saved_scratch)->type_flags_low
)
...>
}


@receiver_8_w_0_0_store_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x0) = E;
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low = (byte)E;
|
- *(char *)((byte *)saved_scratch + 0x0) = E;
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low = (byte)E;
|
- ((char *)saved_scratch)[0x0] = E;
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)saved_scratch + 0x0) = E;
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low = (byte)E;
|
- *(char *)saved_scratch = E;
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_low = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x0)
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(char *)((byte *)saved_scratch + 0x0)
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- ((char *)saved_scratch)[0x0]
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(char *)((ushort *)saved_scratch + 0x0)
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- (char)((ushort *)saved_scratch)[0x0]
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_low
|
- *(char *)saved_scratch
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high
|
- *(byte *)((byte *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high
|
- ((byte *)saved_scratch)[0x1]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high
)
...>
}


@receiver_8_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high
|
- *(undefined1 *)((byte *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high
|
- ((undefined1 *)saved_scratch)[0x1]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high
)
...>
}


@receiver_8_w_0_0_address_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_scratch + 0x1)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->type_flags_high
|
- &*(char *)((byte *)saved_scratch + 0x1)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->type_flags_high
|
- &((char *)saved_scratch)[0x1]
+ (char *)&((uw_object_hdr_t *)saved_scratch)->type_flags_high
)
...>
}


@receiver_8_w_0_0_store_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x1) = E;
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high = (byte)E;
|
- *(char *)((byte *)saved_scratch + 0x1) = E;
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high = (byte)E;
|
- ((char *)saved_scratch)[0x1] = E;
+ ((uw_object_hdr_t *)saved_scratch)->type_flags_high = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x1)
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_high
|
- *(char *)((byte *)saved_scratch + 0x1)
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_high
|
- ((char *)saved_scratch)[0x1]
+ (char)((uw_object_hdr_t *)saved_scratch)->type_flags_high
)
...>
}


@receiver_8_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_scratch + 0x2) = (char)V;
- *(char *)((char *)saved_scratch + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_scratch + 0x2) = (char)V;
- *(byte *)((char *)saved_scratch + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_scratch + 0x2) = (byte)V;
- *(char *)((char *)saved_scratch + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_scratch + 0x2) = (byte)V;
- *(byte *)((char *)saved_scratch + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word
|
- *(ushort *)((byte *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word
|
- ((ushort *)saved_scratch)[0x1]
+ ((uw_object_hdr_t *)saved_scratch)->position_word
|
- *(ushort *)((ushort *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->position_word
)
...>
}


@receiver_8_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word
|
- *(undefined2 *)((byte *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word
|
- ((undefined2 *)saved_scratch)[0x1]
+ ((uw_object_hdr_t *)saved_scratch)->position_word
|
- *(undefined2 *)((undefined2 *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->position_word
)
...>
}


@receiver_8_w_2_17_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_signed
|
- *(short *)((byte *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_signed
|
- ((short *)saved_scratch)[0x1]
+ ((uw_object_hdr_t *)saved_scratch)->position_word_signed
|
- *(short *)((short *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_signed
)
...>
}


@receiver_8_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- *(byte *)((byte *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- ((byte *)saved_scratch)[0x2]
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- *(byte *)((ushort *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- (byte)((ushort *)saved_scratch)[0x1]
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
)
...>
}


@receiver_8_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- *(undefined1 *)((byte *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- ((undefined1 *)saved_scratch)[0x2]
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- *(undefined1 *)((ushort *)saved_scratch + 0x1)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- (undefined1)((ushort *)saved_scratch)[0x1]
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low
)
...>
}


@receiver_8_w_2_17_address_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_scratch + 0x2)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- &*(char *)((byte *)saved_scratch + 0x2)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- &((char *)saved_scratch)[0x2]
+ (char *)&((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- &*(char *)((ushort *)saved_scratch + 0x1)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->position_word_low
)
...>
}


@receiver_8_w_2_17_store_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x2) = E;
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low = (byte)E;
|
- *(char *)((byte *)saved_scratch + 0x2) = E;
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low = (byte)E;
|
- ((char *)saved_scratch)[0x2] = E;
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low = (byte)E;
|
- *(char *)((ushort *)saved_scratch + 0x1) = E;
+ ((uw_object_hdr_t *)saved_scratch)->position_word_low = (byte)E;
)
...>
}


@receiver_8_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x2)
+ (char)((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- *(char *)((byte *)saved_scratch + 0x2)
+ (char)((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- ((char *)saved_scratch)[0x2]
+ (char)((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- *(char *)((ushort *)saved_scratch + 0x1)
+ (char)((uw_object_hdr_t *)saved_scratch)->position_word_low
|
- (char)((ushort *)saved_scratch)[0x1]
+ (char)((uw_object_hdr_t *)saved_scratch)->position_word_low
)
...>
}


@receiver_8_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high
|
- *(byte *)((byte *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high
|
- ((byte *)saved_scratch)[0x3]
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high
)
...>
}


@receiver_8_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high
|
- *(undefined1 *)((byte *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high
|
- ((undefined1 *)saved_scratch)[0x3]
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high
)
...>
}


@receiver_8_w_2_17_address_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_scratch + 0x3)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->position_word_high
|
- &*(char *)((byte *)saved_scratch + 0x3)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->position_word_high
|
- &((char *)saved_scratch)[0x3]
+ (char *)&((uw_object_hdr_t *)saved_scratch)->position_word_high
)
...>
}


@receiver_8_w_2_17_store_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x3) = E;
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high = (byte)E;
|
- *(char *)((byte *)saved_scratch + 0x3) = E;
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high = (byte)E;
|
- ((char *)saved_scratch)[0x3] = E;
+ ((uw_object_hdr_t *)saved_scratch)->position_word_high = (byte)E;
)
...>
}


@receiver_8_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x3)
+ (char)((uw_object_hdr_t *)saved_scratch)->position_word_high
|
- *(char *)((byte *)saved_scratch + 0x3)
+ (char)((uw_object_hdr_t *)saved_scratch)->position_word_high
|
- ((char *)saved_scratch)[0x3]
+ (char)((uw_object_hdr_t *)saved_scratch)->position_word_high
)
...>
}


@receiver_8_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_scratch + 0x4) = (char)V;
- *(char *)((char *)saved_scratch + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_scratch + 0x4) = (char)V;
- *(byte *)((char *)saved_scratch + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_scratch + 0x4) = (byte)V;
- *(char *)((char *)saved_scratch + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_scratch + 0x4) = (byte)V;
- *(byte *)((char *)saved_scratch + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
|
- *(ushort *)((byte *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
|
- ((ushort *)saved_scratch)[0x2]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
|
- *(ushort *)((ushort *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
)
...>
}


@receiver_8_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
|
- *(undefined2 *)((byte *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
|
- ((undefined2 *)saved_scratch)[0x2]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
|
- *(undefined2 *)((undefined2 *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
)
...>
}


@receiver_8_w_4_34_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_signed
|
- *(short *)((byte *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_signed
|
- ((short *)saved_scratch)[0x2]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_signed
|
- *(short *)((short *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_signed
)
...>
}


@receiver_8_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- *(byte *)((byte *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- ((byte *)saved_scratch)[0x4]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- *(byte *)((ushort *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- (byte)((ushort *)saved_scratch)[0x2]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
)
...>
}


@receiver_8_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- *(undefined1 *)((byte *)saved_scratch + 0x4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- ((undefined1 *)saved_scratch)[0x4]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- *(undefined1 *)((ushort *)saved_scratch + 0x2)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- (undefined1)((ushort *)saved_scratch)[0x2]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low
)
...>
}


@receiver_8_w_4_34_address_4@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_scratch + 0x4)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- &*(char *)((byte *)saved_scratch + 0x4)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- &((char *)saved_scratch)[0x4]
+ (char *)&((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- &*(char *)((ushort *)saved_scratch + 0x2)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->chain_word_low
)
...>
}


@receiver_8_w_4_34_store_4@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x4) = E;
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low = (byte)E;
|
- *(char *)((byte *)saved_scratch + 0x4) = E;
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low = (byte)E;
|
- ((char *)saved_scratch)[0x4] = E;
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)saved_scratch + 0x2) = E;
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_low = (byte)E;
)
...>
}


@receiver_8_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x4)
+ (char)((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- *(char *)((byte *)saved_scratch + 0x4)
+ (char)((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- ((char *)saved_scratch)[0x4]
+ (char)((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- *(char *)((ushort *)saved_scratch + 0x2)
+ (char)((uw_object_hdr_t *)saved_scratch)->chain_word_low
|
- (char)((ushort *)saved_scratch)[0x2]
+ (char)((uw_object_hdr_t *)saved_scratch)->chain_word_low
)
...>
}


@receiver_8_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_scratch + 0x5)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high
|
- *(byte *)((byte *)saved_scratch + 0x5)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high
|
- ((byte *)saved_scratch)[0x5]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high
)
...>
}


@receiver_8_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_scratch + 0x5)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high
|
- *(undefined1 *)((byte *)saved_scratch + 0x5)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high
|
- ((undefined1 *)saved_scratch)[0x5]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high
)
...>
}


@receiver_8_w_4_34_address_5@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_scratch + 0x5)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->chain_word_high
|
- &*(char *)((byte *)saved_scratch + 0x5)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->chain_word_high
|
- &((char *)saved_scratch)[0x5]
+ (char *)&((uw_object_hdr_t *)saved_scratch)->chain_word_high
)
...>
}


@receiver_8_w_4_34_store_5@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x5) = E;
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high = (byte)E;
|
- *(char *)((byte *)saved_scratch + 0x5) = E;
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high = (byte)E;
|
- ((char *)saved_scratch)[0x5] = E;
+ ((uw_object_hdr_t *)saved_scratch)->chain_word_high = (byte)E;
)
...>
}


@receiver_8_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x5)
+ (char)((uw_object_hdr_t *)saved_scratch)->chain_word_high
|
- *(char *)((byte *)saved_scratch + 0x5)
+ (char)((uw_object_hdr_t *)saved_scratch)->chain_word_high
|
- ((char *)saved_scratch)[0x5]
+ (char)((uw_object_hdr_t *)saved_scratch)->chain_word_high
)
...>
}


@receiver_8_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_scratch + 0x6) = (char)V;
- *(char *)((char *)saved_scratch + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_scratch + 0x6) = (char)V;
- *(byte *)((char *)saved_scratch + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_scratch + 0x6) = (byte)V;
- *(char *)((char *)saved_scratch + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_scratch + 0x6) = (byte)V;
- *(byte *)((char *)saved_scratch + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_scratch)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word
|
- *(ushort *)((byte *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word
|
- ((ushort *)saved_scratch)[0x3]
+ ((uw_object_hdr_t *)saved_scratch)->link_word
|
- *(ushort *)((ushort *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->link_word
)
...>
}


@receiver_8_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word
|
- *(undefined2 *)((byte *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word
|
- ((undefined2 *)saved_scratch)[0x3]
+ ((uw_object_hdr_t *)saved_scratch)->link_word
|
- *(undefined2 *)((undefined2 *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->link_word
)
...>
}


@receiver_8_w_6_51_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_signed
|
- *(short *)((byte *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_signed
|
- ((short *)saved_scratch)[0x3]
+ ((uw_object_hdr_t *)saved_scratch)->link_word_signed
|
- *(short *)((short *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_signed
)
...>
}


@receiver_8_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- *(byte *)((byte *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- ((byte *)saved_scratch)[0x6]
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- *(byte *)((ushort *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- (byte)((ushort *)saved_scratch)[0x3]
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
)
...>
}


@receiver_8_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- *(undefined1 *)((byte *)saved_scratch + 0x6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- ((undefined1 *)saved_scratch)[0x6]
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- *(undefined1 *)((ushort *)saved_scratch + 0x3)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- (undefined1)((ushort *)saved_scratch)[0x3]
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low
)
...>
}


@receiver_8_w_6_51_address_6@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_scratch + 0x6)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- &*(char *)((byte *)saved_scratch + 0x6)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- &((char *)saved_scratch)[0x6]
+ (char *)&((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- &*(char *)((ushort *)saved_scratch + 0x3)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->link_word_low
)
...>
}


@receiver_8_w_6_51_store_6@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x6) = E;
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low = (byte)E;
|
- *(char *)((byte *)saved_scratch + 0x6) = E;
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low = (byte)E;
|
- ((char *)saved_scratch)[0x6] = E;
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low = (byte)E;
|
- *(char *)((ushort *)saved_scratch + 0x3) = E;
+ ((uw_object_hdr_t *)saved_scratch)->link_word_low = (byte)E;
)
...>
}


@receiver_8_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x6)
+ (char)((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- *(char *)((byte *)saved_scratch + 0x6)
+ (char)((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- ((char *)saved_scratch)[0x6]
+ (char)((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- *(char *)((ushort *)saved_scratch + 0x3)
+ (char)((uw_object_hdr_t *)saved_scratch)->link_word_low
|
- (char)((ushort *)saved_scratch)[0x3]
+ (char)((uw_object_hdr_t *)saved_scratch)->link_word_low
)
...>
}


@receiver_8_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_scratch + 0x7)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high
|
- *(byte *)((byte *)saved_scratch + 0x7)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high
|
- ((byte *)saved_scratch)[0x7]
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high
)
...>
}


@receiver_8_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_scratch + 0x7)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high
|
- *(undefined1 *)((byte *)saved_scratch + 0x7)
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high
|
- ((undefined1 *)saved_scratch)[0x7]
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high
)
...>
}


@receiver_8_w_6_51_address_7@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_scratch + 0x7)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->link_word_high
|
- &*(char *)((byte *)saved_scratch + 0x7)
+ (char *)&((uw_object_hdr_t *)saved_scratch)->link_word_high
|
- &((char *)saved_scratch)[0x7]
+ (char *)&((uw_object_hdr_t *)saved_scratch)->link_word_high
)
...>
}


@receiver_8_w_6_51_store_7@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x7) = E;
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high = (byte)E;
|
- *(char *)((byte *)saved_scratch + 0x7) = E;
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high = (byte)E;
|
- ((char *)saved_scratch)[0x7] = E;
+ ((uw_object_hdr_t *)saved_scratch)->link_word_high = (byte)E;
)
...>
}


@receiver_8_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_scratch + 0x7)
+ (char)((uw_object_hdr_t *)saved_scratch)->link_word_high
|
- *(char *)((byte *)saved_scratch + 0x7)
+ (char)((uw_object_hdr_t *)saved_scratch)->link_word_high
|
- ((char *)saved_scratch)[0x7]
+ (char)((uw_object_hdr_t *)saved_scratch)->link_word_high
)
...>
}


@receiver_9_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_0_0_word_ushort@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags
|
- target[0x0]
+ ((uw_object_hdr_t *)target)->type_flags
|
- *target
+ ((uw_object_hdr_t *)target)->type_flags
)
...>
}


@receiver_9_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags
|
- *(undefined2 *)((byte *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags
|
- ((undefined2 *)target)[0x0]
+ ((uw_object_hdr_t *)target)->type_flags
|
- *(undefined2 *)((undefined2 *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags
|
- *(undefined2 *)(target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags
|
- target[0x0]
+ ((uw_object_hdr_t *)target)->type_flags
|
- *target
+ ((uw_object_hdr_t *)target)->type_flags
)
...>
}


@receiver_9_w_0_0_word_short@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_signed
)
...>
}


@receiver_9_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- (byte)target[0x0]
+ ((uw_object_hdr_t *)target)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- (undefined1)target[0x0]
+ ((uw_object_hdr_t *)target)->type_flags_low
)
...>
}


@receiver_9_w_0_0_address_0@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)target + 0x0)
+ (char *)&((uw_object_hdr_t *)target)->type_flags_low
|
- &*(char *)((byte *)target + 0x0)
+ (char *)&((uw_object_hdr_t *)target)->type_flags_low
|
- &((char *)target)[0x0]
+ (char *)&((uw_object_hdr_t *)target)->type_flags_low
|
- &*(char *)((ushort *)target + 0x0)
+ (char *)&((uw_object_hdr_t *)target)->type_flags_low
|
- &*(char *)target
+ (char *)&((uw_object_hdr_t *)target)->type_flags_low
|
- &*(char *)(target + 0x0)
+ (char *)&((uw_object_hdr_t *)target)->type_flags_low
)
...>
}


@receiver_9_w_0_0_store_0@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(target + 0x0) = E;
+ ((uw_object_hdr_t *)target)->type_flags_low = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(target + 0x0)
+ (char)((uw_object_hdr_t *)target)->type_flags_low
|
- (char)target[0x0]
+ (char)((uw_object_hdr_t *)target)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_0_0_address_1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)target + 0x1)
+ (char *)&((uw_object_hdr_t *)target)->type_flags_high
|
- &*(char *)((byte *)target + 0x1)
+ (char *)&((uw_object_hdr_t *)target)->type_flags_high
|
- &((char *)target)[0x1]
+ (char *)&((uw_object_hdr_t *)target)->type_flags_high
)
...>
}


@receiver_9_w_0_0_store_1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_9_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_2_17_word_ushort@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word
|
- target[0x1]
+ ((uw_object_hdr_t *)target)->position_word
)
...>
}


@receiver_9_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word
|
- *(undefined2 *)((byte *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word
|
- ((undefined2 *)target)[0x1]
+ ((uw_object_hdr_t *)target)->position_word
|
- *(undefined2 *)((undefined2 *)target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word
|
- *(undefined2 *)(target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word
|
- target[0x1]
+ ((uw_object_hdr_t *)target)->position_word
)
...>
}


@receiver_9_w_2_17_word_short@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word_signed
)
...>
}


@receiver_9_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word_low
|
- (byte)target[0x1]
+ ((uw_object_hdr_t *)target)->position_word_low
)
...>
}


@receiver_9_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word_low
|
- (undefined1)target[0x1]
+ ((uw_object_hdr_t *)target)->position_word_low
)
...>
}


@receiver_9_w_2_17_address_2@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)target + 0x2)
+ (char *)&((uw_object_hdr_t *)target)->position_word_low
|
- &*(char *)((byte *)target + 0x2)
+ (char *)&((uw_object_hdr_t *)target)->position_word_low
|
- &((char *)target)[0x2]
+ (char *)&((uw_object_hdr_t *)target)->position_word_low
|
- &*(char *)((ushort *)target + 0x1)
+ (char *)&((uw_object_hdr_t *)target)->position_word_low
|
- &*(char *)(target + 0x1)
+ (char *)&((uw_object_hdr_t *)target)->position_word_low
)
...>
}


@receiver_9_w_2_17_store_2@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(target + 0x1) = E;
+ ((uw_object_hdr_t *)target)->position_word_low = (byte)E;
)
...>
}


@receiver_9_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(target + 0x1)
+ (char)((uw_object_hdr_t *)target)->position_word_low
|
- (char)target[0x1]
+ (char)((uw_object_hdr_t *)target)->position_word_low
)
...>
}


@receiver_9_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_2_17_address_3@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)target + 0x3)
+ (char *)&((uw_object_hdr_t *)target)->position_word_high
|
- &*(char *)((byte *)target + 0x3)
+ (char *)&((uw_object_hdr_t *)target)->position_word_high
|
- &((char *)target)[0x3]
+ (char *)&((uw_object_hdr_t *)target)->position_word_high
)
...>
}


@receiver_9_w_2_17_store_3@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_9_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_4_34_word_ushort@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word
|
- target[0x2]
+ ((uw_object_hdr_t *)target)->chain_word
)
...>
}


@receiver_9_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word
|
- *(undefined2 *)((byte *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word
|
- ((undefined2 *)target)[0x2]
+ ((uw_object_hdr_t *)target)->chain_word
|
- *(undefined2 *)((undefined2 *)target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word
|
- *(undefined2 *)(target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word
|
- target[0x2]
+ ((uw_object_hdr_t *)target)->chain_word
)
...>
}


@receiver_9_w_4_34_word_short@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word_signed
)
...>
}


@receiver_9_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- (byte)target[0x2]
+ ((uw_object_hdr_t *)target)->chain_word_low
)
...>
}


@receiver_9_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- (undefined1)target[0x2]
+ ((uw_object_hdr_t *)target)->chain_word_low
)
...>
}


@receiver_9_w_4_34_address_4@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)target + 0x4)
+ (char *)&((uw_object_hdr_t *)target)->chain_word_low
|
- &*(char *)((byte *)target + 0x4)
+ (char *)&((uw_object_hdr_t *)target)->chain_word_low
|
- &((char *)target)[0x4]
+ (char *)&((uw_object_hdr_t *)target)->chain_word_low
|
- &*(char *)((ushort *)target + 0x2)
+ (char *)&((uw_object_hdr_t *)target)->chain_word_low
|
- &*(char *)(target + 0x2)
+ (char *)&((uw_object_hdr_t *)target)->chain_word_low
)
...>
}


@receiver_9_w_4_34_store_4@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(target + 0x2) = E;
+ ((uw_object_hdr_t *)target)->chain_word_low = (byte)E;
)
...>
}


@receiver_9_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(target + 0x2)
+ (char)((uw_object_hdr_t *)target)->chain_word_low
|
- (char)target[0x2]
+ (char)((uw_object_hdr_t *)target)->chain_word_low
)
...>
}


@receiver_9_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_4_34_address_5@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)target + 0x5)
+ (char *)&((uw_object_hdr_t *)target)->chain_word_high
|
- &*(char *)((byte *)target + 0x5)
+ (char *)&((uw_object_hdr_t *)target)->chain_word_high
|
- &((char *)target)[0x5]
+ (char *)&((uw_object_hdr_t *)target)->chain_word_high
)
...>
}


@receiver_9_w_4_34_store_5@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_9_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@receiver_9_w_6_51_word_ushort@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word
|
- target[0x3]
+ ((uw_object_hdr_t *)target)->link_word
)
...>
}


@receiver_9_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word
|
- *(undefined2 *)((byte *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word
|
- ((undefined2 *)target)[0x3]
+ ((uw_object_hdr_t *)target)->link_word
|
- *(undefined2 *)((undefined2 *)target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word
|
- *(undefined2 *)(target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word
|
- target[0x3]
+ ((uw_object_hdr_t *)target)->link_word
)
...>
}


@receiver_9_w_6_51_word_short@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word_signed
)
...>
}


@receiver_9_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word_low
|
- (byte)target[0x3]
+ ((uw_object_hdr_t *)target)->link_word_low
)
...>
}


@receiver_9_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word_low
|
- (undefined1)target[0x3]
+ ((uw_object_hdr_t *)target)->link_word_low
)
...>
}


@receiver_9_w_6_51_address_6@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)target + 0x6)
+ (char *)&((uw_object_hdr_t *)target)->link_word_low
|
- &*(char *)((byte *)target + 0x6)
+ (char *)&((uw_object_hdr_t *)target)->link_word_low
|
- &((char *)target)[0x6]
+ (char *)&((uw_object_hdr_t *)target)->link_word_low
|
- &*(char *)((ushort *)target + 0x3)
+ (char *)&((uw_object_hdr_t *)target)->link_word_low
|
- &*(char *)(target + 0x3)
+ (char *)&((uw_object_hdr_t *)target)->link_word_low
)
...>
}


@receiver_9_w_6_51_store_6@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(target + 0x3) = E;
+ ((uw_object_hdr_t *)target)->link_word_low = (byte)E;
)
...>
}


@receiver_9_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(target + 0x3)
+ (char)((uw_object_hdr_t *)target)->link_word_low
|
- (char)target[0x3]
+ (char)((uw_object_hdr_t *)target)->link_word_low
)
...>
}


@receiver_9_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_9_w_6_51_address_7@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)target + 0x7)
+ (char *)&((uw_object_hdr_t *)target)->link_word_high
|
- &*(char *)((byte *)target + 0x7)
+ (char *)&((uw_object_hdr_t *)target)->link_word_high
|
- &((char *)target)[0x7]
+ (char *)&((uw_object_hdr_t *)target)->link_word_high
)
...>
}


@receiver_9_w_6_51_store_7@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_9_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_10_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_0_0_word_ushort@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(ushort *)(iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
)
...>
}


@receiver_10_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined2 *)(iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
)
...>
}


@receiver_10_w_0_0_word_short@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(short *)(iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
)
...>
}


@receiver_10_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(byte *)(iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined1 *)(iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_10_w_0_0_address_0@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- &*(char *)(iVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &iVar3[0x0]
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &*iVar3
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_10_w_0_0_store_0@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- iVar3[0x0] = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- *iVar3 = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x0)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- iVar3[0x0]
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *iVar3
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(byte *)(iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_10_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined1 *)(iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_10_w_0_0_address_1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- &*(char *)(iVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_high
|
- &iVar3[0x1]
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_10_w_0_0_store_1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_high = (byte)E;
|
- iVar3[0x1] = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x1)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_high
|
- iVar3[0x1]
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_10_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_2_17_word_ushort@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(ushort *)(iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
)
...>
}


@receiver_10_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined2 *)(iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
)
...>
}


@receiver_10_w_2_17_word_short@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(short *)(iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
)
...>
}


@receiver_10_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(byte *)(iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined1 *)(iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_10_w_2_17_address_2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- &*(char *)(iVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
|
- &iVar3[0x2]
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_10_w_2_17_store_2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
|
- iVar3[0x2] = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x2)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- iVar3[0x2]
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(byte *)(iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_10_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined1 *)(iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_10_w_2_17_address_3@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- &*(char *)(iVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_high
|
- &iVar3[0x3]
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_10_w_2_17_store_3@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)E;
|
- iVar3[0x3] = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x3)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_high
|
- iVar3[0x3]
+ (char)((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_10_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_4_34_word_ushort@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(ushort *)(iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
)
...>
}


@receiver_10_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined2 *)(iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
)
...>
}


@receiver_10_w_4_34_word_short@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(short *)(iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
)
...>
}


@receiver_10_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(byte *)(iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined1 *)(iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_10_w_4_34_address_4@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- &*(char *)(iVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
|
- &iVar3[0x4]
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_10_w_4_34_store_4@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
|
- iVar3[0x4] = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x4)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- iVar3[0x4]
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(byte *)(iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_10_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined1 *)(iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_10_w_4_34_address_5@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- &*(char *)(iVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_high
|
- &iVar3[0x5]
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_10_w_4_34_store_5@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)E;
|
- iVar3[0x5] = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x5)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_high
|
- iVar3[0x5]
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_10_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_10_w_6_51_word_ushort@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(ushort *)(iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
)
...>
}


@receiver_10_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined2 *)(iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
)
...>
}


@receiver_10_w_6_51_word_short@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(short *)(iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
)
...>
}


@receiver_10_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(byte *)(iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined1 *)(iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_10_w_6_51_address_6@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- &*(char *)(iVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
|
- &iVar3[0x6]
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_10_w_6_51_store_6@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
|
- iVar3[0x6] = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x6)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- iVar3[0x6]
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(byte *)(iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_10_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(undefined1 *)(iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_10_w_6_51_address_7@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- &*(char *)(iVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_high
|
- &iVar3[0x7]
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_10_w_6_51_store_7@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_high = (byte)E;
|
- iVar3[0x7] = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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
|
- *(char *)(iVar3 + 0x7)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_high
|
- iVar3[0x7]
+ (char)((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_11_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_0_0_word_ushort@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_11_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(undefined2 *)((byte *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- ((undefined2 *)uVar4)[0x0]
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(undefined2 *)((undefined2 *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
)
...>
}


@receiver_11_w_0_0_word_short@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_11_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_0_0_address_0@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar4)->type_flags_low
|
- &*(char *)((byte *)uVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar4)->type_flags_low
|
- &((char *)uVar4)[0x0]
+ (char *)&((uw_object_hdr_t *)uVar4)->type_flags_low
|
- &*(char *)((ushort *)uVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar4)->type_flags_low
|
- &*(char *)uVar4
+ (char *)&((uw_object_hdr_t *)uVar4)->type_flags_low
)
...>
}


@receiver_11_w_0_0_store_0@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_11_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_0_0_address_1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar4)->type_flags_high
|
- &*(char *)((byte *)uVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar4)->type_flags_high
|
- &((char *)uVar4)[0x1]
+ (char *)&((uw_object_hdr_t *)uVar4)->type_flags_high
)
...>
}


@receiver_11_w_0_0_store_1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_11_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_2_17_word_ushort@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_11_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- *(undefined2 *)((byte *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- ((undefined2 *)uVar4)[0x1]
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- *(undefined2 *)((undefined2 *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->position_word
)
...>
}


@receiver_11_w_2_17_word_short@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_11_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_2_17_address_2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar4)->position_word_low
|
- &*(char *)((byte *)uVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar4)->position_word_low
|
- &((char *)uVar4)[0x2]
+ (char *)&((uw_object_hdr_t *)uVar4)->position_word_low
|
- &*(char *)((ushort *)uVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar4)->position_word_low
)
...>
}


@receiver_11_w_2_17_store_2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_11_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_2_17_address_3@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar4)->position_word_high
|
- &*(char *)((byte *)uVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar4)->position_word_high
|
- &((char *)uVar4)[0x3]
+ (char *)&((uw_object_hdr_t *)uVar4)->position_word_high
)
...>
}


@receiver_11_w_2_17_store_3@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_11_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_4_34_word_ushort@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_11_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- *(undefined2 *)((byte *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- ((undefined2 *)uVar4)[0x2]
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- *(undefined2 *)((undefined2 *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->chain_word
)
...>
}


@receiver_11_w_4_34_word_short@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_11_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_4_34_address_4@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)uVar4)->chain_word_low
|
- &*(char *)((byte *)uVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)uVar4)->chain_word_low
|
- &((char *)uVar4)[0x4]
+ (char *)&((uw_object_hdr_t *)uVar4)->chain_word_low
|
- &*(char *)((ushort *)uVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar4)->chain_word_low
)
...>
}


@receiver_11_w_4_34_store_4@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_11_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_4_34_address_5@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)uVar4)->chain_word_high
|
- &*(char *)((byte *)uVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)uVar4)->chain_word_high
|
- &((char *)uVar4)[0x5]
+ (char *)&((uw_object_hdr_t *)uVar4)->chain_word_high
)
...>
}


@receiver_11_w_4_34_store_5@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_11_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@receiver_11_w_6_51_word_ushort@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_11_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- *(undefined2 *)((byte *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- ((undefined2 *)uVar4)[0x3]
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- *(undefined2 *)((undefined2 *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->link_word
)
...>
}


@receiver_11_w_6_51_word_short@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_11_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_6_51_address_6@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)uVar4)->link_word_low
|
- &*(char *)((byte *)uVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)uVar4)->link_word_low
|
- &((char *)uVar4)[0x6]
+ (char *)&((uw_object_hdr_t *)uVar4)->link_word_low
|
- &*(char *)((ushort *)uVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar4)->link_word_low
)
...>
}


@receiver_11_w_6_51_store_6@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_11_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_11_w_6_51_address_7@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)uVar4)->link_word_high
|
- &*(char *)((byte *)uVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)uVar4)->link_word_high
|
- &((char *)uVar4)[0x7]
+ (char *)&((uw_object_hdr_t *)uVar4)->link_word_high
)
...>
}


@receiver_11_w_6_51_store_7@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_11_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_12_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_0_0_word_ushort@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_word_short@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_address_0@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_store_0@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_address_1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_store_1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_2_17_word_ushort@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_word_short@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_address_2@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_store_2@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_address_3@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_store_3@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_4_34_word_ushort@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_word_short@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_address_4@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_store_4@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_address_5@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_store_5@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@receiver_12_w_6_51_word_ushort@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_word_short@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_address_6@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_store_6@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_address_7@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_store_7@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_12_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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


@receiver_13_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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

@receiver_13_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_13_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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


@receiver_14_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x0) = (char)V;
- *(char *)((char *)npc + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x0) = (char)V;
- *(byte *)((char *)npc + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x0) = (byte)V;
- *(char *)((char *)npc + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x0) = (byte)V;
- *(byte *)((char *)npc + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_word_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- ((ushort *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)((ushort *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}


@receiver_14_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(undefined2 *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- ((undefined2 *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(undefined2 *)((undefined2 *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}


@receiver_14_w_0_0_word_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_signed
|
- *(short *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_signed
|
- ((short *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_signed
|
- *(short *)((short *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_signed
)
...>
}


@receiver_14_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(byte *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- ((byte *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(byte *)((ushort *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- (byte)((ushort *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(byte *)npc
+ ((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_14_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(undefined1 *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- ((undefined1 *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(undefined1 *)((ushort *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- (undefined1)((ushort *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(undefined1 *)npc
+ ((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_14_w_0_0_address_0@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc + 0x0)
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
|
- &*(char *)((byte *)npc + 0x0)
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
|
- &((char *)npc)[0x0]
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
|
- &*(char *)((ushort *)npc + 0x0)
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
|
- &*(char *)npc
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_14_w_0_0_store_0@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x0) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- *(char *)((byte *)npc + 0x0) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- ((char *)npc)[0x0] = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)npc + 0x0) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- *(char *)npc = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
)
...>
}


@receiver_14_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x0)
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- *(char *)((byte *)npc + 0x0)
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- ((char *)npc)[0x0]
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- *(char *)((ushort *)npc + 0x0)
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- (char)((ushort *)npc)[0x0]
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- *(char *)npc
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_14_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
|
- *(byte *)((byte *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
|
- ((byte *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_14_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
|
- *(undefined1 *)((byte *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
|
- ((undefined1 *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_14_w_0_0_address_1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc + 0x1)
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_high
|
- &*(char *)((byte *)npc + 0x1)
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_high
|
- &((char *)npc)[0x1]
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_14_w_0_0_store_1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x1) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_high = (byte)E;
|
- *(char *)((byte *)npc + 0x1) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_high = (byte)E;
|
- ((char *)npc)[0x1] = E;
+ ((uw_object_hdr_t *)npc)->type_flags_high = (byte)E;
)
...>
}


@receiver_14_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x1)
+ (char)((uw_object_hdr_t *)npc)->type_flags_high
|
- *(char *)((byte *)npc + 0x1)
+ (char)((uw_object_hdr_t *)npc)->type_flags_high
|
- ((char *)npc)[0x1]
+ (char)((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_14_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x2) = (char)V;
- *(char *)((char *)npc + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x2) = (char)V;
- *(byte *)((char *)npc + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x2) = (byte)V;
- *(char *)((char *)npc + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x2) = (byte)V;
- *(byte *)((char *)npc + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_word_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- *(ushort *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- ((ushort *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word
|
- *(ushort *)((ushort *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}


@receiver_14_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- *(undefined2 *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- ((undefined2 *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word
|
- *(undefined2 *)((undefined2 *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}


@receiver_14_w_2_17_word_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_signed
|
- *(short *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_signed
|
- ((short *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word_signed
|
- *(short *)((short *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_signed
)
...>
}


@receiver_14_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- *(byte *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- ((byte *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- *(byte *)((ushort *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- (byte)((ushort *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_14_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- *(undefined1 *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- ((undefined1 *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- *(undefined1 *)((ushort *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- (undefined1)((ushort *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_14_w_2_17_address_2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc + 0x2)
+ (char *)&((uw_object_hdr_t *)npc)->position_word_low
|
- &*(char *)((byte *)npc + 0x2)
+ (char *)&((uw_object_hdr_t *)npc)->position_word_low
|
- &((char *)npc)[0x2]
+ (char *)&((uw_object_hdr_t *)npc)->position_word_low
|
- &*(char *)((ushort *)npc + 0x1)
+ (char *)&((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_14_w_2_17_store_2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x2) = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
|
- *(char *)((byte *)npc + 0x2) = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
|
- ((char *)npc)[0x2] = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
|
- *(char *)((ushort *)npc + 0x1) = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
)
...>
}


@receiver_14_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x2)
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- *(char *)((byte *)npc + 0x2)
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- ((char *)npc)[0x2]
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- *(char *)((ushort *)npc + 0x1)
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- (char)((ushort *)npc)[0x1]
+ (char)((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_14_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
|
- *(byte *)((byte *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
|
- ((byte *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_14_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
|
- *(undefined1 *)((byte *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
|
- ((undefined1 *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_14_w_2_17_address_3@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc + 0x3)
+ (char *)&((uw_object_hdr_t *)npc)->position_word_high
|
- &*(char *)((byte *)npc + 0x3)
+ (char *)&((uw_object_hdr_t *)npc)->position_word_high
|
- &((char *)npc)[0x3]
+ (char *)&((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_14_w_2_17_store_3@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x3) = E;
+ ((uw_object_hdr_t *)npc)->position_word_high = (byte)E;
|
- *(char *)((byte *)npc + 0x3) = E;
+ ((uw_object_hdr_t *)npc)->position_word_high = (byte)E;
|
- ((char *)npc)[0x3] = E;
+ ((uw_object_hdr_t *)npc)->position_word_high = (byte)E;
)
...>
}


@receiver_14_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x3)
+ (char)((uw_object_hdr_t *)npc)->position_word_high
|
- *(char *)((byte *)npc + 0x3)
+ (char)((uw_object_hdr_t *)npc)->position_word_high
|
- ((char *)npc)[0x3]
+ (char)((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_14_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x4) = (char)V;
- *(char *)((char *)npc + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x4) = (char)V;
- *(byte *)((char *)npc + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x4) = (byte)V;
- *(char *)((char *)npc + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x4) = (byte)V;
- *(byte *)((char *)npc + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_word_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- *(ushort *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- ((ushort *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word
|
- *(ushort *)((ushort *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}


@receiver_14_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- *(undefined2 *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- ((undefined2 *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word
|
- *(undefined2 *)((undefined2 *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}


@receiver_14_w_4_34_word_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_signed
|
- *(short *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_signed
|
- ((short *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word_signed
|
- *(short *)((short *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_signed
)
...>
}


@receiver_14_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- *(byte *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- ((byte *)npc)[0x4]
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- *(byte *)((ushort *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- (byte)((ushort *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_14_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- *(undefined1 *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- ((undefined1 *)npc)[0x4]
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- *(undefined1 *)((ushort *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- (undefined1)((ushort *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_14_w_4_34_address_4@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc + 0x4)
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_low
|
- &*(char *)((byte *)npc + 0x4)
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_low
|
- &((char *)npc)[0x4]
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_low
|
- &*(char *)((ushort *)npc + 0x2)
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_14_w_4_34_store_4@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x4) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
|
- *(char *)((byte *)npc + 0x4) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
|
- ((char *)npc)[0x4] = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)npc + 0x2) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
)
...>
}


@receiver_14_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x4)
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- *(char *)((byte *)npc + 0x4)
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- ((char *)npc)[0x4]
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- *(char *)((ushort *)npc + 0x2)
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- (char)((ushort *)npc)[0x2]
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_14_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
|
- *(byte *)((byte *)npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
|
- ((byte *)npc)[0x5]
+ ((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_14_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
|
- *(undefined1 *)((byte *)npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
|
- ((undefined1 *)npc)[0x5]
+ ((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_14_w_4_34_address_5@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc + 0x5)
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_high
|
- &*(char *)((byte *)npc + 0x5)
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_high
|
- &((char *)npc)[0x5]
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_14_w_4_34_store_5@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x5) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_high = (byte)E;
|
- *(char *)((byte *)npc + 0x5) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_high = (byte)E;
|
- ((char *)npc)[0x5] = E;
+ ((uw_object_hdr_t *)npc)->chain_word_high = (byte)E;
)
...>
}


@receiver_14_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x5)
+ (char)((uw_object_hdr_t *)npc)->chain_word_high
|
- *(char *)((byte *)npc + 0x5)
+ (char)((uw_object_hdr_t *)npc)->chain_word_high
|
- ((char *)npc)[0x5]
+ (char)((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_14_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x6) = (char)V;
- *(char *)((char *)npc + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x6) = (char)V;
- *(byte *)((char *)npc + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x6) = (byte)V;
- *(char *)((char *)npc + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x6) = (byte)V;
- *(byte *)((char *)npc + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_word_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- *(ushort *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- ((ushort *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word
|
- *(ushort *)((ushort *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}


@receiver_14_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- *(undefined2 *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- ((undefined2 *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word
|
- *(undefined2 *)((undefined2 *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}


@receiver_14_w_6_51_word_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_signed
|
- *(short *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_signed
|
- ((short *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word_signed
|
- *(short *)((short *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_signed
)
...>
}


@receiver_14_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- *(byte *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- ((byte *)npc)[0x6]
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- *(byte *)((ushort *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- (byte)((ushort *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_14_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- *(undefined1 *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- ((undefined1 *)npc)[0x6]
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- *(undefined1 *)((ushort *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- (undefined1)((ushort *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_14_w_6_51_address_6@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc + 0x6)
+ (char *)&((uw_object_hdr_t *)npc)->link_word_low
|
- &*(char *)((byte *)npc + 0x6)
+ (char *)&((uw_object_hdr_t *)npc)->link_word_low
|
- &((char *)npc)[0x6]
+ (char *)&((uw_object_hdr_t *)npc)->link_word_low
|
- &*(char *)((ushort *)npc + 0x3)
+ (char *)&((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_14_w_6_51_store_6@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x6) = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
|
- *(char *)((byte *)npc + 0x6) = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
|
- ((char *)npc)[0x6] = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
|
- *(char *)((ushort *)npc + 0x3) = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
)
...>
}


@receiver_14_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x6)
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- *(char *)((byte *)npc + 0x6)
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- ((char *)npc)[0x6]
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- *(char *)((ushort *)npc + 0x3)
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- (char)((ushort *)npc)[0x3]
+ (char)((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_14_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
|
- *(byte *)((byte *)npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
|
- ((byte *)npc)[0x7]
+ ((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_14_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
|
- *(undefined1 *)((byte *)npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
|
- ((undefined1 *)npc)[0x7]
+ ((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_14_w_6_51_address_7@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc + 0x7)
+ (char *)&((uw_object_hdr_t *)npc)->link_word_high
|
- &*(char *)((byte *)npc + 0x7)
+ (char *)&((uw_object_hdr_t *)npc)->link_word_high
|
- &((char *)npc)[0x7]
+ (char *)&((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_14_w_6_51_store_7@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x7) = E;
+ ((uw_object_hdr_t *)npc)->link_word_high = (byte)E;
|
- *(char *)((byte *)npc + 0x7) = E;
+ ((uw_object_hdr_t *)npc)->link_word_high = (byte)E;
|
- ((char *)npc)[0x7] = E;
+ ((uw_object_hdr_t *)npc)->link_word_high = (byte)E;
)
...>
}


@receiver_14_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x7)
+ (char)((uw_object_hdr_t *)npc)->link_word_high
|
- *(char *)((byte *)npc + 0x7)
+ (char)((uw_object_hdr_t *)npc)->link_word_high
|
- ((char *)npc)[0x7]
+ (char)((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_15_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)chain_item + 0x0) = (char)V;
- *(char *)((char *)chain_item + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)chain_item + 0x0) = (char)V;
- *(byte *)((char *)chain_item + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)chain_item + 0x0) = (byte)V;
- *(char *)((char *)chain_item + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)chain_item + 0x0) = (byte)V;
- *(byte *)((char *)chain_item + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_word_ushort@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *(ushort *)((byte *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- ((ushort *)chain_item)[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *(ushort *)((ushort *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *(ushort *)(chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- chain_item[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *chain_item
+ ((uw_object_hdr_t *)chain_item)->type_flags
)
...>
}


@receiver_15_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *(undefined2 *)((byte *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- ((undefined2 *)chain_item)[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *(undefined2 *)((undefined2 *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *(undefined2 *)(chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- chain_item[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *chain_item
+ ((uw_object_hdr_t *)chain_item)->type_flags
)
...>
}


@receiver_15_w_0_0_word_short@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_signed
|
- *(short *)((byte *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_signed
|
- ((short *)chain_item)[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags_signed
|
- *(short *)((short *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_signed
|
- *(short *)(chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_signed
)
...>
}


@receiver_15_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(byte *)((byte *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- ((byte *)chain_item)[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(byte *)((ushort *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- (byte)((ushort *)chain_item)[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(byte *)chain_item
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(byte *)(chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- (byte)chain_item[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(undefined1 *)((byte *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- ((undefined1 *)chain_item)[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(undefined1 *)((ushort *)chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- (undefined1)((ushort *)chain_item)[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(undefined1 *)chain_item
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(undefined1 *)(chain_item + 0x0)
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
|
- (undefined1)chain_item[0x0]
+ ((uw_object_hdr_t *)chain_item)->type_flags_low
)
...>
}


@receiver_15_w_0_0_address_0@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)chain_item + 0x0)
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_low
|
- &*(char *)((byte *)chain_item + 0x0)
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_low
|
- &((char *)chain_item)[0x0]
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_low
|
- &*(char *)((ushort *)chain_item + 0x0)
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_low
|
- &*(char *)chain_item
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_low
|
- &*(char *)(chain_item + 0x0)
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_low
)
...>
}


@receiver_15_w_0_0_store_0@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x0) = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_low = (byte)E;
|
- *(char *)((byte *)chain_item + 0x0) = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_low = (byte)E;
|
- ((char *)chain_item)[0x0] = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)chain_item + 0x0) = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_low = (byte)E;
|
- *(char *)chain_item = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_low = (byte)E;
|
- *(char *)(chain_item + 0x0) = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_low = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x0)
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(char *)((byte *)chain_item + 0x0)
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_low
|
- ((char *)chain_item)[0x0]
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(char *)((ushort *)chain_item + 0x0)
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_low
|
- (char)((ushort *)chain_item)[0x0]
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(char *)chain_item
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_low
|
- *(char *)(chain_item + 0x0)
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_low
|
- (char)chain_item[0x0]
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->type_flags_high
|
- *(byte *)((byte *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->type_flags_high
|
- ((byte *)chain_item)[0x1]
+ ((uw_object_hdr_t *)chain_item)->type_flags_high
)
...>
}


@receiver_15_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->type_flags_high
|
- *(undefined1 *)((byte *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->type_flags_high
|
- ((undefined1 *)chain_item)[0x1]
+ ((uw_object_hdr_t *)chain_item)->type_flags_high
)
...>
}


@receiver_15_w_0_0_address_1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)chain_item + 0x1)
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_high
|
- &*(char *)((byte *)chain_item + 0x1)
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_high
|
- &((char *)chain_item)[0x1]
+ (char *)&((uw_object_hdr_t *)chain_item)->type_flags_high
)
...>
}


@receiver_15_w_0_0_store_1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x1) = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_high = (byte)E;
|
- *(char *)((byte *)chain_item + 0x1) = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_high = (byte)E;
|
- ((char *)chain_item)[0x1] = E;
+ ((uw_object_hdr_t *)chain_item)->type_flags_high = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x1)
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_high
|
- *(char *)((byte *)chain_item + 0x1)
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_high
|
- ((char *)chain_item)[0x1]
+ (char)((uw_object_hdr_t *)chain_item)->type_flags_high
)
...>
}


@receiver_15_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)chain_item + 0x2) = (char)V;
- *(char *)((char *)chain_item + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)chain_item + 0x2) = (char)V;
- *(byte *)((char *)chain_item + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)chain_item + 0x2) = (byte)V;
- *(char *)((char *)chain_item + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)chain_item + 0x2) = (byte)V;
- *(byte *)((char *)chain_item + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_17_word_ushort@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- *(ushort *)((byte *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- ((ushort *)chain_item)[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- *(ushort *)((ushort *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- *(ushort *)(chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- chain_item[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word
)
...>
}


@receiver_15_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- *(undefined2 *)((byte *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- ((undefined2 *)chain_item)[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- *(undefined2 *)((undefined2 *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- *(undefined2 *)(chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- chain_item[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word
)
...>
}


@receiver_15_w_2_17_word_short@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word_signed
|
- *(short *)((byte *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word_signed
|
- ((short *)chain_item)[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word_signed
|
- *(short *)((short *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word_signed
|
- *(short *)(chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word_signed
)
...>
}


@receiver_15_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(byte *)((byte *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- ((byte *)chain_item)[0x2]
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(byte *)((ushort *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- (byte)((ushort *)chain_item)[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(byte *)(chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- (byte)chain_item[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word_low
)
...>
}


@receiver_15_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(undefined1 *)((byte *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- ((undefined1 *)chain_item)[0x2]
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(undefined1 *)((ushort *)chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- (undefined1)((ushort *)chain_item)[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(undefined1 *)(chain_item + 0x1)
+ ((uw_object_hdr_t *)chain_item)->position_word_low
|
- (undefined1)chain_item[0x1]
+ ((uw_object_hdr_t *)chain_item)->position_word_low
)
...>
}


@receiver_15_w_2_17_address_2@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)chain_item + 0x2)
+ (char *)&((uw_object_hdr_t *)chain_item)->position_word_low
|
- &*(char *)((byte *)chain_item + 0x2)
+ (char *)&((uw_object_hdr_t *)chain_item)->position_word_low
|
- &((char *)chain_item)[0x2]
+ (char *)&((uw_object_hdr_t *)chain_item)->position_word_low
|
- &*(char *)((ushort *)chain_item + 0x1)
+ (char *)&((uw_object_hdr_t *)chain_item)->position_word_low
|
- &*(char *)(chain_item + 0x1)
+ (char *)&((uw_object_hdr_t *)chain_item)->position_word_low
)
...>
}


@receiver_15_w_2_17_store_2@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x2) = E;
+ ((uw_object_hdr_t *)chain_item)->position_word_low = (byte)E;
|
- *(char *)((byte *)chain_item + 0x2) = E;
+ ((uw_object_hdr_t *)chain_item)->position_word_low = (byte)E;
|
- ((char *)chain_item)[0x2] = E;
+ ((uw_object_hdr_t *)chain_item)->position_word_low = (byte)E;
|
- *(char *)((ushort *)chain_item + 0x1) = E;
+ ((uw_object_hdr_t *)chain_item)->position_word_low = (byte)E;
|
- *(char *)(chain_item + 0x1) = E;
+ ((uw_object_hdr_t *)chain_item)->position_word_low = (byte)E;
)
...>
}


@receiver_15_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x2)
+ (char)((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(char *)((byte *)chain_item + 0x2)
+ (char)((uw_object_hdr_t *)chain_item)->position_word_low
|
- ((char *)chain_item)[0x2]
+ (char)((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(char *)((ushort *)chain_item + 0x1)
+ (char)((uw_object_hdr_t *)chain_item)->position_word_low
|
- (char)((ushort *)chain_item)[0x1]
+ (char)((uw_object_hdr_t *)chain_item)->position_word_low
|
- *(char *)(chain_item + 0x1)
+ (char)((uw_object_hdr_t *)chain_item)->position_word_low
|
- (char)chain_item[0x1]
+ (char)((uw_object_hdr_t *)chain_item)->position_word_low
)
...>
}


@receiver_15_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->position_word_high
|
- *(byte *)((byte *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->position_word_high
|
- ((byte *)chain_item)[0x3]
+ ((uw_object_hdr_t *)chain_item)->position_word_high
)
...>
}


@receiver_15_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->position_word_high
|
- *(undefined1 *)((byte *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->position_word_high
|
- ((undefined1 *)chain_item)[0x3]
+ ((uw_object_hdr_t *)chain_item)->position_word_high
)
...>
}


@receiver_15_w_2_17_address_3@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)chain_item + 0x3)
+ (char *)&((uw_object_hdr_t *)chain_item)->position_word_high
|
- &*(char *)((byte *)chain_item + 0x3)
+ (char *)&((uw_object_hdr_t *)chain_item)->position_word_high
|
- &((char *)chain_item)[0x3]
+ (char *)&((uw_object_hdr_t *)chain_item)->position_word_high
)
...>
}


@receiver_15_w_2_17_store_3@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x3) = E;
+ ((uw_object_hdr_t *)chain_item)->position_word_high = (byte)E;
|
- *(char *)((byte *)chain_item + 0x3) = E;
+ ((uw_object_hdr_t *)chain_item)->position_word_high = (byte)E;
|
- ((char *)chain_item)[0x3] = E;
+ ((uw_object_hdr_t *)chain_item)->position_word_high = (byte)E;
)
...>
}


@receiver_15_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x3)
+ (char)((uw_object_hdr_t *)chain_item)->position_word_high
|
- *(char *)((byte *)chain_item + 0x3)
+ (char)((uw_object_hdr_t *)chain_item)->position_word_high
|
- ((char *)chain_item)[0x3]
+ (char)((uw_object_hdr_t *)chain_item)->position_word_high
)
...>
}


@receiver_15_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)chain_item + 0x4) = (char)V;
- *(char *)((char *)chain_item + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)chain_item + 0x4) = (char)V;
- *(byte *)((char *)chain_item + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)chain_item + 0x4) = (byte)V;
- *(char *)((char *)chain_item + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)chain_item + 0x4) = (byte)V;
- *(byte *)((char *)chain_item + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_34_word_ushort@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- *(ushort *)((byte *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- ((ushort *)chain_item)[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- *(ushort *)((ushort *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- *(ushort *)(chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- chain_item[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word
)
...>
}


@receiver_15_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- *(undefined2 *)((byte *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- ((undefined2 *)chain_item)[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- *(undefined2 *)((undefined2 *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- *(undefined2 *)(chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- chain_item[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word
)
...>
}


@receiver_15_w_4_34_word_short@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word_signed
|
- *(short *)((byte *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word_signed
|
- ((short *)chain_item)[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word_signed
|
- *(short *)((short *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word_signed
|
- *(short *)(chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word_signed
)
...>
}


@receiver_15_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(byte *)((byte *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- ((byte *)chain_item)[0x4]
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(byte *)((ushort *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- (byte)((ushort *)chain_item)[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(byte *)(chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- (byte)chain_item[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
)
...>
}


@receiver_15_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(undefined1 *)((byte *)chain_item + 0x4)
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- ((undefined1 *)chain_item)[0x4]
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(undefined1 *)((ushort *)chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- (undefined1)((ushort *)chain_item)[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(undefined1 *)(chain_item + 0x2)
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
|
- (undefined1)chain_item[0x2]
+ ((uw_object_hdr_t *)chain_item)->chain_word_low
)
...>
}


@receiver_15_w_4_34_address_4@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)chain_item + 0x4)
+ (char *)&((uw_object_hdr_t *)chain_item)->chain_word_low
|
- &*(char *)((byte *)chain_item + 0x4)
+ (char *)&((uw_object_hdr_t *)chain_item)->chain_word_low
|
- &((char *)chain_item)[0x4]
+ (char *)&((uw_object_hdr_t *)chain_item)->chain_word_low
|
- &*(char *)((ushort *)chain_item + 0x2)
+ (char *)&((uw_object_hdr_t *)chain_item)->chain_word_low
|
- &*(char *)(chain_item + 0x2)
+ (char *)&((uw_object_hdr_t *)chain_item)->chain_word_low
)
...>
}


@receiver_15_w_4_34_store_4@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x4) = E;
+ ((uw_object_hdr_t *)chain_item)->chain_word_low = (byte)E;
|
- *(char *)((byte *)chain_item + 0x4) = E;
+ ((uw_object_hdr_t *)chain_item)->chain_word_low = (byte)E;
|
- ((char *)chain_item)[0x4] = E;
+ ((uw_object_hdr_t *)chain_item)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)chain_item + 0x2) = E;
+ ((uw_object_hdr_t *)chain_item)->chain_word_low = (byte)E;
|
- *(char *)(chain_item + 0x2) = E;
+ ((uw_object_hdr_t *)chain_item)->chain_word_low = (byte)E;
)
...>
}


@receiver_15_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x4)
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(char *)((byte *)chain_item + 0x4)
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_low
|
- ((char *)chain_item)[0x4]
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(char *)((ushort *)chain_item + 0x2)
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_low
|
- (char)((ushort *)chain_item)[0x2]
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_low
|
- *(char *)(chain_item + 0x2)
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_low
|
- (char)chain_item[0x2]
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_low
)
...>
}


@receiver_15_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)chain_item + 0x5)
+ ((uw_object_hdr_t *)chain_item)->chain_word_high
|
- *(byte *)((byte *)chain_item + 0x5)
+ ((uw_object_hdr_t *)chain_item)->chain_word_high
|
- ((byte *)chain_item)[0x5]
+ ((uw_object_hdr_t *)chain_item)->chain_word_high
)
...>
}


@receiver_15_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)chain_item + 0x5)
+ ((uw_object_hdr_t *)chain_item)->chain_word_high
|
- *(undefined1 *)((byte *)chain_item + 0x5)
+ ((uw_object_hdr_t *)chain_item)->chain_word_high
|
- ((undefined1 *)chain_item)[0x5]
+ ((uw_object_hdr_t *)chain_item)->chain_word_high
)
...>
}


@receiver_15_w_4_34_address_5@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)chain_item + 0x5)
+ (char *)&((uw_object_hdr_t *)chain_item)->chain_word_high
|
- &*(char *)((byte *)chain_item + 0x5)
+ (char *)&((uw_object_hdr_t *)chain_item)->chain_word_high
|
- &((char *)chain_item)[0x5]
+ (char *)&((uw_object_hdr_t *)chain_item)->chain_word_high
)
...>
}


@receiver_15_w_4_34_store_5@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x5) = E;
+ ((uw_object_hdr_t *)chain_item)->chain_word_high = (byte)E;
|
- *(char *)((byte *)chain_item + 0x5) = E;
+ ((uw_object_hdr_t *)chain_item)->chain_word_high = (byte)E;
|
- ((char *)chain_item)[0x5] = E;
+ ((uw_object_hdr_t *)chain_item)->chain_word_high = (byte)E;
)
...>
}


@receiver_15_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x5)
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_high
|
- *(char *)((byte *)chain_item + 0x5)
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_high
|
- ((char *)chain_item)[0x5]
+ (char)((uw_object_hdr_t *)chain_item)->chain_word_high
)
...>
}


@receiver_15_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)chain_item + 0x6) = (char)V;
- *(char *)((char *)chain_item + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)chain_item + 0x6) = (char)V;
- *(byte *)((char *)chain_item + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)chain_item + 0x6) = (byte)V;
- *(char *)((char *)chain_item + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)chain_item + 0x6) = (byte)V;
- *(byte *)((char *)chain_item + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)chain_item)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_51_word_ushort@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- *(ushort *)((byte *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- ((ushort *)chain_item)[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- *(ushort *)((ushort *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- *(ushort *)(chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- chain_item[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word
)
...>
}


@receiver_15_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- *(undefined2 *)((byte *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- ((undefined2 *)chain_item)[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- *(undefined2 *)((undefined2 *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- *(undefined2 *)(chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- chain_item[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word
)
...>
}


@receiver_15_w_6_51_word_short@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word_signed
|
- *(short *)((byte *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word_signed
|
- ((short *)chain_item)[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word_signed
|
- *(short *)((short *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word_signed
|
- *(short *)(chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word_signed
)
...>
}


@receiver_15_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(byte *)((byte *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- ((byte *)chain_item)[0x6]
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(byte *)((ushort *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- (byte)((ushort *)chain_item)[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(byte *)(chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- (byte)chain_item[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word_low
)
...>
}


@receiver_15_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(undefined1 *)((byte *)chain_item + 0x6)
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- ((undefined1 *)chain_item)[0x6]
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(undefined1 *)((ushort *)chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- (undefined1)((ushort *)chain_item)[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(undefined1 *)(chain_item + 0x3)
+ ((uw_object_hdr_t *)chain_item)->link_word_low
|
- (undefined1)chain_item[0x3]
+ ((uw_object_hdr_t *)chain_item)->link_word_low
)
...>
}


@receiver_15_w_6_51_address_6@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)chain_item + 0x6)
+ (char *)&((uw_object_hdr_t *)chain_item)->link_word_low
|
- &*(char *)((byte *)chain_item + 0x6)
+ (char *)&((uw_object_hdr_t *)chain_item)->link_word_low
|
- &((char *)chain_item)[0x6]
+ (char *)&((uw_object_hdr_t *)chain_item)->link_word_low
|
- &*(char *)((ushort *)chain_item + 0x3)
+ (char *)&((uw_object_hdr_t *)chain_item)->link_word_low
|
- &*(char *)(chain_item + 0x3)
+ (char *)&((uw_object_hdr_t *)chain_item)->link_word_low
)
...>
}


@receiver_15_w_6_51_store_6@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x6) = E;
+ ((uw_object_hdr_t *)chain_item)->link_word_low = (byte)E;
|
- *(char *)((byte *)chain_item + 0x6) = E;
+ ((uw_object_hdr_t *)chain_item)->link_word_low = (byte)E;
|
- ((char *)chain_item)[0x6] = E;
+ ((uw_object_hdr_t *)chain_item)->link_word_low = (byte)E;
|
- *(char *)((ushort *)chain_item + 0x3) = E;
+ ((uw_object_hdr_t *)chain_item)->link_word_low = (byte)E;
|
- *(char *)(chain_item + 0x3) = E;
+ ((uw_object_hdr_t *)chain_item)->link_word_low = (byte)E;
)
...>
}


@receiver_15_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x6)
+ (char)((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(char *)((byte *)chain_item + 0x6)
+ (char)((uw_object_hdr_t *)chain_item)->link_word_low
|
- ((char *)chain_item)[0x6]
+ (char)((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(char *)((ushort *)chain_item + 0x3)
+ (char)((uw_object_hdr_t *)chain_item)->link_word_low
|
- (char)((ushort *)chain_item)[0x3]
+ (char)((uw_object_hdr_t *)chain_item)->link_word_low
|
- *(char *)(chain_item + 0x3)
+ (char)((uw_object_hdr_t *)chain_item)->link_word_low
|
- (char)chain_item[0x3]
+ (char)((uw_object_hdr_t *)chain_item)->link_word_low
)
...>
}


@receiver_15_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)chain_item + 0x7)
+ ((uw_object_hdr_t *)chain_item)->link_word_high
|
- *(byte *)((byte *)chain_item + 0x7)
+ ((uw_object_hdr_t *)chain_item)->link_word_high
|
- ((byte *)chain_item)[0x7]
+ ((uw_object_hdr_t *)chain_item)->link_word_high
)
...>
}


@receiver_15_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)chain_item + 0x7)
+ ((uw_object_hdr_t *)chain_item)->link_word_high
|
- *(undefined1 *)((byte *)chain_item + 0x7)
+ ((uw_object_hdr_t *)chain_item)->link_word_high
|
- ((undefined1 *)chain_item)[0x7]
+ ((uw_object_hdr_t *)chain_item)->link_word_high
)
...>
}


@receiver_15_w_6_51_address_7@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)chain_item + 0x7)
+ (char *)&((uw_object_hdr_t *)chain_item)->link_word_high
|
- &*(char *)((byte *)chain_item + 0x7)
+ (char *)&((uw_object_hdr_t *)chain_item)->link_word_high
|
- &((char *)chain_item)[0x7]
+ (char *)&((uw_object_hdr_t *)chain_item)->link_word_high
)
...>
}


@receiver_15_w_6_51_store_7@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x7) = E;
+ ((uw_object_hdr_t *)chain_item)->link_word_high = (byte)E;
|
- *(char *)((byte *)chain_item + 0x7) = E;
+ ((uw_object_hdr_t *)chain_item)->link_word_high = (byte)E;
|
- ((char *)chain_item)[0x7] = E;
+ ((uw_object_hdr_t *)chain_item)->link_word_high = (byte)E;
)
...>
}


@receiver_15_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)chain_item + 0x7)
+ (char)((uw_object_hdr_t *)chain_item)->link_word_high
|
- *(char *)((byte *)chain_item + 0x7)
+ (char)((uw_object_hdr_t *)chain_item)->link_word_high
|
- ((char *)chain_item)[0x7]
+ (char)((uw_object_hdr_t *)chain_item)->link_word_high
)
...>
}


@receiver_16_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
|
- puVar1[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}


@receiver_16_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
|
- puVar1[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}


@receiver_16_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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


@receiver_16_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- (byte)puVar1[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_16_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- (undefined1)puVar1[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_16_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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


@receiver_16_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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


@receiver_16_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
|
- (char)puVar1[0x0]
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_16_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(ushort *)(puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- puVar1[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}


@receiver_16_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(undefined2 *)(puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- puVar1[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}


@receiver_16_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(short *)(puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
)
...>
}


@receiver_16_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(byte *)(puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- (byte)puVar1[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_16_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(undefined1 *)(puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- (undefined1)puVar1[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_16_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- &*(char *)(puVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_16_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(char *)(puVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_16_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(char *)(puVar1 + 0x1)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- (char)puVar1[0x1]
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_16_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(ushort *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- puVar1[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}


@receiver_16_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(undefined2 *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- puVar1[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}


@receiver_16_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(short *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
)
...>
}


@receiver_16_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(byte *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (byte)puVar1[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_16_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(undefined1 *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (undefined1)puVar1[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_16_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- &*(char *)(puVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_16_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(char *)(puVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_16_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(char *)(puVar1 + 0x2)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (char)puVar1[0x2]
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_16_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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

@receiver_16_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(ushort *)(puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- puVar1[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}


@receiver_16_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(undefined2 *)(puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- puVar1[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}


@receiver_16_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(short *)(puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
)
...>
}


@receiver_16_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(byte *)(puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- (byte)puVar1[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_16_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(undefined1 *)(puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- (undefined1)puVar1[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_16_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- &*(char *)(puVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_16_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(char *)(puVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_16_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- *(char *)(puVar1 + 0x3)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- (char)puVar1[0x3]
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_16_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}


@receiver_16_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
)
...>
}
