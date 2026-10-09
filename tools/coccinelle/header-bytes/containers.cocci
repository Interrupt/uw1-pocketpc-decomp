@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(release_container_reference\)$";
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


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((undefined2 *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)((byte *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &((char *)iVar1)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)((ushort *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)iVar1
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)(iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &iVar1[0x0]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*iVar1
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- iVar1[0x0] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *iVar1 = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- iVar1[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *iVar1
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &*(char *)((byte *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &((char *)iVar1)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &*(char *)(iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &iVar1[0x1]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- iVar1[0x1] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- iVar1[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((undefined2 *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
)
...>
}


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)((byte *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &((char *)iVar1)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)((ushort *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)(iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &iVar1[0x2]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- iVar1[0x2] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- iVar1[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &*(char *)((byte *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &((char *)iVar1)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &*(char *)(iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &iVar1[0x3]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- iVar1[0x3] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- iVar1[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((undefined2 *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
)
...>
}


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)((byte *)iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &((char *)iVar1)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)((ushort *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)(iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &iVar1[0x4]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- iVar1[0x4] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- iVar1[0x4]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &*(char *)((byte *)iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &((char *)iVar1)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &*(char *)(iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &iVar1[0x5]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- iVar1[0x5] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- iVar1[0x5]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((undefined2 *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
)
...>
}


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)((byte *)iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &((char *)iVar1)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)((ushort *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)(iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &iVar1[0x6]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- iVar1[0x6] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- iVar1[0x6]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &*(char *)((byte *)iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &((char *)iVar1)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &*(char *)(iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &iVar1[0x7]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- iVar1[0x7] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- iVar1[0x7]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pContents + 0x0) = (char)V;
- *(char *)((char *)pContents + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pContents + 0x0) = (char)V;
- *(byte *)((char *)pContents + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pContents + 0x0) = (byte)V;
- *(char *)((char *)pContents + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pContents + 0x0) = (byte)V;
- *(byte *)((char *)pContents + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- *(ushort *)((byte *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- ((ushort *)pContents)[0x0]
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- *(ushort *)((ushort *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- *(ushort *)(pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags
)
...>
}


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- *(undefined2 *)((byte *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- ((undefined2 *)pContents)[0x0]
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- *(undefined2 *)((undefined2 *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- *(undefined2 *)(pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_signed
|
- *(short *)((byte *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_signed
|
- ((short *)pContents)[0x0]
+ ((uw_object_hdr_t *)pContents)->type_flags_signed
|
- *(short *)((short *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_signed
|
- *(short *)(pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(byte *)((byte *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- ((byte *)pContents)[0x0]
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(byte *)((ushort *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- (byte)((ushort *)pContents)[0x0]
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(byte *)pContents
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(byte *)(pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(undefined1 *)((byte *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- ((undefined1 *)pContents)[0x0]
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(undefined1 *)((ushort *)pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- (undefined1)((ushort *)pContents)[0x0]
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(undefined1 *)pContents
+ ((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(undefined1 *)(pContents + 0x0)
+ ((uw_object_hdr_t *)pContents)->type_flags_low
)
...>
}


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pContents + 0x0)
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_low
|
- &*(char *)((byte *)pContents + 0x0)
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_low
|
- &((char *)pContents)[0x0]
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_low
|
- &*(char *)((ushort *)pContents + 0x0)
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_low
|
- &*(char *)pContents
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_low
|
- &*(char *)(pContents + 0x0)
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_low
|
- &pContents[0x0]
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_low
|
- &*pContents
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x0) = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pContents + 0x0) = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_low = (byte)E;
|
- ((char *)pContents)[0x0] = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pContents + 0x0) = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_low = (byte)E;
|
- *(char *)pContents = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_low = (byte)E;
|
- *(char *)(pContents + 0x0) = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_low = (byte)E;
|
- pContents[0x0] = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_low = (byte)E;
|
- *pContents = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x0)
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(char *)((byte *)pContents + 0x0)
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
|
- ((char *)pContents)[0x0]
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(char *)((ushort *)pContents + 0x0)
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
|
- (char)((ushort *)pContents)[0x0]
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(char *)pContents
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
|
- *(char *)(pContents + 0x0)
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
|
- pContents[0x0]
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
|
- *pContents
+ (char)((uw_object_hdr_t *)pContents)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->type_flags_high
|
- *(byte *)((byte *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->type_flags_high
|
- ((byte *)pContents)[0x1]
+ ((uw_object_hdr_t *)pContents)->type_flags_high
|
- *(byte *)(pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->type_flags_high
)
...>
}


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->type_flags_high
|
- *(undefined1 *)((byte *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->type_flags_high
|
- ((undefined1 *)pContents)[0x1]
+ ((uw_object_hdr_t *)pContents)->type_flags_high
|
- *(undefined1 *)(pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->type_flags_high
)
...>
}


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pContents + 0x1)
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_high
|
- &*(char *)((byte *)pContents + 0x1)
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_high
|
- &((char *)pContents)[0x1]
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_high
|
- &*(char *)(pContents + 0x1)
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_high
|
- &pContents[0x1]
+ (char *)&((uw_object_hdr_t *)pContents)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x1) = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pContents + 0x1) = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_high = (byte)E;
|
- ((char *)pContents)[0x1] = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_high = (byte)E;
|
- *(char *)(pContents + 0x1) = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_high = (byte)E;
|
- pContents[0x1] = E;
+ ((uw_object_hdr_t *)pContents)->type_flags_high = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x1)
+ (char)((uw_object_hdr_t *)pContents)->type_flags_high
|
- *(char *)((byte *)pContents + 0x1)
+ (char)((uw_object_hdr_t *)pContents)->type_flags_high
|
- ((char *)pContents)[0x1]
+ (char)((uw_object_hdr_t *)pContents)->type_flags_high
|
- *(char *)(pContents + 0x1)
+ (char)((uw_object_hdr_t *)pContents)->type_flags_high
|
- pContents[0x1]
+ (char)((uw_object_hdr_t *)pContents)->type_flags_high
)
...>
}


@receiver_2_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pContents + 0x2) = (char)V;
- *(char *)((char *)pContents + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pContents + 0x2) = (char)V;
- *(byte *)((char *)pContents + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pContents + 0x2) = (byte)V;
- *(char *)((char *)pContents + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pContents + 0x2) = (byte)V;
- *(byte *)((char *)pContents + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word
|
- *(ushort *)((byte *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word
|
- ((ushort *)pContents)[0x1]
+ ((uw_object_hdr_t *)pContents)->position_word
|
- *(ushort *)((ushort *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->position_word
|
- *(ushort *)(pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word
)
...>
}


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word
|
- *(undefined2 *)((byte *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word
|
- ((undefined2 *)pContents)[0x1]
+ ((uw_object_hdr_t *)pContents)->position_word
|
- *(undefined2 *)((undefined2 *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->position_word
|
- *(undefined2 *)(pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word
)
...>
}


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_signed
|
- *(short *)((byte *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_signed
|
- ((short *)pContents)[0x1]
+ ((uw_object_hdr_t *)pContents)->position_word_signed
|
- *(short *)((short *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->position_word_signed
|
- *(short *)(pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_signed
)
...>
}


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- *(byte *)((byte *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- ((byte *)pContents)[0x2]
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- *(byte *)((ushort *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- (byte)((ushort *)pContents)[0x1]
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- *(byte *)(pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- *(undefined1 *)((byte *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- ((undefined1 *)pContents)[0x2]
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- *(undefined1 *)((ushort *)pContents + 0x1)
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- (undefined1)((ushort *)pContents)[0x1]
+ ((uw_object_hdr_t *)pContents)->position_word_low
|
- *(undefined1 *)(pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->position_word_low
)
...>
}


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pContents + 0x2)
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_low
|
- &*(char *)((byte *)pContents + 0x2)
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_low
|
- &((char *)pContents)[0x2]
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_low
|
- &*(char *)((ushort *)pContents + 0x1)
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_low
|
- &*(char *)(pContents + 0x2)
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_low
|
- &pContents[0x2]
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_low
)
...>
}


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x2) = E;
+ ((uw_object_hdr_t *)pContents)->position_word_low = (byte)E;
|
- *(char *)((byte *)pContents + 0x2) = E;
+ ((uw_object_hdr_t *)pContents)->position_word_low = (byte)E;
|
- ((char *)pContents)[0x2] = E;
+ ((uw_object_hdr_t *)pContents)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pContents + 0x1) = E;
+ ((uw_object_hdr_t *)pContents)->position_word_low = (byte)E;
|
- *(char *)(pContents + 0x2) = E;
+ ((uw_object_hdr_t *)pContents)->position_word_low = (byte)E;
|
- pContents[0x2] = E;
+ ((uw_object_hdr_t *)pContents)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x2)
+ (char)((uw_object_hdr_t *)pContents)->position_word_low
|
- *(char *)((byte *)pContents + 0x2)
+ (char)((uw_object_hdr_t *)pContents)->position_word_low
|
- ((char *)pContents)[0x2]
+ (char)((uw_object_hdr_t *)pContents)->position_word_low
|
- *(char *)((ushort *)pContents + 0x1)
+ (char)((uw_object_hdr_t *)pContents)->position_word_low
|
- (char)((ushort *)pContents)[0x1]
+ (char)((uw_object_hdr_t *)pContents)->position_word_low
|
- *(char *)(pContents + 0x2)
+ (char)((uw_object_hdr_t *)pContents)->position_word_low
|
- pContents[0x2]
+ (char)((uw_object_hdr_t *)pContents)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->position_word_high
|
- *(byte *)((byte *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->position_word_high
|
- ((byte *)pContents)[0x3]
+ ((uw_object_hdr_t *)pContents)->position_word_high
|
- *(byte *)(pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->position_word_high
)
...>
}


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->position_word_high
|
- *(undefined1 *)((byte *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->position_word_high
|
- ((undefined1 *)pContents)[0x3]
+ ((uw_object_hdr_t *)pContents)->position_word_high
|
- *(undefined1 *)(pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->position_word_high
)
...>
}


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pContents + 0x3)
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_high
|
- &*(char *)((byte *)pContents + 0x3)
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_high
|
- &((char *)pContents)[0x3]
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_high
|
- &*(char *)(pContents + 0x3)
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_high
|
- &pContents[0x3]
+ (char *)&((uw_object_hdr_t *)pContents)->position_word_high
)
...>
}


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x3) = E;
+ ((uw_object_hdr_t *)pContents)->position_word_high = (byte)E;
|
- *(char *)((byte *)pContents + 0x3) = E;
+ ((uw_object_hdr_t *)pContents)->position_word_high = (byte)E;
|
- ((char *)pContents)[0x3] = E;
+ ((uw_object_hdr_t *)pContents)->position_word_high = (byte)E;
|
- *(char *)(pContents + 0x3) = E;
+ ((uw_object_hdr_t *)pContents)->position_word_high = (byte)E;
|
- pContents[0x3] = E;
+ ((uw_object_hdr_t *)pContents)->position_word_high = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x3)
+ (char)((uw_object_hdr_t *)pContents)->position_word_high
|
- *(char *)((byte *)pContents + 0x3)
+ (char)((uw_object_hdr_t *)pContents)->position_word_high
|
- ((char *)pContents)[0x3]
+ (char)((uw_object_hdr_t *)pContents)->position_word_high
|
- *(char *)(pContents + 0x3)
+ (char)((uw_object_hdr_t *)pContents)->position_word_high
|
- pContents[0x3]
+ (char)((uw_object_hdr_t *)pContents)->position_word_high
)
...>
}


@receiver_2_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pContents + 0x4) = (char)V;
- *(char *)((char *)pContents + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pContents + 0x4) = (char)V;
- *(byte *)((char *)pContents + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pContents + 0x4) = (byte)V;
- *(char *)((char *)pContents + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pContents + 0x4) = (byte)V;
- *(byte *)((char *)pContents + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- *(ushort *)((byte *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- ((ushort *)pContents)[0x2]
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- *(ushort *)((ushort *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- *(ushort *)(pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word
)
...>
}


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- *(undefined2 *)((byte *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- ((undefined2 *)pContents)[0x2]
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- *(undefined2 *)((undefined2 *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- *(undefined2 *)(pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word
)
...>
}


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_signed
|
- *(short *)((byte *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_signed
|
- ((short *)pContents)[0x2]
+ ((uw_object_hdr_t *)pContents)->chain_word_signed
|
- *(short *)((short *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->chain_word_signed
|
- *(short *)(pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_signed
)
...>
}


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(byte *)((byte *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- ((byte *)pContents)[0x4]
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(byte *)((ushort *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- (byte)((ushort *)pContents)[0x2]
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(byte *)(pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(undefined1 *)((byte *)pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- ((undefined1 *)pContents)[0x4]
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(undefined1 *)((ushort *)pContents + 0x2)
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- (undefined1)((ushort *)pContents)[0x2]
+ ((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(undefined1 *)(pContents + 0x4)
+ ((uw_object_hdr_t *)pContents)->chain_word_low
)
...>
}


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pContents + 0x4)
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_low
|
- &*(char *)((byte *)pContents + 0x4)
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_low
|
- &((char *)pContents)[0x4]
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_low
|
- &*(char *)((ushort *)pContents + 0x2)
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_low
|
- &*(char *)(pContents + 0x4)
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_low
|
- &pContents[0x4]
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_low
)
...>
}


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x4) = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pContents + 0x4) = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_low = (byte)E;
|
- ((char *)pContents)[0x4] = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pContents + 0x2) = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_low = (byte)E;
|
- *(char *)(pContents + 0x4) = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_low = (byte)E;
|
- pContents[0x4] = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x4)
+ (char)((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(char *)((byte *)pContents + 0x4)
+ (char)((uw_object_hdr_t *)pContents)->chain_word_low
|
- ((char *)pContents)[0x4]
+ (char)((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(char *)((ushort *)pContents + 0x2)
+ (char)((uw_object_hdr_t *)pContents)->chain_word_low
|
- (char)((ushort *)pContents)[0x2]
+ (char)((uw_object_hdr_t *)pContents)->chain_word_low
|
- *(char *)(pContents + 0x4)
+ (char)((uw_object_hdr_t *)pContents)->chain_word_low
|
- pContents[0x4]
+ (char)((uw_object_hdr_t *)pContents)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pContents + 0x5)
+ ((uw_object_hdr_t *)pContents)->chain_word_high
|
- *(byte *)((byte *)pContents + 0x5)
+ ((uw_object_hdr_t *)pContents)->chain_word_high
|
- ((byte *)pContents)[0x5]
+ ((uw_object_hdr_t *)pContents)->chain_word_high
|
- *(byte *)(pContents + 0x5)
+ ((uw_object_hdr_t *)pContents)->chain_word_high
)
...>
}


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pContents + 0x5)
+ ((uw_object_hdr_t *)pContents)->chain_word_high
|
- *(undefined1 *)((byte *)pContents + 0x5)
+ ((uw_object_hdr_t *)pContents)->chain_word_high
|
- ((undefined1 *)pContents)[0x5]
+ ((uw_object_hdr_t *)pContents)->chain_word_high
|
- *(undefined1 *)(pContents + 0x5)
+ ((uw_object_hdr_t *)pContents)->chain_word_high
)
...>
}


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pContents + 0x5)
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_high
|
- &*(char *)((byte *)pContents + 0x5)
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_high
|
- &((char *)pContents)[0x5]
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_high
|
- &*(char *)(pContents + 0x5)
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_high
|
- &pContents[0x5]
+ (char *)&((uw_object_hdr_t *)pContents)->chain_word_high
)
...>
}


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x5) = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pContents + 0x5) = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_high = (byte)E;
|
- ((char *)pContents)[0x5] = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_high = (byte)E;
|
- *(char *)(pContents + 0x5) = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_high = (byte)E;
|
- pContents[0x5] = E;
+ ((uw_object_hdr_t *)pContents)->chain_word_high = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x5)
+ (char)((uw_object_hdr_t *)pContents)->chain_word_high
|
- *(char *)((byte *)pContents + 0x5)
+ (char)((uw_object_hdr_t *)pContents)->chain_word_high
|
- ((char *)pContents)[0x5]
+ (char)((uw_object_hdr_t *)pContents)->chain_word_high
|
- *(char *)(pContents + 0x5)
+ (char)((uw_object_hdr_t *)pContents)->chain_word_high
|
- pContents[0x5]
+ (char)((uw_object_hdr_t *)pContents)->chain_word_high
)
...>
}


@receiver_2_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pContents + 0x6) = (char)V;
- *(char *)((char *)pContents + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pContents + 0x6) = (char)V;
- *(byte *)((char *)pContents + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pContents + 0x6) = (byte)V;
- *(char *)((char *)pContents + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pContents + 0x6) = (byte)V;
- *(byte *)((char *)pContents + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pContents)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word
|
- *(ushort *)((byte *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word
|
- ((ushort *)pContents)[0x3]
+ ((uw_object_hdr_t *)pContents)->link_word
|
- *(ushort *)((ushort *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->link_word
|
- *(ushort *)(pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word
)
...>
}


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word
|
- *(undefined2 *)((byte *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word
|
- ((undefined2 *)pContents)[0x3]
+ ((uw_object_hdr_t *)pContents)->link_word
|
- *(undefined2 *)((undefined2 *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->link_word
|
- *(undefined2 *)(pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word
)
...>
}


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_signed
|
- *(short *)((byte *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_signed
|
- ((short *)pContents)[0x3]
+ ((uw_object_hdr_t *)pContents)->link_word_signed
|
- *(short *)((short *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->link_word_signed
|
- *(short *)(pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_signed
)
...>
}


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- *(byte *)((byte *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- ((byte *)pContents)[0x6]
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- *(byte *)((ushort *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- (byte)((ushort *)pContents)[0x3]
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- *(byte *)(pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- *(undefined1 *)((byte *)pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- ((undefined1 *)pContents)[0x6]
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- *(undefined1 *)((ushort *)pContents + 0x3)
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- (undefined1)((ushort *)pContents)[0x3]
+ ((uw_object_hdr_t *)pContents)->link_word_low
|
- *(undefined1 *)(pContents + 0x6)
+ ((uw_object_hdr_t *)pContents)->link_word_low
)
...>
}


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pContents + 0x6)
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_low
|
- &*(char *)((byte *)pContents + 0x6)
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_low
|
- &((char *)pContents)[0x6]
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_low
|
- &*(char *)((ushort *)pContents + 0x3)
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_low
|
- &*(char *)(pContents + 0x6)
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_low
|
- &pContents[0x6]
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_low
)
...>
}


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x6) = E;
+ ((uw_object_hdr_t *)pContents)->link_word_low = (byte)E;
|
- *(char *)((byte *)pContents + 0x6) = E;
+ ((uw_object_hdr_t *)pContents)->link_word_low = (byte)E;
|
- ((char *)pContents)[0x6] = E;
+ ((uw_object_hdr_t *)pContents)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pContents + 0x3) = E;
+ ((uw_object_hdr_t *)pContents)->link_word_low = (byte)E;
|
- *(char *)(pContents + 0x6) = E;
+ ((uw_object_hdr_t *)pContents)->link_word_low = (byte)E;
|
- pContents[0x6] = E;
+ ((uw_object_hdr_t *)pContents)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x6)
+ (char)((uw_object_hdr_t *)pContents)->link_word_low
|
- *(char *)((byte *)pContents + 0x6)
+ (char)((uw_object_hdr_t *)pContents)->link_word_low
|
- ((char *)pContents)[0x6]
+ (char)((uw_object_hdr_t *)pContents)->link_word_low
|
- *(char *)((ushort *)pContents + 0x3)
+ (char)((uw_object_hdr_t *)pContents)->link_word_low
|
- (char)((ushort *)pContents)[0x3]
+ (char)((uw_object_hdr_t *)pContents)->link_word_low
|
- *(char *)(pContents + 0x6)
+ (char)((uw_object_hdr_t *)pContents)->link_word_low
|
- pContents[0x6]
+ (char)((uw_object_hdr_t *)pContents)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pContents + 0x7)
+ ((uw_object_hdr_t *)pContents)->link_word_high
|
- *(byte *)((byte *)pContents + 0x7)
+ ((uw_object_hdr_t *)pContents)->link_word_high
|
- ((byte *)pContents)[0x7]
+ ((uw_object_hdr_t *)pContents)->link_word_high
|
- *(byte *)(pContents + 0x7)
+ ((uw_object_hdr_t *)pContents)->link_word_high
)
...>
}


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pContents + 0x7)
+ ((uw_object_hdr_t *)pContents)->link_word_high
|
- *(undefined1 *)((byte *)pContents + 0x7)
+ ((uw_object_hdr_t *)pContents)->link_word_high
|
- ((undefined1 *)pContents)[0x7]
+ ((uw_object_hdr_t *)pContents)->link_word_high
|
- *(undefined1 *)(pContents + 0x7)
+ ((uw_object_hdr_t *)pContents)->link_word_high
)
...>
}


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pContents + 0x7)
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_high
|
- &*(char *)((byte *)pContents + 0x7)
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_high
|
- &((char *)pContents)[0x7]
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_high
|
- &*(char *)(pContents + 0x7)
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_high
|
- &pContents[0x7]
+ (char *)&((uw_object_hdr_t *)pContents)->link_word_high
)
...>
}


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x7) = E;
+ ((uw_object_hdr_t *)pContents)->link_word_high = (byte)E;
|
- *(char *)((byte *)pContents + 0x7) = E;
+ ((uw_object_hdr_t *)pContents)->link_word_high = (byte)E;
|
- ((char *)pContents)[0x7] = E;
+ ((uw_object_hdr_t *)pContents)->link_word_high = (byte)E;
|
- *(char *)(pContents + 0x7) = E;
+ ((uw_object_hdr_t *)pContents)->link_word_high = (byte)E;
|
- pContents[0x7] = E;
+ ((uw_object_hdr_t *)pContents)->link_word_high = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pContents + 0x7)
+ (char)((uw_object_hdr_t *)pContents)->link_word_high
|
- *(char *)((byte *)pContents + 0x7)
+ (char)((uw_object_hdr_t *)pContents)->link_word_high
|
- ((char *)pContents)[0x7]
+ (char)((uw_object_hdr_t *)pContents)->link_word_high
|
- *(char *)(pContents + 0x7)
+ (char)((uw_object_hdr_t *)pContents)->link_word_high
|
- pContents[0x7]
+ (char)((uw_object_hdr_t *)pContents)->link_word_high
)
...>
}


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_pMatch + 0x0) = (char)V;
- *(char *)((char *)_pMatch + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_pMatch + 0x0) = (char)V;
- *(byte *)((char *)_pMatch + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_pMatch + 0x0) = (byte)V;
- *(char *)((char *)_pMatch + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_pMatch + 0x0) = (byte)V;
- *(byte *)((char *)_pMatch + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- *(ushort *)((byte *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- ((ushort *)_pMatch)[0x0]
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- *(ushort *)((ushort *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- *(ushort *)(_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
)
...>
}


@receiver_3_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- *(undefined2 *)((byte *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- ((undefined2 *)_pMatch)[0x0]
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- *(undefined2 *)((undefined2 *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- *(undefined2 *)(_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_signed
|
- *(short *)((byte *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_signed
|
- ((short *)_pMatch)[0x0]
+ ((uw_object_hdr_t *)_pMatch)->type_flags_signed
|
- *(short *)((short *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_signed
|
- *(short *)(_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(byte *)((byte *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- ((byte *)_pMatch)[0x0]
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(byte *)((ushort *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- (byte)((ushort *)_pMatch)[0x0]
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(byte *)_pMatch
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(byte *)(_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(undefined1 *)((byte *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- ((undefined1 *)_pMatch)[0x0]
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(undefined1 *)((ushort *)_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- (undefined1)((ushort *)_pMatch)[0x0]
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(undefined1 *)_pMatch
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(undefined1 *)(_pMatch + 0x0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low
)
...>
}


@receiver_3_w_0_0_address_0@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_pMatch + 0x0)
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- &*(char *)((byte *)_pMatch + 0x0)
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- &((char *)_pMatch)[0x0]
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- &*(char *)((ushort *)_pMatch + 0x0)
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- &*(char *)_pMatch
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- &*(char *)(_pMatch + 0x0)
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- &_pMatch[0x0]
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- &*_pMatch
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x0) = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low = (byte)E;
|
- *(char *)((byte *)_pMatch + 0x0) = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low = (byte)E;
|
- ((char *)_pMatch)[0x0] = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)_pMatch + 0x0) = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low = (byte)E;
|
- *(char *)_pMatch = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low = (byte)E;
|
- *(char *)(_pMatch + 0x0) = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low = (byte)E;
|
- _pMatch[0x0] = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low = (byte)E;
|
- *_pMatch = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x0)
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(char *)((byte *)_pMatch + 0x0)
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- ((char *)_pMatch)[0x0]
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(char *)((ushort *)_pMatch + 0x0)
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- (char)((ushort *)_pMatch)[0x0]
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(char *)_pMatch
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *(char *)(_pMatch + 0x0)
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- _pMatch[0x0]
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
|
- *_pMatch
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- *(byte *)((byte *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- ((byte *)_pMatch)[0x1]
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- *(byte *)(_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- *(undefined1 *)((byte *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- ((undefined1 *)_pMatch)[0x1]
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- *(undefined1 *)(_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high
)
...>
}


@receiver_3_w_0_0_address_1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_pMatch + 0x1)
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- &*(char *)((byte *)_pMatch + 0x1)
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- &((char *)_pMatch)[0x1]
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- &*(char *)(_pMatch + 0x1)
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- &_pMatch[0x1]
+ (char *)&((uw_object_hdr_t *)_pMatch)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x1) = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high = (byte)E;
|
- *(char *)((byte *)_pMatch + 0x1) = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high = (byte)E;
|
- ((char *)_pMatch)[0x1] = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high = (byte)E;
|
- *(char *)(_pMatch + 0x1) = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high = (byte)E;
|
- _pMatch[0x1] = E;
+ ((uw_object_hdr_t *)_pMatch)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x1)
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- *(char *)((byte *)_pMatch + 0x1)
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- ((char *)_pMatch)[0x1]
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- *(char *)(_pMatch + 0x1)
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_high
|
- _pMatch[0x1]
+ (char)((uw_object_hdr_t *)_pMatch)->type_flags_high
)
...>
}


@receiver_3_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_pMatch + 0x2) = (char)V;
- *(char *)((char *)_pMatch + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_pMatch + 0x2) = (char)V;
- *(byte *)((char *)_pMatch + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_pMatch + 0x2) = (byte)V;
- *(char *)((char *)_pMatch + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_pMatch + 0x2) = (byte)V;
- *(byte *)((char *)_pMatch + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_word_ushort@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- *(ushort *)((byte *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- ((ushort *)_pMatch)[0x1]
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- *(ushort *)((ushort *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- *(ushort *)(_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word
)
...>
}


@receiver_3_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- *(undefined2 *)((byte *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- ((undefined2 *)_pMatch)[0x1]
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- *(undefined2 *)((undefined2 *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- *(undefined2 *)(_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word
)
...>
}


@receiver_3_w_2_17_word_short@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_signed
|
- *(short *)((byte *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_signed
|
- ((short *)_pMatch)[0x1]
+ ((uw_object_hdr_t *)_pMatch)->position_word_signed
|
- *(short *)((short *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->position_word_signed
|
- *(short *)(_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_signed
)
...>
}


@receiver_3_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(byte *)((byte *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- ((byte *)_pMatch)[0x2]
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(byte *)((ushort *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- (byte)((ushort *)_pMatch)[0x1]
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(byte *)(_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(undefined1 *)((byte *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- ((undefined1 *)_pMatch)[0x2]
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(undefined1 *)((ushort *)_pMatch + 0x1)
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- (undefined1)((ushort *)_pMatch)[0x1]
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(undefined1 *)(_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->position_word_low
)
...>
}


@receiver_3_w_2_17_address_2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_pMatch + 0x2)
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_low
|
- &*(char *)((byte *)_pMatch + 0x2)
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_low
|
- &((char *)_pMatch)[0x2]
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_low
|
- &*(char *)((ushort *)_pMatch + 0x1)
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_low
|
- &*(char *)(_pMatch + 0x2)
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_low
|
- &_pMatch[0x2]
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_low
)
...>
}


@receiver_3_w_2_17_store_2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x2) = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_low = (byte)E;
|
- *(char *)((byte *)_pMatch + 0x2) = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_low = (byte)E;
|
- ((char *)_pMatch)[0x2] = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_low = (byte)E;
|
- *(char *)((ushort *)_pMatch + 0x1) = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_low = (byte)E;
|
- *(char *)(_pMatch + 0x2) = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_low = (byte)E;
|
- _pMatch[0x2] = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x2)
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(char *)((byte *)_pMatch + 0x2)
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_low
|
- ((char *)_pMatch)[0x2]
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(char *)((ushort *)_pMatch + 0x1)
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_low
|
- (char)((ushort *)_pMatch)[0x1]
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_low
|
- *(char *)(_pMatch + 0x2)
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_low
|
- _pMatch[0x2]
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->position_word_high
|
- *(byte *)((byte *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->position_word_high
|
- ((byte *)_pMatch)[0x3]
+ ((uw_object_hdr_t *)_pMatch)->position_word_high
|
- *(byte *)(_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->position_word_high
)
...>
}


@receiver_3_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->position_word_high
|
- *(undefined1 *)((byte *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->position_word_high
|
- ((undefined1 *)_pMatch)[0x3]
+ ((uw_object_hdr_t *)_pMatch)->position_word_high
|
- *(undefined1 *)(_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->position_word_high
)
...>
}


@receiver_3_w_2_17_address_3@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_pMatch + 0x3)
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_high
|
- &*(char *)((byte *)_pMatch + 0x3)
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_high
|
- &((char *)_pMatch)[0x3]
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_high
|
- &*(char *)(_pMatch + 0x3)
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_high
|
- &_pMatch[0x3]
+ (char *)&((uw_object_hdr_t *)_pMatch)->position_word_high
)
...>
}


@receiver_3_w_2_17_store_3@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x3) = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_high = (byte)E;
|
- *(char *)((byte *)_pMatch + 0x3) = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_high = (byte)E;
|
- ((char *)_pMatch)[0x3] = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_high = (byte)E;
|
- *(char *)(_pMatch + 0x3) = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_high = (byte)E;
|
- _pMatch[0x3] = E;
+ ((uw_object_hdr_t *)_pMatch)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x3)
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_high
|
- *(char *)((byte *)_pMatch + 0x3)
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_high
|
- ((char *)_pMatch)[0x3]
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_high
|
- *(char *)(_pMatch + 0x3)
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_high
|
- _pMatch[0x3]
+ (char)((uw_object_hdr_t *)_pMatch)->position_word_high
)
...>
}


@receiver_3_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_pMatch + 0x4) = (char)V;
- *(char *)((char *)_pMatch + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_pMatch + 0x4) = (char)V;
- *(byte *)((char *)_pMatch + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_pMatch + 0x4) = (byte)V;
- *(char *)((char *)_pMatch + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_pMatch + 0x4) = (byte)V;
- *(byte *)((char *)_pMatch + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_word_ushort@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- *(ushort *)((byte *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- ((ushort *)_pMatch)[0x2]
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- *(ushort *)((ushort *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- *(ushort *)(_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
)
...>
}


@receiver_3_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- *(undefined2 *)((byte *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- ((undefined2 *)_pMatch)[0x2]
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- *(undefined2 *)((undefined2 *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- *(undefined2 *)(_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
)
...>
}


@receiver_3_w_4_34_word_short@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_signed
|
- *(short *)((byte *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_signed
|
- ((short *)_pMatch)[0x2]
+ ((uw_object_hdr_t *)_pMatch)->chain_word_signed
|
- *(short *)((short *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_signed
|
- *(short *)(_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_signed
)
...>
}


@receiver_3_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(byte *)((byte *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- ((byte *)_pMatch)[0x4]
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(byte *)((ushort *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- (byte)((ushort *)_pMatch)[0x2]
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(byte *)(_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(undefined1 *)((byte *)_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- ((undefined1 *)_pMatch)[0x4]
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(undefined1 *)((ushort *)_pMatch + 0x2)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- (undefined1)((ushort *)_pMatch)[0x2]
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(undefined1 *)(_pMatch + 0x4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low
)
...>
}


@receiver_3_w_4_34_address_4@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_pMatch + 0x4)
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- &*(char *)((byte *)_pMatch + 0x4)
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- &((char *)_pMatch)[0x4]
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- &*(char *)((ushort *)_pMatch + 0x2)
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- &*(char *)(_pMatch + 0x4)
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- &_pMatch[0x4]
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_low
)
...>
}


@receiver_3_w_4_34_store_4@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x4) = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low = (byte)E;
|
- *(char *)((byte *)_pMatch + 0x4) = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low = (byte)E;
|
- ((char *)_pMatch)[0x4] = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)_pMatch + 0x2) = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low = (byte)E;
|
- *(char *)(_pMatch + 0x4) = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low = (byte)E;
|
- _pMatch[0x4] = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x4)
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(char *)((byte *)_pMatch + 0x4)
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- ((char *)_pMatch)[0x4]
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(char *)((ushort *)_pMatch + 0x2)
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- (char)((ushort *)_pMatch)[0x2]
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- *(char *)(_pMatch + 0x4)
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_low
|
- _pMatch[0x4]
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_pMatch + 0x5)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- *(byte *)((byte *)_pMatch + 0x5)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- ((byte *)_pMatch)[0x5]
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- *(byte *)(_pMatch + 0x5)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high
)
...>
}


@receiver_3_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_pMatch + 0x5)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- *(undefined1 *)((byte *)_pMatch + 0x5)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- ((undefined1 *)_pMatch)[0x5]
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- *(undefined1 *)(_pMatch + 0x5)
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high
)
...>
}


@receiver_3_w_4_34_address_5@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_pMatch + 0x5)
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- &*(char *)((byte *)_pMatch + 0x5)
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- &((char *)_pMatch)[0x5]
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- &*(char *)(_pMatch + 0x5)
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- &_pMatch[0x5]
+ (char *)&((uw_object_hdr_t *)_pMatch)->chain_word_high
)
...>
}


@receiver_3_w_4_34_store_5@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x5) = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high = (byte)E;
|
- *(char *)((byte *)_pMatch + 0x5) = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high = (byte)E;
|
- ((char *)_pMatch)[0x5] = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high = (byte)E;
|
- *(char *)(_pMatch + 0x5) = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high = (byte)E;
|
- _pMatch[0x5] = E;
+ ((uw_object_hdr_t *)_pMatch)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x5)
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- *(char *)((byte *)_pMatch + 0x5)
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- ((char *)_pMatch)[0x5]
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- *(char *)(_pMatch + 0x5)
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_high
|
- _pMatch[0x5]
+ (char)((uw_object_hdr_t *)_pMatch)->chain_word_high
)
...>
}


@receiver_3_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_pMatch + 0x6) = (char)V;
- *(char *)((char *)_pMatch + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_pMatch + 0x6) = (char)V;
- *(byte *)((char *)_pMatch + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_pMatch + 0x6) = (byte)V;
- *(char *)((char *)_pMatch + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_pMatch + 0x6) = (byte)V;
- *(byte *)((char *)_pMatch + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_pMatch)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_word_ushort@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- *(ushort *)((byte *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- ((ushort *)_pMatch)[0x3]
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- *(ushort *)((ushort *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- *(ushort *)(_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word
)
...>
}


@receiver_3_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- *(undefined2 *)((byte *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- ((undefined2 *)_pMatch)[0x3]
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- *(undefined2 *)((undefined2 *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- *(undefined2 *)(_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word
)
...>
}


@receiver_3_w_6_51_word_short@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_signed
|
- *(short *)((byte *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_signed
|
- ((short *)_pMatch)[0x3]
+ ((uw_object_hdr_t *)_pMatch)->link_word_signed
|
- *(short *)((short *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->link_word_signed
|
- *(short *)(_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_signed
)
...>
}


@receiver_3_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(byte *)((byte *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- ((byte *)_pMatch)[0x6]
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(byte *)((ushort *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- (byte)((ushort *)_pMatch)[0x3]
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(byte *)(_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(undefined1 *)((byte *)_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- ((undefined1 *)_pMatch)[0x6]
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(undefined1 *)((ushort *)_pMatch + 0x3)
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- (undefined1)((ushort *)_pMatch)[0x3]
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(undefined1 *)(_pMatch + 0x6)
+ ((uw_object_hdr_t *)_pMatch)->link_word_low
)
...>
}


@receiver_3_w_6_51_address_6@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_pMatch + 0x6)
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_low
|
- &*(char *)((byte *)_pMatch + 0x6)
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_low
|
- &((char *)_pMatch)[0x6]
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_low
|
- &*(char *)((ushort *)_pMatch + 0x3)
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_low
|
- &*(char *)(_pMatch + 0x6)
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_low
|
- &_pMatch[0x6]
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_low
)
...>
}


@receiver_3_w_6_51_store_6@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x6) = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_low = (byte)E;
|
- *(char *)((byte *)_pMatch + 0x6) = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_low = (byte)E;
|
- ((char *)_pMatch)[0x6] = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_low = (byte)E;
|
- *(char *)((ushort *)_pMatch + 0x3) = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_low = (byte)E;
|
- *(char *)(_pMatch + 0x6) = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_low = (byte)E;
|
- _pMatch[0x6] = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x6)
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(char *)((byte *)_pMatch + 0x6)
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_low
|
- ((char *)_pMatch)[0x6]
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(char *)((ushort *)_pMatch + 0x3)
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_low
|
- (char)((ushort *)_pMatch)[0x3]
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_low
|
- *(char *)(_pMatch + 0x6)
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_low
|
- _pMatch[0x6]
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_pMatch + 0x7)
+ ((uw_object_hdr_t *)_pMatch)->link_word_high
|
- *(byte *)((byte *)_pMatch + 0x7)
+ ((uw_object_hdr_t *)_pMatch)->link_word_high
|
- ((byte *)_pMatch)[0x7]
+ ((uw_object_hdr_t *)_pMatch)->link_word_high
|
- *(byte *)(_pMatch + 0x7)
+ ((uw_object_hdr_t *)_pMatch)->link_word_high
)
...>
}


@receiver_3_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_pMatch + 0x7)
+ ((uw_object_hdr_t *)_pMatch)->link_word_high
|
- *(undefined1 *)((byte *)_pMatch + 0x7)
+ ((uw_object_hdr_t *)_pMatch)->link_word_high
|
- ((undefined1 *)_pMatch)[0x7]
+ ((uw_object_hdr_t *)_pMatch)->link_word_high
|
- *(undefined1 *)(_pMatch + 0x7)
+ ((uw_object_hdr_t *)_pMatch)->link_word_high
)
...>
}


@receiver_3_w_6_51_address_7@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_pMatch + 0x7)
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_high
|
- &*(char *)((byte *)_pMatch + 0x7)
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_high
|
- &((char *)_pMatch)[0x7]
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_high
|
- &*(char *)(_pMatch + 0x7)
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_high
|
- &_pMatch[0x7]
+ (char *)&((uw_object_hdr_t *)_pMatch)->link_word_high
)
...>
}


@receiver_3_w_6_51_store_7@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x7) = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_high = (byte)E;
|
- *(char *)((byte *)_pMatch + 0x7) = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_high = (byte)E;
|
- ((char *)_pMatch)[0x7] = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_high = (byte)E;
|
- *(char *)(_pMatch + 0x7) = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_high = (byte)E;
|
- _pMatch[0x7] = E;
+ ((uw_object_hdr_t *)_pMatch)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_pMatch + 0x7)
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_high
|
- *(char *)((byte *)_pMatch + 0x7)
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_high
|
- ((char *)_pMatch)[0x7]
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_high
|
- *(char *)(_pMatch + 0x7)
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_high
|
- _pMatch[0x7]
+ (char)((uw_object_hdr_t *)_pMatch)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_address_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_address_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_2_17_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_address_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_store_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_address_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_store_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_4_34_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_address_4@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_store_4@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_address_5@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_store_5@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@receiver_4_w_6_51_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_address_6@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_store_6@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_address_7@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_store_7@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_4_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar15 + 0x0) = (char)V;
- *(char *)((char *)puVar15 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar15 + 0x0) = (char)V;
- *(byte *)((char *)puVar15 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar15 + 0x0) = (byte)V;
- *(char *)((char *)puVar15 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar15 + 0x0) = (byte)V;
- *(byte *)((char *)puVar15 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *(ushort *)((byte *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- ((ushort *)puVar15)[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *(ushort *)((ushort *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *(ushort *)(puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- puVar15[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *puVar15
+ ((uw_object_hdr_t *)puVar15)->type_flags
)
...>
}


@receiver_5_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *(undefined2 *)((byte *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- ((undefined2 *)puVar15)[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *(undefined2 *)(puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- puVar15[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *puVar15
+ ((uw_object_hdr_t *)puVar15)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_signed
|
- *(short *)((byte *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_signed
|
- ((short *)puVar15)[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags_signed
|
- *(short *)((short *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_signed
|
- *(short *)(puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(byte *)((byte *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- ((byte *)puVar15)[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(byte *)((ushort *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- (byte)((ushort *)puVar15)[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(byte *)puVar15
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(byte *)(puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- (byte)puVar15[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(undefined1 *)((byte *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- ((undefined1 *)puVar15)[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- (undefined1)((ushort *)puVar15)[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(undefined1 *)puVar15
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(undefined1 *)(puVar15 + 0x0)
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
|
- (undefined1)puVar15[0x0]
+ ((uw_object_hdr_t *)puVar15)->type_flags_low
)
...>
}


@receiver_5_w_0_0_address_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar15 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_low
|
- &*(char *)((byte *)puVar15 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_low
|
- &((char *)puVar15)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_low
|
- &*(char *)((ushort *)puVar15 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_low
|
- &*(char *)puVar15
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_low
|
- &*(char *)(puVar15 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar15 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_low = (byte)E;
|
- ((char *)puVar15)[0x0] = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar15 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_low = (byte)E;
|
- *(char *)puVar15 = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_low = (byte)E;
|
- *(char *)(puVar15 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x0)
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(char *)((byte *)puVar15 + 0x0)
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_low
|
- ((char *)puVar15)[0x0]
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(char *)((ushort *)puVar15 + 0x0)
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_low
|
- (char)((ushort *)puVar15)[0x0]
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(char *)puVar15
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_low
|
- *(char *)(puVar15 + 0x0)
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_low
|
- (char)puVar15[0x0]
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->type_flags_high
|
- *(byte *)((byte *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->type_flags_high
|
- ((byte *)puVar15)[0x1]
+ ((uw_object_hdr_t *)puVar15)->type_flags_high
)
...>
}


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->type_flags_high
|
- *(undefined1 *)((byte *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->type_flags_high
|
- ((undefined1 *)puVar15)[0x1]
+ ((uw_object_hdr_t *)puVar15)->type_flags_high
)
...>
}


@receiver_5_w_0_0_address_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar15 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_high
|
- &*(char *)((byte *)puVar15 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_high
|
- &((char *)puVar15)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar15)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar15 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_high = (byte)E;
|
- ((char *)puVar15)[0x1] = E;
+ ((uw_object_hdr_t *)puVar15)->type_flags_high = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x1)
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_high
|
- *(char *)((byte *)puVar15 + 0x1)
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_high
|
- ((char *)puVar15)[0x1]
+ (char)((uw_object_hdr_t *)puVar15)->type_flags_high
)
...>
}


@receiver_5_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar15 + 0x2) = (char)V;
- *(char *)((char *)puVar15 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar15 + 0x2) = (char)V;
- *(byte *)((char *)puVar15 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar15 + 0x2) = (byte)V;
- *(char *)((char *)puVar15 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar15 + 0x2) = (byte)V;
- *(byte *)((char *)puVar15 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- *(ushort *)((byte *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- ((ushort *)puVar15)[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- *(ushort *)((ushort *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- *(ushort *)(puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- puVar15[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word
)
...>
}


@receiver_5_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- *(undefined2 *)((byte *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- ((undefined2 *)puVar15)[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- *(undefined2 *)((undefined2 *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- *(undefined2 *)(puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- puVar15[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word
)
...>
}


@receiver_5_w_2_17_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word_signed
|
- *(short *)((byte *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word_signed
|
- ((short *)puVar15)[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word_signed
|
- *(short *)((short *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word_signed
|
- *(short *)(puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word_signed
)
...>
}


@receiver_5_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(byte *)((byte *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- ((byte *)puVar15)[0x2]
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(byte *)((ushort *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- (byte)((ushort *)puVar15)[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(byte *)(puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- (byte)puVar15[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(undefined1 *)((byte *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- ((undefined1 *)puVar15)[0x2]
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(undefined1 *)((ushort *)puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- (undefined1)((ushort *)puVar15)[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(undefined1 *)(puVar15 + 0x1)
+ ((uw_object_hdr_t *)puVar15)->position_word_low
|
- (undefined1)puVar15[0x1]
+ ((uw_object_hdr_t *)puVar15)->position_word_low
)
...>
}


@receiver_5_w_2_17_address_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar15 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar15)->position_word_low
|
- &*(char *)((byte *)puVar15 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar15)->position_word_low
|
- &((char *)puVar15)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar15)->position_word_low
|
- &*(char *)((ushort *)puVar15 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar15)->position_word_low
|
- &*(char *)(puVar15 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar15)->position_word_low
)
...>
}


@receiver_5_w_2_17_store_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar15)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar15 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar15)->position_word_low = (byte)E;
|
- ((char *)puVar15)[0x2] = E;
+ ((uw_object_hdr_t *)puVar15)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar15 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar15)->position_word_low = (byte)E;
|
- *(char *)(puVar15 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar15)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x2)
+ (char)((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(char *)((byte *)puVar15 + 0x2)
+ (char)((uw_object_hdr_t *)puVar15)->position_word_low
|
- ((char *)puVar15)[0x2]
+ (char)((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(char *)((ushort *)puVar15 + 0x1)
+ (char)((uw_object_hdr_t *)puVar15)->position_word_low
|
- (char)((ushort *)puVar15)[0x1]
+ (char)((uw_object_hdr_t *)puVar15)->position_word_low
|
- *(char *)(puVar15 + 0x1)
+ (char)((uw_object_hdr_t *)puVar15)->position_word_low
|
- (char)puVar15[0x1]
+ (char)((uw_object_hdr_t *)puVar15)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->position_word_high
|
- *(byte *)((byte *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->position_word_high
|
- ((byte *)puVar15)[0x3]
+ ((uw_object_hdr_t *)puVar15)->position_word_high
)
...>
}


@receiver_5_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->position_word_high
|
- *(undefined1 *)((byte *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->position_word_high
|
- ((undefined1 *)puVar15)[0x3]
+ ((uw_object_hdr_t *)puVar15)->position_word_high
)
...>
}


@receiver_5_w_2_17_address_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar15 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar15)->position_word_high
|
- &*(char *)((byte *)puVar15 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar15)->position_word_high
|
- &((char *)puVar15)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar15)->position_word_high
)
...>
}


@receiver_5_w_2_17_store_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar15)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar15 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar15)->position_word_high = (byte)E;
|
- ((char *)puVar15)[0x3] = E;
+ ((uw_object_hdr_t *)puVar15)->position_word_high = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x3)
+ (char)((uw_object_hdr_t *)puVar15)->position_word_high
|
- *(char *)((byte *)puVar15 + 0x3)
+ (char)((uw_object_hdr_t *)puVar15)->position_word_high
|
- ((char *)puVar15)[0x3]
+ (char)((uw_object_hdr_t *)puVar15)->position_word_high
)
...>
}


@receiver_5_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar15 + 0x4) = (char)V;
- *(char *)((char *)puVar15 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar15 + 0x4) = (char)V;
- *(byte *)((char *)puVar15 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar15 + 0x4) = (byte)V;
- *(char *)((char *)puVar15 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar15 + 0x4) = (byte)V;
- *(byte *)((char *)puVar15 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- *(ushort *)((byte *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- ((ushort *)puVar15)[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- *(ushort *)((ushort *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- *(ushort *)(puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- puVar15[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word
)
...>
}


@receiver_5_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- *(undefined2 *)((byte *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- ((undefined2 *)puVar15)[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- *(undefined2 *)(puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- puVar15[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word
)
...>
}


@receiver_5_w_4_34_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word_signed
|
- *(short *)((byte *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word_signed
|
- ((short *)puVar15)[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word_signed
|
- *(short *)((short *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word_signed
|
- *(short *)(puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word_signed
)
...>
}


@receiver_5_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(byte *)((byte *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- ((byte *)puVar15)[0x4]
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(byte *)((ushort *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- (byte)((ushort *)puVar15)[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(byte *)(puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- (byte)puVar15[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(undefined1 *)((byte *)puVar15 + 0x4)
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- ((undefined1 *)puVar15)[0x4]
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- (undefined1)((ushort *)puVar15)[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(undefined1 *)(puVar15 + 0x2)
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
|
- (undefined1)puVar15[0x2]
+ ((uw_object_hdr_t *)puVar15)->chain_word_low
)
...>
}


@receiver_5_w_4_34_address_4@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar15 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar15)->chain_word_low
|
- &*(char *)((byte *)puVar15 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar15)->chain_word_low
|
- &((char *)puVar15)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar15)->chain_word_low
|
- &*(char *)((ushort *)puVar15 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar15)->chain_word_low
|
- &*(char *)(puVar15 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar15)->chain_word_low
)
...>
}


@receiver_5_w_4_34_store_4@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar15)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar15 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar15)->chain_word_low = (byte)E;
|
- ((char *)puVar15)[0x4] = E;
+ ((uw_object_hdr_t *)puVar15)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar15 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar15)->chain_word_low = (byte)E;
|
- *(char *)(puVar15 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar15)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x4)
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(char *)((byte *)puVar15 + 0x4)
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_low
|
- ((char *)puVar15)[0x4]
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(char *)((ushort *)puVar15 + 0x2)
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_low
|
- (char)((ushort *)puVar15)[0x2]
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_low
|
- *(char *)(puVar15 + 0x2)
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_low
|
- (char)puVar15[0x2]
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar15 + 0x5)
+ ((uw_object_hdr_t *)puVar15)->chain_word_high
|
- *(byte *)((byte *)puVar15 + 0x5)
+ ((uw_object_hdr_t *)puVar15)->chain_word_high
|
- ((byte *)puVar15)[0x5]
+ ((uw_object_hdr_t *)puVar15)->chain_word_high
)
...>
}


@receiver_5_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar15 + 0x5)
+ ((uw_object_hdr_t *)puVar15)->chain_word_high
|
- *(undefined1 *)((byte *)puVar15 + 0x5)
+ ((uw_object_hdr_t *)puVar15)->chain_word_high
|
- ((undefined1 *)puVar15)[0x5]
+ ((uw_object_hdr_t *)puVar15)->chain_word_high
)
...>
}


@receiver_5_w_4_34_address_5@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar15 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar15)->chain_word_high
|
- &*(char *)((byte *)puVar15 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar15)->chain_word_high
|
- &((char *)puVar15)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar15)->chain_word_high
)
...>
}


@receiver_5_w_4_34_store_5@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar15)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar15 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar15)->chain_word_high = (byte)E;
|
- ((char *)puVar15)[0x5] = E;
+ ((uw_object_hdr_t *)puVar15)->chain_word_high = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x5)
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_high
|
- *(char *)((byte *)puVar15 + 0x5)
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_high
|
- ((char *)puVar15)[0x5]
+ (char)((uw_object_hdr_t *)puVar15)->chain_word_high
)
...>
}


@receiver_5_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar15 + 0x6) = (char)V;
- *(char *)((char *)puVar15 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar15 + 0x6) = (char)V;
- *(byte *)((char *)puVar15 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar15 + 0x6) = (byte)V;
- *(char *)((char *)puVar15 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar15 + 0x6) = (byte)V;
- *(byte *)((char *)puVar15 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar15)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- *(ushort *)((byte *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- ((ushort *)puVar15)[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- *(ushort *)((ushort *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- *(ushort *)(puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- puVar15[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word
)
...>
}


@receiver_5_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- *(undefined2 *)((byte *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- ((undefined2 *)puVar15)[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- *(undefined2 *)((undefined2 *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- *(undefined2 *)(puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- puVar15[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word
)
...>
}


@receiver_5_w_6_51_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word_signed
|
- *(short *)((byte *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word_signed
|
- ((short *)puVar15)[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word_signed
|
- *(short *)((short *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word_signed
|
- *(short *)(puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word_signed
)
...>
}


@receiver_5_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(byte *)((byte *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- ((byte *)puVar15)[0x6]
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(byte *)((ushort *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- (byte)((ushort *)puVar15)[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(byte *)(puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- (byte)puVar15[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(undefined1 *)((byte *)puVar15 + 0x6)
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- ((undefined1 *)puVar15)[0x6]
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(undefined1 *)((ushort *)puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- (undefined1)((ushort *)puVar15)[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(undefined1 *)(puVar15 + 0x3)
+ ((uw_object_hdr_t *)puVar15)->link_word_low
|
- (undefined1)puVar15[0x3]
+ ((uw_object_hdr_t *)puVar15)->link_word_low
)
...>
}


@receiver_5_w_6_51_address_6@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar15 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar15)->link_word_low
|
- &*(char *)((byte *)puVar15 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar15)->link_word_low
|
- &((char *)puVar15)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar15)->link_word_low
|
- &*(char *)((ushort *)puVar15 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar15)->link_word_low
|
- &*(char *)(puVar15 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar15)->link_word_low
)
...>
}


@receiver_5_w_6_51_store_6@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar15)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar15 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar15)->link_word_low = (byte)E;
|
- ((char *)puVar15)[0x6] = E;
+ ((uw_object_hdr_t *)puVar15)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar15 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar15)->link_word_low = (byte)E;
|
- *(char *)(puVar15 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar15)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x6)
+ (char)((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(char *)((byte *)puVar15 + 0x6)
+ (char)((uw_object_hdr_t *)puVar15)->link_word_low
|
- ((char *)puVar15)[0x6]
+ (char)((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(char *)((ushort *)puVar15 + 0x3)
+ (char)((uw_object_hdr_t *)puVar15)->link_word_low
|
- (char)((ushort *)puVar15)[0x3]
+ (char)((uw_object_hdr_t *)puVar15)->link_word_low
|
- *(char *)(puVar15 + 0x3)
+ (char)((uw_object_hdr_t *)puVar15)->link_word_low
|
- (char)puVar15[0x3]
+ (char)((uw_object_hdr_t *)puVar15)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar15 + 0x7)
+ ((uw_object_hdr_t *)puVar15)->link_word_high
|
- *(byte *)((byte *)puVar15 + 0x7)
+ ((uw_object_hdr_t *)puVar15)->link_word_high
|
- ((byte *)puVar15)[0x7]
+ ((uw_object_hdr_t *)puVar15)->link_word_high
)
...>
}


@receiver_5_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar15 + 0x7)
+ ((uw_object_hdr_t *)puVar15)->link_word_high
|
- *(undefined1 *)((byte *)puVar15 + 0x7)
+ ((uw_object_hdr_t *)puVar15)->link_word_high
|
- ((undefined1 *)puVar15)[0x7]
+ ((uw_object_hdr_t *)puVar15)->link_word_high
)
...>
}


@receiver_5_w_6_51_address_7@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar15 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar15)->link_word_high
|
- &*(char *)((byte *)puVar15 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar15)->link_word_high
|
- &((char *)puVar15)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar15)->link_word_high
)
...>
}


@receiver_5_w_6_51_store_7@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar15)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar15 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar15)->link_word_high = (byte)E;
|
- ((char *)puVar15)[0x7] = E;
+ ((uw_object_hdr_t *)puVar15)->link_word_high = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar15 + 0x7)
+ (char)((uw_object_hdr_t *)puVar15)->link_word_high
|
- *(char *)((byte *)puVar15 + 0x7)
+ (char)((uw_object_hdr_t *)puVar15)->link_word_high
|
- ((char *)puVar15)[0x7]
+ (char)((uw_object_hdr_t *)puVar15)->link_word_high
)
...>
}


@receiver_6_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar14 + 0x0) = (char)V;
- *(char *)((char *)puVar14 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar14 + 0x0) = (char)V;
- *(byte *)((char *)puVar14 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar14 + 0x0) = (byte)V;
- *(char *)((char *)puVar14 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar14 + 0x0) = (byte)V;
- *(byte *)((char *)puVar14 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *(ushort *)((byte *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- ((ushort *)puVar14)[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *(ushort *)((ushort *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *(ushort *)(puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- puVar14[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *puVar14
+ ((uw_object_hdr_t *)puVar14)->type_flags
)
...>
}


@receiver_6_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *(undefined2 *)((byte *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- ((undefined2 *)puVar14)[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *(undefined2 *)(puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- puVar14[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *puVar14
+ ((uw_object_hdr_t *)puVar14)->type_flags
)
...>
}


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_signed
|
- *(short *)((byte *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_signed
|
- ((short *)puVar14)[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags_signed
|
- *(short *)((short *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_signed
|
- *(short *)(puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_signed
)
...>
}


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(byte *)((byte *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- ((byte *)puVar14)[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(byte *)((ushort *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- (byte)((ushort *)puVar14)[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(byte *)puVar14
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(byte *)(puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- (byte)puVar14[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(undefined1 *)((byte *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- ((undefined1 *)puVar14)[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- (undefined1)((ushort *)puVar14)[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(undefined1 *)puVar14
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(undefined1 *)(puVar14 + 0x0)
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
|
- (undefined1)puVar14[0x0]
+ ((uw_object_hdr_t *)puVar14)->type_flags_low
)
...>
}


@receiver_6_w_0_0_address_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar14 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_low
|
- &*(char *)((byte *)puVar14 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_low
|
- &((char *)puVar14)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_low
|
- &*(char *)((ushort *)puVar14 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_low
|
- &*(char *)puVar14
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_low
|
- &*(char *)(puVar14 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_low
)
...>
}


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar14 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_low = (byte)E;
|
- ((char *)puVar14)[0x0] = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar14 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_low = (byte)E;
|
- *(char *)puVar14 = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_low = (byte)E;
|
- *(char *)(puVar14 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_low = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x0)
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(char *)((byte *)puVar14 + 0x0)
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_low
|
- ((char *)puVar14)[0x0]
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(char *)((ushort *)puVar14 + 0x0)
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_low
|
- (char)((ushort *)puVar14)[0x0]
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(char *)puVar14
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_low
|
- *(char *)(puVar14 + 0x0)
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_low
|
- (char)puVar14[0x0]
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->type_flags_high
|
- *(byte *)((byte *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->type_flags_high
|
- ((byte *)puVar14)[0x1]
+ ((uw_object_hdr_t *)puVar14)->type_flags_high
)
...>
}


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->type_flags_high
|
- *(undefined1 *)((byte *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->type_flags_high
|
- ((undefined1 *)puVar14)[0x1]
+ ((uw_object_hdr_t *)puVar14)->type_flags_high
)
...>
}


@receiver_6_w_0_0_address_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar14 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_high
|
- &*(char *)((byte *)puVar14 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_high
|
- &((char *)puVar14)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar14)->type_flags_high
)
...>
}


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar14 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_high = (byte)E;
|
- ((char *)puVar14)[0x1] = E;
+ ((uw_object_hdr_t *)puVar14)->type_flags_high = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x1)
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_high
|
- *(char *)((byte *)puVar14 + 0x1)
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_high
|
- ((char *)puVar14)[0x1]
+ (char)((uw_object_hdr_t *)puVar14)->type_flags_high
)
...>
}


@receiver_6_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar14 + 0x2) = (char)V;
- *(char *)((char *)puVar14 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar14 + 0x2) = (char)V;
- *(byte *)((char *)puVar14 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar14 + 0x2) = (byte)V;
- *(char *)((char *)puVar14 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar14 + 0x2) = (byte)V;
- *(byte *)((char *)puVar14 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- *(ushort *)((byte *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- ((ushort *)puVar14)[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- *(ushort *)((ushort *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- *(ushort *)(puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- puVar14[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word
)
...>
}


@receiver_6_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- *(undefined2 *)((byte *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- ((undefined2 *)puVar14)[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- *(undefined2 *)((undefined2 *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- *(undefined2 *)(puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- puVar14[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word
)
...>
}


@receiver_6_w_2_17_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word_signed
|
- *(short *)((byte *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word_signed
|
- ((short *)puVar14)[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word_signed
|
- *(short *)((short *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word_signed
|
- *(short *)(puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word_signed
)
...>
}


@receiver_6_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(byte *)((byte *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- ((byte *)puVar14)[0x2]
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(byte *)((ushort *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- (byte)((ushort *)puVar14)[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(byte *)(puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- (byte)puVar14[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word_low
)
...>
}


@receiver_6_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(undefined1 *)((byte *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- ((undefined1 *)puVar14)[0x2]
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(undefined1 *)((ushort *)puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- (undefined1)((ushort *)puVar14)[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(undefined1 *)(puVar14 + 0x1)
+ ((uw_object_hdr_t *)puVar14)->position_word_low
|
- (undefined1)puVar14[0x1]
+ ((uw_object_hdr_t *)puVar14)->position_word_low
)
...>
}


@receiver_6_w_2_17_address_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar14 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar14)->position_word_low
|
- &*(char *)((byte *)puVar14 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar14)->position_word_low
|
- &((char *)puVar14)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar14)->position_word_low
|
- &*(char *)((ushort *)puVar14 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar14)->position_word_low
|
- &*(char *)(puVar14 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar14)->position_word_low
)
...>
}


@receiver_6_w_2_17_store_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar14)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar14 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar14)->position_word_low = (byte)E;
|
- ((char *)puVar14)[0x2] = E;
+ ((uw_object_hdr_t *)puVar14)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar14 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar14)->position_word_low = (byte)E;
|
- *(char *)(puVar14 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar14)->position_word_low = (byte)E;
)
...>
}


@receiver_6_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x2)
+ (char)((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(char *)((byte *)puVar14 + 0x2)
+ (char)((uw_object_hdr_t *)puVar14)->position_word_low
|
- ((char *)puVar14)[0x2]
+ (char)((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(char *)((ushort *)puVar14 + 0x1)
+ (char)((uw_object_hdr_t *)puVar14)->position_word_low
|
- (char)((ushort *)puVar14)[0x1]
+ (char)((uw_object_hdr_t *)puVar14)->position_word_low
|
- *(char *)(puVar14 + 0x1)
+ (char)((uw_object_hdr_t *)puVar14)->position_word_low
|
- (char)puVar14[0x1]
+ (char)((uw_object_hdr_t *)puVar14)->position_word_low
)
...>
}


@receiver_6_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->position_word_high
|
- *(byte *)((byte *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->position_word_high
|
- ((byte *)puVar14)[0x3]
+ ((uw_object_hdr_t *)puVar14)->position_word_high
)
...>
}


@receiver_6_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->position_word_high
|
- *(undefined1 *)((byte *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->position_word_high
|
- ((undefined1 *)puVar14)[0x3]
+ ((uw_object_hdr_t *)puVar14)->position_word_high
)
...>
}


@receiver_6_w_2_17_address_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar14 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar14)->position_word_high
|
- &*(char *)((byte *)puVar14 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar14)->position_word_high
|
- &((char *)puVar14)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar14)->position_word_high
)
...>
}


@receiver_6_w_2_17_store_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar14)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar14 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar14)->position_word_high = (byte)E;
|
- ((char *)puVar14)[0x3] = E;
+ ((uw_object_hdr_t *)puVar14)->position_word_high = (byte)E;
)
...>
}


@receiver_6_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x3)
+ (char)((uw_object_hdr_t *)puVar14)->position_word_high
|
- *(char *)((byte *)puVar14 + 0x3)
+ (char)((uw_object_hdr_t *)puVar14)->position_word_high
|
- ((char *)puVar14)[0x3]
+ (char)((uw_object_hdr_t *)puVar14)->position_word_high
)
...>
}


@receiver_6_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar14 + 0x4) = (char)V;
- *(char *)((char *)puVar14 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar14 + 0x4) = (char)V;
- *(byte *)((char *)puVar14 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar14 + 0x4) = (byte)V;
- *(char *)((char *)puVar14 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar14 + 0x4) = (byte)V;
- *(byte *)((char *)puVar14 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- *(ushort *)((byte *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- ((ushort *)puVar14)[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- *(ushort *)((ushort *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- *(ushort *)(puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- puVar14[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word
)
...>
}


@receiver_6_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- *(undefined2 *)((byte *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- ((undefined2 *)puVar14)[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- *(undefined2 *)(puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- puVar14[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word
)
...>
}


@receiver_6_w_4_34_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word_signed
|
- *(short *)((byte *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word_signed
|
- ((short *)puVar14)[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word_signed
|
- *(short *)((short *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word_signed
|
- *(short *)(puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word_signed
)
...>
}


@receiver_6_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(byte *)((byte *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- ((byte *)puVar14)[0x4]
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(byte *)((ushort *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- (byte)((ushort *)puVar14)[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(byte *)(puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- (byte)puVar14[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
)
...>
}


@receiver_6_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(undefined1 *)((byte *)puVar14 + 0x4)
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- ((undefined1 *)puVar14)[0x4]
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- (undefined1)((ushort *)puVar14)[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(undefined1 *)(puVar14 + 0x2)
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
|
- (undefined1)puVar14[0x2]
+ ((uw_object_hdr_t *)puVar14)->chain_word_low
)
...>
}


@receiver_6_w_4_34_address_4@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar14 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar14)->chain_word_low
|
- &*(char *)((byte *)puVar14 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar14)->chain_word_low
|
- &((char *)puVar14)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar14)->chain_word_low
|
- &*(char *)((ushort *)puVar14 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar14)->chain_word_low
|
- &*(char *)(puVar14 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar14)->chain_word_low
)
...>
}


@receiver_6_w_4_34_store_4@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar14)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar14 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar14)->chain_word_low = (byte)E;
|
- ((char *)puVar14)[0x4] = E;
+ ((uw_object_hdr_t *)puVar14)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar14 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar14)->chain_word_low = (byte)E;
|
- *(char *)(puVar14 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar14)->chain_word_low = (byte)E;
)
...>
}


@receiver_6_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x4)
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(char *)((byte *)puVar14 + 0x4)
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_low
|
- ((char *)puVar14)[0x4]
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(char *)((ushort *)puVar14 + 0x2)
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_low
|
- (char)((ushort *)puVar14)[0x2]
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_low
|
- *(char *)(puVar14 + 0x2)
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_low
|
- (char)puVar14[0x2]
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_low
)
...>
}


@receiver_6_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar14 + 0x5)
+ ((uw_object_hdr_t *)puVar14)->chain_word_high
|
- *(byte *)((byte *)puVar14 + 0x5)
+ ((uw_object_hdr_t *)puVar14)->chain_word_high
|
- ((byte *)puVar14)[0x5]
+ ((uw_object_hdr_t *)puVar14)->chain_word_high
)
...>
}


@receiver_6_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar14 + 0x5)
+ ((uw_object_hdr_t *)puVar14)->chain_word_high
|
- *(undefined1 *)((byte *)puVar14 + 0x5)
+ ((uw_object_hdr_t *)puVar14)->chain_word_high
|
- ((undefined1 *)puVar14)[0x5]
+ ((uw_object_hdr_t *)puVar14)->chain_word_high
)
...>
}


@receiver_6_w_4_34_address_5@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar14 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar14)->chain_word_high
|
- &*(char *)((byte *)puVar14 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar14)->chain_word_high
|
- &((char *)puVar14)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar14)->chain_word_high
)
...>
}


@receiver_6_w_4_34_store_5@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar14)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar14 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar14)->chain_word_high = (byte)E;
|
- ((char *)puVar14)[0x5] = E;
+ ((uw_object_hdr_t *)puVar14)->chain_word_high = (byte)E;
)
...>
}


@receiver_6_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x5)
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_high
|
- *(char *)((byte *)puVar14 + 0x5)
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_high
|
- ((char *)puVar14)[0x5]
+ (char)((uw_object_hdr_t *)puVar14)->chain_word_high
)
...>
}


@receiver_6_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar14 + 0x6) = (char)V;
- *(char *)((char *)puVar14 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar14 + 0x6) = (char)V;
- *(byte *)((char *)puVar14 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar14 + 0x6) = (byte)V;
- *(char *)((char *)puVar14 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar14 + 0x6) = (byte)V;
- *(byte *)((char *)puVar14 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar14)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_word_ushort@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- *(ushort *)((byte *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- ((ushort *)puVar14)[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- *(ushort *)((ushort *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- *(ushort *)(puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- puVar14[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word
)
...>
}


@receiver_6_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- *(undefined2 *)((byte *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- ((undefined2 *)puVar14)[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- *(undefined2 *)((undefined2 *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- *(undefined2 *)(puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- puVar14[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word
)
...>
}


@receiver_6_w_6_51_word_short@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word_signed
|
- *(short *)((byte *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word_signed
|
- ((short *)puVar14)[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word_signed
|
- *(short *)((short *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word_signed
|
- *(short *)(puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word_signed
)
...>
}


@receiver_6_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(byte *)((byte *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- ((byte *)puVar14)[0x6]
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(byte *)((ushort *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- (byte)((ushort *)puVar14)[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(byte *)(puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- (byte)puVar14[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word_low
)
...>
}


@receiver_6_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(undefined1 *)((byte *)puVar14 + 0x6)
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- ((undefined1 *)puVar14)[0x6]
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(undefined1 *)((ushort *)puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- (undefined1)((ushort *)puVar14)[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(undefined1 *)(puVar14 + 0x3)
+ ((uw_object_hdr_t *)puVar14)->link_word_low
|
- (undefined1)puVar14[0x3]
+ ((uw_object_hdr_t *)puVar14)->link_word_low
)
...>
}


@receiver_6_w_6_51_address_6@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar14 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar14)->link_word_low
|
- &*(char *)((byte *)puVar14 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar14)->link_word_low
|
- &((char *)puVar14)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar14)->link_word_low
|
- &*(char *)((ushort *)puVar14 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar14)->link_word_low
|
- &*(char *)(puVar14 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar14)->link_word_low
)
...>
}


@receiver_6_w_6_51_store_6@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar14)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar14 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar14)->link_word_low = (byte)E;
|
- ((char *)puVar14)[0x6] = E;
+ ((uw_object_hdr_t *)puVar14)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar14 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar14)->link_word_low = (byte)E;
|
- *(char *)(puVar14 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar14)->link_word_low = (byte)E;
)
...>
}


@receiver_6_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x6)
+ (char)((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(char *)((byte *)puVar14 + 0x6)
+ (char)((uw_object_hdr_t *)puVar14)->link_word_low
|
- ((char *)puVar14)[0x6]
+ (char)((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(char *)((ushort *)puVar14 + 0x3)
+ (char)((uw_object_hdr_t *)puVar14)->link_word_low
|
- (char)((ushort *)puVar14)[0x3]
+ (char)((uw_object_hdr_t *)puVar14)->link_word_low
|
- *(char *)(puVar14 + 0x3)
+ (char)((uw_object_hdr_t *)puVar14)->link_word_low
|
- (char)puVar14[0x3]
+ (char)((uw_object_hdr_t *)puVar14)->link_word_low
)
...>
}


@receiver_6_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar14 + 0x7)
+ ((uw_object_hdr_t *)puVar14)->link_word_high
|
- *(byte *)((byte *)puVar14 + 0x7)
+ ((uw_object_hdr_t *)puVar14)->link_word_high
|
- ((byte *)puVar14)[0x7]
+ ((uw_object_hdr_t *)puVar14)->link_word_high
)
...>
}


@receiver_6_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar14 + 0x7)
+ ((uw_object_hdr_t *)puVar14)->link_word_high
|
- *(undefined1 *)((byte *)puVar14 + 0x7)
+ ((uw_object_hdr_t *)puVar14)->link_word_high
|
- ((undefined1 *)puVar14)[0x7]
+ ((uw_object_hdr_t *)puVar14)->link_word_high
)
...>
}


@receiver_6_w_6_51_address_7@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar14 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar14)->link_word_high
|
- &*(char *)((byte *)puVar14 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar14)->link_word_high
|
- &((char *)puVar14)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar14)->link_word_high
)
...>
}


@receiver_6_w_6_51_store_7@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar14)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar14 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar14)->link_word_high = (byte)E;
|
- ((char *)puVar14)[0x7] = E;
+ ((uw_object_hdr_t *)puVar14)->link_word_high = (byte)E;
)
...>
}


@receiver_6_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar14 + 0x7)
+ (char)((uw_object_hdr_t *)puVar14)->link_word_high
|
- *(char *)((byte *)puVar14 + 0x7)
+ (char)((uw_object_hdr_t *)puVar14)->link_word_high
|
- ((char *)puVar14)[0x7]
+ (char)((uw_object_hdr_t *)puVar14)->link_word_high
)
...>
}


@receiver_7_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_0_0_word_ushort@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_word_short@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_address_0@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_store_0@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_address_1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_store_1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_2_17_word_ushort@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_word_short@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_address_2@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_store_2@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_address_3@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_store_3@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_4_34_word_ushort@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_word_short@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_address_4@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_store_4@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_address_5@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_store_5@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@receiver_7_w_6_51_word_ushort@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_word_short@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_address_6@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_store_6@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_address_7@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_store_7@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_7_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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


@receiver_8_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_0_0_word_ushort@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_word_short@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_address_0@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_store_0@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_address_1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_store_1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_2_17_word_ushort@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_word_short@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_address_2@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_store_2@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_address_3@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_store_3@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_4_34_word_ushort@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_word_short@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_address_4@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_store_4@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_address_5@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_store_5@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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

@receiver_8_w_6_51_word_ushort@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_word_short@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_address_6@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_store_6@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_address_7@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_store_7@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_8_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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


@receiver_9_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
identifier F =~ "^\(sum_container_weight\)$";
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
identifier F =~ "^\(sum_container_weight\)$";
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
identifier F =~ "^\(sum_container_weight\)$";
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
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_0_0_word_short@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_0_0_address_0@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_0_0_store_0@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_0_0_address_1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_0_0_store_1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_2_17_word_ushort@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_2_17_word_short@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_2_17_address_2@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_2_17_store_2@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_2_17_address_3@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_2_17_store_3@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_4_34_word_ushort@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_4_34_word_short@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_4_34_address_4@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_4_34_store_4@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_4_34_address_5@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_4_34_store_5@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@receiver_9_w_6_51_word_ushort@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_6_51_word_short@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_6_51_address_6@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_6_51_store_6@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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
)
...>
}


@receiver_9_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_6_51_address_7@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_6_51_store_7@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_9_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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


@receiver_10_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNextLink + 0x0) = (char)V;
- *(char *)((char *)pNextLink + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNextLink + 0x0) = (char)V;
- *(byte *)((char *)pNextLink + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNextLink + 0x0) = (byte)V;
- *(char *)((char *)pNextLink + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNextLink + 0x0) = (byte)V;
- *(byte *)((char *)pNextLink + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_word_ushort@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- *(ushort *)((byte *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- ((ushort *)pNextLink)[0x0]
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- *(ushort *)((ushort *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- *(ushort *)(pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
)
...>
}


@receiver_10_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- *(undefined2 *)((byte *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- ((undefined2 *)pNextLink)[0x0]
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- *(undefined2 *)((undefined2 *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- *(undefined2 *)(pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
)
...>
}


@receiver_10_w_0_0_word_short@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_signed
|
- *(short *)((byte *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_signed
|
- ((short *)pNextLink)[0x0]
+ ((uw_object_hdr_t *)pNextLink)->type_flags_signed
|
- *(short *)((short *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_signed
|
- *(short *)(pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_signed
)
...>
}


@receiver_10_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(byte *)((byte *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- ((byte *)pNextLink)[0x0]
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(byte *)((ushort *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- (byte)((ushort *)pNextLink)[0x0]
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(byte *)pNextLink
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(byte *)(pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(undefined1 *)((byte *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- ((undefined1 *)pNextLink)[0x0]
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(undefined1 *)((ushort *)pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- (undefined1)((ushort *)pNextLink)[0x0]
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(undefined1 *)pNextLink
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(undefined1 *)(pNextLink + 0x0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low
)
...>
}


@receiver_10_w_0_0_address_0@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNextLink + 0x0)
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- &*(char *)((byte *)pNextLink + 0x0)
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- &((char *)pNextLink)[0x0]
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- &*(char *)((ushort *)pNextLink + 0x0)
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- &*(char *)pNextLink
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- &*(char *)(pNextLink + 0x0)
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- &pNextLink[0x0]
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- &*pNextLink
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_low
)
...>
}


@receiver_10_w_0_0_store_0@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x0) = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pNextLink + 0x0) = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low = (byte)E;
|
- ((char *)pNextLink)[0x0] = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pNextLink + 0x0) = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low = (byte)E;
|
- *(char *)pNextLink = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low = (byte)E;
|
- *(char *)(pNextLink + 0x0) = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low = (byte)E;
|
- pNextLink[0x0] = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low = (byte)E;
|
- *pNextLink = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_low = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x0)
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(char *)((byte *)pNextLink + 0x0)
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- ((char *)pNextLink)[0x0]
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(char *)((ushort *)pNextLink + 0x0)
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- (char)((ushort *)pNextLink)[0x0]
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(char *)pNextLink
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *(char *)(pNextLink + 0x0)
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- pNextLink[0x0]
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
|
- *pNextLink
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- *(byte *)((byte *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- ((byte *)pNextLink)[0x1]
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- *(byte *)(pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high
)
...>
}


@receiver_10_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- *(undefined1 *)((byte *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- ((undefined1 *)pNextLink)[0x1]
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- *(undefined1 *)(pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high
)
...>
}


@receiver_10_w_0_0_address_1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNextLink + 0x1)
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- &*(char *)((byte *)pNextLink + 0x1)
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- &((char *)pNextLink)[0x1]
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- &*(char *)(pNextLink + 0x1)
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- &pNextLink[0x1]
+ (char *)&((uw_object_hdr_t *)pNextLink)->type_flags_high
)
...>
}


@receiver_10_w_0_0_store_1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x1) = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pNextLink + 0x1) = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high = (byte)E;
|
- ((char *)pNextLink)[0x1] = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high = (byte)E;
|
- *(char *)(pNextLink + 0x1) = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high = (byte)E;
|
- pNextLink[0x1] = E;
+ ((uw_object_hdr_t *)pNextLink)->type_flags_high = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x1)
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- *(char *)((byte *)pNextLink + 0x1)
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- ((char *)pNextLink)[0x1]
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- *(char *)(pNextLink + 0x1)
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_high
|
- pNextLink[0x1]
+ (char)((uw_object_hdr_t *)pNextLink)->type_flags_high
)
...>
}


@receiver_10_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNextLink + 0x2) = (char)V;
- *(char *)((char *)pNextLink + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNextLink + 0x2) = (char)V;
- *(byte *)((char *)pNextLink + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNextLink + 0x2) = (byte)V;
- *(char *)((char *)pNextLink + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNextLink + 0x2) = (byte)V;
- *(byte *)((char *)pNextLink + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_17_word_ushort@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- *(ushort *)((byte *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- ((ushort *)pNextLink)[0x1]
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- *(ushort *)((ushort *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- *(ushort *)(pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word
)
...>
}


@receiver_10_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- *(undefined2 *)((byte *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- ((undefined2 *)pNextLink)[0x1]
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- *(undefined2 *)((undefined2 *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- *(undefined2 *)(pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word
)
...>
}


@receiver_10_w_2_17_word_short@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_signed
|
- *(short *)((byte *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_signed
|
- ((short *)pNextLink)[0x1]
+ ((uw_object_hdr_t *)pNextLink)->position_word_signed
|
- *(short *)((short *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->position_word_signed
|
- *(short *)(pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_signed
)
...>
}


@receiver_10_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(byte *)((byte *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- ((byte *)pNextLink)[0x2]
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(byte *)((ushort *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- (byte)((ushort *)pNextLink)[0x1]
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(byte *)(pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(undefined1 *)((byte *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- ((undefined1 *)pNextLink)[0x2]
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(undefined1 *)((ushort *)pNextLink + 0x1)
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- (undefined1)((ushort *)pNextLink)[0x1]
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(undefined1 *)(pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->position_word_low
)
...>
}


@receiver_10_w_2_17_address_2@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNextLink + 0x2)
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_low
|
- &*(char *)((byte *)pNextLink + 0x2)
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_low
|
- &((char *)pNextLink)[0x2]
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_low
|
- &*(char *)((ushort *)pNextLink + 0x1)
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_low
|
- &*(char *)(pNextLink + 0x2)
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_low
|
- &pNextLink[0x2]
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_low
)
...>
}


@receiver_10_w_2_17_store_2@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x2) = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_low = (byte)E;
|
- *(char *)((byte *)pNextLink + 0x2) = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_low = (byte)E;
|
- ((char *)pNextLink)[0x2] = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pNextLink + 0x1) = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_low = (byte)E;
|
- *(char *)(pNextLink + 0x2) = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_low = (byte)E;
|
- pNextLink[0x2] = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_low = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x2)
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(char *)((byte *)pNextLink + 0x2)
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_low
|
- ((char *)pNextLink)[0x2]
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(char *)((ushort *)pNextLink + 0x1)
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_low
|
- (char)((ushort *)pNextLink)[0x1]
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_low
|
- *(char *)(pNextLink + 0x2)
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_low
|
- pNextLink[0x2]
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->position_word_high
|
- *(byte *)((byte *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->position_word_high
|
- ((byte *)pNextLink)[0x3]
+ ((uw_object_hdr_t *)pNextLink)->position_word_high
|
- *(byte *)(pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->position_word_high
)
...>
}


@receiver_10_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->position_word_high
|
- *(undefined1 *)((byte *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->position_word_high
|
- ((undefined1 *)pNextLink)[0x3]
+ ((uw_object_hdr_t *)pNextLink)->position_word_high
|
- *(undefined1 *)(pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->position_word_high
)
...>
}


@receiver_10_w_2_17_address_3@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNextLink + 0x3)
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_high
|
- &*(char *)((byte *)pNextLink + 0x3)
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_high
|
- &((char *)pNextLink)[0x3]
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_high
|
- &*(char *)(pNextLink + 0x3)
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_high
|
- &pNextLink[0x3]
+ (char *)&((uw_object_hdr_t *)pNextLink)->position_word_high
)
...>
}


@receiver_10_w_2_17_store_3@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x3) = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_high = (byte)E;
|
- *(char *)((byte *)pNextLink + 0x3) = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_high = (byte)E;
|
- ((char *)pNextLink)[0x3] = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_high = (byte)E;
|
- *(char *)(pNextLink + 0x3) = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_high = (byte)E;
|
- pNextLink[0x3] = E;
+ ((uw_object_hdr_t *)pNextLink)->position_word_high = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x3)
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_high
|
- *(char *)((byte *)pNextLink + 0x3)
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_high
|
- ((char *)pNextLink)[0x3]
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_high
|
- *(char *)(pNextLink + 0x3)
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_high
|
- pNextLink[0x3]
+ (char)((uw_object_hdr_t *)pNextLink)->position_word_high
)
...>
}


@receiver_10_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNextLink + 0x4) = (char)V;
- *(char *)((char *)pNextLink + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNextLink + 0x4) = (char)V;
- *(byte *)((char *)pNextLink + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNextLink + 0x4) = (byte)V;
- *(char *)((char *)pNextLink + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNextLink + 0x4) = (byte)V;
- *(byte *)((char *)pNextLink + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_34_word_ushort@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- *(ushort *)((byte *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- ((ushort *)pNextLink)[0x2]
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- *(ushort *)((ushort *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- *(ushort *)(pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
)
...>
}


@receiver_10_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- *(undefined2 *)((byte *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- ((undefined2 *)pNextLink)[0x2]
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- *(undefined2 *)((undefined2 *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- *(undefined2 *)(pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
)
...>
}


@receiver_10_w_4_34_word_short@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_signed
|
- *(short *)((byte *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_signed
|
- ((short *)pNextLink)[0x2]
+ ((uw_object_hdr_t *)pNextLink)->chain_word_signed
|
- *(short *)((short *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_signed
|
- *(short *)(pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_signed
)
...>
}


@receiver_10_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(byte *)((byte *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- ((byte *)pNextLink)[0x4]
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(byte *)((ushort *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- (byte)((ushort *)pNextLink)[0x2]
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(byte *)(pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(undefined1 *)((byte *)pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- ((undefined1 *)pNextLink)[0x4]
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(undefined1 *)((ushort *)pNextLink + 0x2)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- (undefined1)((ushort *)pNextLink)[0x2]
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(undefined1 *)(pNextLink + 0x4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low
)
...>
}


@receiver_10_w_4_34_address_4@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNextLink + 0x4)
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- &*(char *)((byte *)pNextLink + 0x4)
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- &((char *)pNextLink)[0x4]
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- &*(char *)((ushort *)pNextLink + 0x2)
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- &*(char *)(pNextLink + 0x4)
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- &pNextLink[0x4]
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_low
)
...>
}


@receiver_10_w_4_34_store_4@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x4) = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pNextLink + 0x4) = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low = (byte)E;
|
- ((char *)pNextLink)[0x4] = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pNextLink + 0x2) = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low = (byte)E;
|
- *(char *)(pNextLink + 0x4) = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low = (byte)E;
|
- pNextLink[0x4] = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_low = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x4)
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(char *)((byte *)pNextLink + 0x4)
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- ((char *)pNextLink)[0x4]
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(char *)((ushort *)pNextLink + 0x2)
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- (char)((ushort *)pNextLink)[0x2]
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- *(char *)(pNextLink + 0x4)
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_low
|
- pNextLink[0x4]
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNextLink + 0x5)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- *(byte *)((byte *)pNextLink + 0x5)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- ((byte *)pNextLink)[0x5]
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- *(byte *)(pNextLink + 0x5)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high
)
...>
}


@receiver_10_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNextLink + 0x5)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- *(undefined1 *)((byte *)pNextLink + 0x5)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- ((undefined1 *)pNextLink)[0x5]
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- *(undefined1 *)(pNextLink + 0x5)
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high
)
...>
}


@receiver_10_w_4_34_address_5@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNextLink + 0x5)
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- &*(char *)((byte *)pNextLink + 0x5)
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- &((char *)pNextLink)[0x5]
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- &*(char *)(pNextLink + 0x5)
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- &pNextLink[0x5]
+ (char *)&((uw_object_hdr_t *)pNextLink)->chain_word_high
)
...>
}


@receiver_10_w_4_34_store_5@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x5) = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pNextLink + 0x5) = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high = (byte)E;
|
- ((char *)pNextLink)[0x5] = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high = (byte)E;
|
- *(char *)(pNextLink + 0x5) = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high = (byte)E;
|
- pNextLink[0x5] = E;
+ ((uw_object_hdr_t *)pNextLink)->chain_word_high = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x5)
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- *(char *)((byte *)pNextLink + 0x5)
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- ((char *)pNextLink)[0x5]
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- *(char *)(pNextLink + 0x5)
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_high
|
- pNextLink[0x5]
+ (char)((uw_object_hdr_t *)pNextLink)->chain_word_high
)
...>
}


@receiver_10_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNextLink + 0x6) = (char)V;
- *(char *)((char *)pNextLink + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNextLink + 0x6) = (char)V;
- *(byte *)((char *)pNextLink + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNextLink + 0x6) = (byte)V;
- *(char *)((char *)pNextLink + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNextLink + 0x6) = (byte)V;
- *(byte *)((char *)pNextLink + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNextLink)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_51_word_ushort@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- *(ushort *)((byte *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- ((ushort *)pNextLink)[0x3]
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- *(ushort *)((ushort *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- *(ushort *)(pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word
)
...>
}


@receiver_10_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- *(undefined2 *)((byte *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- ((undefined2 *)pNextLink)[0x3]
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- *(undefined2 *)((undefined2 *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- *(undefined2 *)(pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word
)
...>
}


@receiver_10_w_6_51_word_short@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_signed
|
- *(short *)((byte *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_signed
|
- ((short *)pNextLink)[0x3]
+ ((uw_object_hdr_t *)pNextLink)->link_word_signed
|
- *(short *)((short *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->link_word_signed
|
- *(short *)(pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_signed
)
...>
}


@receiver_10_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(byte *)((byte *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- ((byte *)pNextLink)[0x6]
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(byte *)((ushort *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- (byte)((ushort *)pNextLink)[0x3]
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(byte *)(pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(undefined1 *)((byte *)pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- ((undefined1 *)pNextLink)[0x6]
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(undefined1 *)((ushort *)pNextLink + 0x3)
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- (undefined1)((ushort *)pNextLink)[0x3]
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(undefined1 *)(pNextLink + 0x6)
+ ((uw_object_hdr_t *)pNextLink)->link_word_low
)
...>
}


@receiver_10_w_6_51_address_6@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNextLink + 0x6)
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_low
|
- &*(char *)((byte *)pNextLink + 0x6)
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_low
|
- &((char *)pNextLink)[0x6]
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_low
|
- &*(char *)((ushort *)pNextLink + 0x3)
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_low
|
- &*(char *)(pNextLink + 0x6)
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_low
|
- &pNextLink[0x6]
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_low
)
...>
}


@receiver_10_w_6_51_store_6@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x6) = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_low = (byte)E;
|
- *(char *)((byte *)pNextLink + 0x6) = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_low = (byte)E;
|
- ((char *)pNextLink)[0x6] = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pNextLink + 0x3) = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_low = (byte)E;
|
- *(char *)(pNextLink + 0x6) = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_low = (byte)E;
|
- pNextLink[0x6] = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_low = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x6)
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(char *)((byte *)pNextLink + 0x6)
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_low
|
- ((char *)pNextLink)[0x6]
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(char *)((ushort *)pNextLink + 0x3)
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_low
|
- (char)((ushort *)pNextLink)[0x3]
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_low
|
- *(char *)(pNextLink + 0x6)
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_low
|
- pNextLink[0x6]
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNextLink + 0x7)
+ ((uw_object_hdr_t *)pNextLink)->link_word_high
|
- *(byte *)((byte *)pNextLink + 0x7)
+ ((uw_object_hdr_t *)pNextLink)->link_word_high
|
- ((byte *)pNextLink)[0x7]
+ ((uw_object_hdr_t *)pNextLink)->link_word_high
|
- *(byte *)(pNextLink + 0x7)
+ ((uw_object_hdr_t *)pNextLink)->link_word_high
)
...>
}


@receiver_10_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNextLink + 0x7)
+ ((uw_object_hdr_t *)pNextLink)->link_word_high
|
- *(undefined1 *)((byte *)pNextLink + 0x7)
+ ((uw_object_hdr_t *)pNextLink)->link_word_high
|
- ((undefined1 *)pNextLink)[0x7]
+ ((uw_object_hdr_t *)pNextLink)->link_word_high
|
- *(undefined1 *)(pNextLink + 0x7)
+ ((uw_object_hdr_t *)pNextLink)->link_word_high
)
...>
}


@receiver_10_w_6_51_address_7@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNextLink + 0x7)
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_high
|
- &*(char *)((byte *)pNextLink + 0x7)
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_high
|
- &((char *)pNextLink)[0x7]
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_high
|
- &*(char *)(pNextLink + 0x7)
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_high
|
- &pNextLink[0x7]
+ (char *)&((uw_object_hdr_t *)pNextLink)->link_word_high
)
...>
}


@receiver_10_w_6_51_store_7@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x7) = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_high = (byte)E;
|
- *(char *)((byte *)pNextLink + 0x7) = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_high = (byte)E;
|
- ((char *)pNextLink)[0x7] = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_high = (byte)E;
|
- *(char *)(pNextLink + 0x7) = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_high = (byte)E;
|
- pNextLink[0x7] = E;
+ ((uw_object_hdr_t *)pNextLink)->link_word_high = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNextLink + 0x7)
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_high
|
- *(char *)((byte *)pNextLink + 0x7)
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_high
|
- ((char *)pNextLink)[0x7]
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_high
|
- *(char *)(pNextLink + 0x7)
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_high
|
- pNextLink[0x7]
+ (char)((uw_object_hdr_t *)pNextLink)->link_word_high
)
...>
}


@receiver_11_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)container + 0x0) = (char)V;
- *(char *)((char *)container + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)container)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)container + 0x0) = (char)V;
- *(byte *)((char *)container + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)container)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)container + 0x0) = (byte)V;
- *(char *)((char *)container + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)container)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)container + 0x0) = (byte)V;
- *(byte *)((char *)container + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)container)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_word_ushort@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags
|
- *(ushort *)((byte *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags
|
- ((ushort *)container)[0x0]
+ ((uw_object_hdr_t *)container)->type_flags
|
- *(ushort *)((ushort *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags
)
...>
}


@receiver_11_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags
|
- *(undefined2 *)((byte *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags
|
- ((undefined2 *)container)[0x0]
+ ((uw_object_hdr_t *)container)->type_flags
|
- *(undefined2 *)((undefined2 *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags
)
...>
}


@receiver_11_w_0_0_word_short@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_signed
|
- *(short *)((byte *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_signed
|
- ((short *)container)[0x0]
+ ((uw_object_hdr_t *)container)->type_flags_signed
|
- *(short *)((short *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_signed
)
...>
}


@receiver_11_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- *(byte *)((byte *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- ((byte *)container)[0x0]
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- *(byte *)((ushort *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- (byte)((ushort *)container)[0x0]
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- *(byte *)container
+ ((uw_object_hdr_t *)container)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- *(undefined1 *)((byte *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- ((undefined1 *)container)[0x0]
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- *(undefined1 *)((ushort *)container + 0x0)
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- (undefined1)((ushort *)container)[0x0]
+ ((uw_object_hdr_t *)container)->type_flags_low
|
- *(undefined1 *)container
+ ((uw_object_hdr_t *)container)->type_flags_low
)
...>
}


@receiver_11_w_0_0_address_0@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)container + 0x0)
+ (char *)&((uw_object_hdr_t *)container)->type_flags_low
|
- &*(char *)((byte *)container + 0x0)
+ (char *)&((uw_object_hdr_t *)container)->type_flags_low
|
- &((char *)container)[0x0]
+ (char *)&((uw_object_hdr_t *)container)->type_flags_low
|
- &*(char *)((ushort *)container + 0x0)
+ (char *)&((uw_object_hdr_t *)container)->type_flags_low
|
- &*(char *)container
+ (char *)&((uw_object_hdr_t *)container)->type_flags_low
)
...>
}


@receiver_11_w_0_0_store_0@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x0) = E;
+ ((uw_object_hdr_t *)container)->type_flags_low = (byte)E;
|
- *(char *)((byte *)container + 0x0) = E;
+ ((uw_object_hdr_t *)container)->type_flags_low = (byte)E;
|
- ((char *)container)[0x0] = E;
+ ((uw_object_hdr_t *)container)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)container + 0x0) = E;
+ ((uw_object_hdr_t *)container)->type_flags_low = (byte)E;
|
- *(char *)container = E;
+ ((uw_object_hdr_t *)container)->type_flags_low = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x0)
+ (char)((uw_object_hdr_t *)container)->type_flags_low
|
- *(char *)((byte *)container + 0x0)
+ (char)((uw_object_hdr_t *)container)->type_flags_low
|
- ((char *)container)[0x0]
+ (char)((uw_object_hdr_t *)container)->type_flags_low
|
- *(char *)((ushort *)container + 0x0)
+ (char)((uw_object_hdr_t *)container)->type_flags_low
|
- (char)((ushort *)container)[0x0]
+ (char)((uw_object_hdr_t *)container)->type_flags_low
|
- *(char *)container
+ (char)((uw_object_hdr_t *)container)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)container + 0x1)
+ ((uw_object_hdr_t *)container)->type_flags_high
|
- *(byte *)((byte *)container + 0x1)
+ ((uw_object_hdr_t *)container)->type_flags_high
|
- ((byte *)container)[0x1]
+ ((uw_object_hdr_t *)container)->type_flags_high
)
...>
}


@receiver_11_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)container + 0x1)
+ ((uw_object_hdr_t *)container)->type_flags_high
|
- *(undefined1 *)((byte *)container + 0x1)
+ ((uw_object_hdr_t *)container)->type_flags_high
|
- ((undefined1 *)container)[0x1]
+ ((uw_object_hdr_t *)container)->type_flags_high
)
...>
}


@receiver_11_w_0_0_address_1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)container + 0x1)
+ (char *)&((uw_object_hdr_t *)container)->type_flags_high
|
- &*(char *)((byte *)container + 0x1)
+ (char *)&((uw_object_hdr_t *)container)->type_flags_high
|
- &((char *)container)[0x1]
+ (char *)&((uw_object_hdr_t *)container)->type_flags_high
)
...>
}


@receiver_11_w_0_0_store_1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x1) = E;
+ ((uw_object_hdr_t *)container)->type_flags_high = (byte)E;
|
- *(char *)((byte *)container + 0x1) = E;
+ ((uw_object_hdr_t *)container)->type_flags_high = (byte)E;
|
- ((char *)container)[0x1] = E;
+ ((uw_object_hdr_t *)container)->type_flags_high = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x1)
+ (char)((uw_object_hdr_t *)container)->type_flags_high
|
- *(char *)((byte *)container + 0x1)
+ (char)((uw_object_hdr_t *)container)->type_flags_high
|
- ((char *)container)[0x1]
+ (char)((uw_object_hdr_t *)container)->type_flags_high
)
...>
}


@receiver_11_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)container + 0x2) = (char)V;
- *(char *)((char *)container + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)container)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)container + 0x2) = (char)V;
- *(byte *)((char *)container + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)container)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)container + 0x2) = (byte)V;
- *(char *)((char *)container + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)container)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)container + 0x2) = (byte)V;
- *(byte *)((char *)container + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)container)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_17_word_ushort@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word
|
- *(ushort *)((byte *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word
|
- ((ushort *)container)[0x1]
+ ((uw_object_hdr_t *)container)->position_word
|
- *(ushort *)((ushort *)container + 0x1)
+ ((uw_object_hdr_t *)container)->position_word
)
...>
}


@receiver_11_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word
|
- *(undefined2 *)((byte *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word
|
- ((undefined2 *)container)[0x1]
+ ((uw_object_hdr_t *)container)->position_word
|
- *(undefined2 *)((undefined2 *)container + 0x1)
+ ((uw_object_hdr_t *)container)->position_word
)
...>
}


@receiver_11_w_2_17_word_short@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word_signed
|
- *(short *)((byte *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word_signed
|
- ((short *)container)[0x1]
+ ((uw_object_hdr_t *)container)->position_word_signed
|
- *(short *)((short *)container + 0x1)
+ ((uw_object_hdr_t *)container)->position_word_signed
)
...>
}


@receiver_11_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word_low
|
- *(byte *)((byte *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word_low
|
- ((byte *)container)[0x2]
+ ((uw_object_hdr_t *)container)->position_word_low
|
- *(byte *)((ushort *)container + 0x1)
+ ((uw_object_hdr_t *)container)->position_word_low
|
- (byte)((ushort *)container)[0x1]
+ ((uw_object_hdr_t *)container)->position_word_low
)
...>
}


@receiver_11_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word_low
|
- *(undefined1 *)((byte *)container + 0x2)
+ ((uw_object_hdr_t *)container)->position_word_low
|
- ((undefined1 *)container)[0x2]
+ ((uw_object_hdr_t *)container)->position_word_low
|
- *(undefined1 *)((ushort *)container + 0x1)
+ ((uw_object_hdr_t *)container)->position_word_low
|
- (undefined1)((ushort *)container)[0x1]
+ ((uw_object_hdr_t *)container)->position_word_low
)
...>
}


@receiver_11_w_2_17_address_2@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)container + 0x2)
+ (char *)&((uw_object_hdr_t *)container)->position_word_low
|
- &*(char *)((byte *)container + 0x2)
+ (char *)&((uw_object_hdr_t *)container)->position_word_low
|
- &((char *)container)[0x2]
+ (char *)&((uw_object_hdr_t *)container)->position_word_low
|
- &*(char *)((ushort *)container + 0x1)
+ (char *)&((uw_object_hdr_t *)container)->position_word_low
)
...>
}


@receiver_11_w_2_17_store_2@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x2) = E;
+ ((uw_object_hdr_t *)container)->position_word_low = (byte)E;
|
- *(char *)((byte *)container + 0x2) = E;
+ ((uw_object_hdr_t *)container)->position_word_low = (byte)E;
|
- ((char *)container)[0x2] = E;
+ ((uw_object_hdr_t *)container)->position_word_low = (byte)E;
|
- *(char *)((ushort *)container + 0x1) = E;
+ ((uw_object_hdr_t *)container)->position_word_low = (byte)E;
)
...>
}


@receiver_11_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x2)
+ (char)((uw_object_hdr_t *)container)->position_word_low
|
- *(char *)((byte *)container + 0x2)
+ (char)((uw_object_hdr_t *)container)->position_word_low
|
- ((char *)container)[0x2]
+ (char)((uw_object_hdr_t *)container)->position_word_low
|
- *(char *)((ushort *)container + 0x1)
+ (char)((uw_object_hdr_t *)container)->position_word_low
|
- (char)((ushort *)container)[0x1]
+ (char)((uw_object_hdr_t *)container)->position_word_low
)
...>
}


@receiver_11_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)container + 0x3)
+ ((uw_object_hdr_t *)container)->position_word_high
|
- *(byte *)((byte *)container + 0x3)
+ ((uw_object_hdr_t *)container)->position_word_high
|
- ((byte *)container)[0x3]
+ ((uw_object_hdr_t *)container)->position_word_high
)
...>
}


@receiver_11_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)container + 0x3)
+ ((uw_object_hdr_t *)container)->position_word_high
|
- *(undefined1 *)((byte *)container + 0x3)
+ ((uw_object_hdr_t *)container)->position_word_high
|
- ((undefined1 *)container)[0x3]
+ ((uw_object_hdr_t *)container)->position_word_high
)
...>
}


@receiver_11_w_2_17_address_3@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)container + 0x3)
+ (char *)&((uw_object_hdr_t *)container)->position_word_high
|
- &*(char *)((byte *)container + 0x3)
+ (char *)&((uw_object_hdr_t *)container)->position_word_high
|
- &((char *)container)[0x3]
+ (char *)&((uw_object_hdr_t *)container)->position_word_high
)
...>
}


@receiver_11_w_2_17_store_3@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x3) = E;
+ ((uw_object_hdr_t *)container)->position_word_high = (byte)E;
|
- *(char *)((byte *)container + 0x3) = E;
+ ((uw_object_hdr_t *)container)->position_word_high = (byte)E;
|
- ((char *)container)[0x3] = E;
+ ((uw_object_hdr_t *)container)->position_word_high = (byte)E;
)
...>
}


@receiver_11_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x3)
+ (char)((uw_object_hdr_t *)container)->position_word_high
|
- *(char *)((byte *)container + 0x3)
+ (char)((uw_object_hdr_t *)container)->position_word_high
|
- ((char *)container)[0x3]
+ (char)((uw_object_hdr_t *)container)->position_word_high
)
...>
}


@receiver_11_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)container + 0x4) = (char)V;
- *(char *)((char *)container + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)container)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)container + 0x4) = (char)V;
- *(byte *)((char *)container + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)container)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)container + 0x4) = (byte)V;
- *(char *)((char *)container + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)container)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)container + 0x4) = (byte)V;
- *(byte *)((char *)container + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)container)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_34_word_ushort@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word
|
- *(ushort *)((byte *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word
|
- ((ushort *)container)[0x2]
+ ((uw_object_hdr_t *)container)->chain_word
|
- *(ushort *)((ushort *)container + 0x2)
+ ((uw_object_hdr_t *)container)->chain_word
)
...>
}


@receiver_11_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word
|
- *(undefined2 *)((byte *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word
|
- ((undefined2 *)container)[0x2]
+ ((uw_object_hdr_t *)container)->chain_word
|
- *(undefined2 *)((undefined2 *)container + 0x2)
+ ((uw_object_hdr_t *)container)->chain_word
)
...>
}


@receiver_11_w_4_34_word_short@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word_signed
|
- *(short *)((byte *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word_signed
|
- ((short *)container)[0x2]
+ ((uw_object_hdr_t *)container)->chain_word_signed
|
- *(short *)((short *)container + 0x2)
+ ((uw_object_hdr_t *)container)->chain_word_signed
)
...>
}


@receiver_11_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word_low
|
- *(byte *)((byte *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word_low
|
- ((byte *)container)[0x4]
+ ((uw_object_hdr_t *)container)->chain_word_low
|
- *(byte *)((ushort *)container + 0x2)
+ ((uw_object_hdr_t *)container)->chain_word_low
|
- (byte)((ushort *)container)[0x2]
+ ((uw_object_hdr_t *)container)->chain_word_low
)
...>
}


@receiver_11_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word_low
|
- *(undefined1 *)((byte *)container + 0x4)
+ ((uw_object_hdr_t *)container)->chain_word_low
|
- ((undefined1 *)container)[0x4]
+ ((uw_object_hdr_t *)container)->chain_word_low
|
- *(undefined1 *)((ushort *)container + 0x2)
+ ((uw_object_hdr_t *)container)->chain_word_low
|
- (undefined1)((ushort *)container)[0x2]
+ ((uw_object_hdr_t *)container)->chain_word_low
)
...>
}


@receiver_11_w_4_34_address_4@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)container + 0x4)
+ (char *)&((uw_object_hdr_t *)container)->chain_word_low
|
- &*(char *)((byte *)container + 0x4)
+ (char *)&((uw_object_hdr_t *)container)->chain_word_low
|
- &((char *)container)[0x4]
+ (char *)&((uw_object_hdr_t *)container)->chain_word_low
|
- &*(char *)((ushort *)container + 0x2)
+ (char *)&((uw_object_hdr_t *)container)->chain_word_low
)
...>
}


@receiver_11_w_4_34_store_4@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x4) = E;
+ ((uw_object_hdr_t *)container)->chain_word_low = (byte)E;
|
- *(char *)((byte *)container + 0x4) = E;
+ ((uw_object_hdr_t *)container)->chain_word_low = (byte)E;
|
- ((char *)container)[0x4] = E;
+ ((uw_object_hdr_t *)container)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)container + 0x2) = E;
+ ((uw_object_hdr_t *)container)->chain_word_low = (byte)E;
)
...>
}


@receiver_11_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x4)
+ (char)((uw_object_hdr_t *)container)->chain_word_low
|
- *(char *)((byte *)container + 0x4)
+ (char)((uw_object_hdr_t *)container)->chain_word_low
|
- ((char *)container)[0x4]
+ (char)((uw_object_hdr_t *)container)->chain_word_low
|
- *(char *)((ushort *)container + 0x2)
+ (char)((uw_object_hdr_t *)container)->chain_word_low
|
- (char)((ushort *)container)[0x2]
+ (char)((uw_object_hdr_t *)container)->chain_word_low
)
...>
}


@receiver_11_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)container + 0x5)
+ ((uw_object_hdr_t *)container)->chain_word_high
|
- *(byte *)((byte *)container + 0x5)
+ ((uw_object_hdr_t *)container)->chain_word_high
|
- ((byte *)container)[0x5]
+ ((uw_object_hdr_t *)container)->chain_word_high
)
...>
}


@receiver_11_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)container + 0x5)
+ ((uw_object_hdr_t *)container)->chain_word_high
|
- *(undefined1 *)((byte *)container + 0x5)
+ ((uw_object_hdr_t *)container)->chain_word_high
|
- ((undefined1 *)container)[0x5]
+ ((uw_object_hdr_t *)container)->chain_word_high
)
...>
}


@receiver_11_w_4_34_address_5@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)container + 0x5)
+ (char *)&((uw_object_hdr_t *)container)->chain_word_high
|
- &*(char *)((byte *)container + 0x5)
+ (char *)&((uw_object_hdr_t *)container)->chain_word_high
|
- &((char *)container)[0x5]
+ (char *)&((uw_object_hdr_t *)container)->chain_word_high
)
...>
}


@receiver_11_w_4_34_store_5@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x5) = E;
+ ((uw_object_hdr_t *)container)->chain_word_high = (byte)E;
|
- *(char *)((byte *)container + 0x5) = E;
+ ((uw_object_hdr_t *)container)->chain_word_high = (byte)E;
|
- ((char *)container)[0x5] = E;
+ ((uw_object_hdr_t *)container)->chain_word_high = (byte)E;
)
...>
}


@receiver_11_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x5)
+ (char)((uw_object_hdr_t *)container)->chain_word_high
|
- *(char *)((byte *)container + 0x5)
+ (char)((uw_object_hdr_t *)container)->chain_word_high
|
- ((char *)container)[0x5]
+ (char)((uw_object_hdr_t *)container)->chain_word_high
)
...>
}


@receiver_11_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)container + 0x6) = (char)V;
- *(char *)((char *)container + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)container)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)container + 0x6) = (char)V;
- *(byte *)((char *)container + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)container)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)container + 0x6) = (byte)V;
- *(char *)((char *)container + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)container)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)container + 0x6) = (byte)V;
- *(byte *)((char *)container + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)container)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_51_word_ushort@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word
|
- *(ushort *)((byte *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word
|
- ((ushort *)container)[0x3]
+ ((uw_object_hdr_t *)container)->link_word
|
- *(ushort *)((ushort *)container + 0x3)
+ ((uw_object_hdr_t *)container)->link_word
)
...>
}


@receiver_11_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word
|
- *(undefined2 *)((byte *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word
|
- ((undefined2 *)container)[0x3]
+ ((uw_object_hdr_t *)container)->link_word
|
- *(undefined2 *)((undefined2 *)container + 0x3)
+ ((uw_object_hdr_t *)container)->link_word
)
...>
}


@receiver_11_w_6_51_word_short@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word_signed
|
- *(short *)((byte *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word_signed
|
- ((short *)container)[0x3]
+ ((uw_object_hdr_t *)container)->link_word_signed
|
- *(short *)((short *)container + 0x3)
+ ((uw_object_hdr_t *)container)->link_word_signed
)
...>
}


@receiver_11_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word_low
|
- *(byte *)((byte *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word_low
|
- ((byte *)container)[0x6]
+ ((uw_object_hdr_t *)container)->link_word_low
|
- *(byte *)((ushort *)container + 0x3)
+ ((uw_object_hdr_t *)container)->link_word_low
|
- (byte)((ushort *)container)[0x3]
+ ((uw_object_hdr_t *)container)->link_word_low
)
...>
}


@receiver_11_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word_low
|
- *(undefined1 *)((byte *)container + 0x6)
+ ((uw_object_hdr_t *)container)->link_word_low
|
- ((undefined1 *)container)[0x6]
+ ((uw_object_hdr_t *)container)->link_word_low
|
- *(undefined1 *)((ushort *)container + 0x3)
+ ((uw_object_hdr_t *)container)->link_word_low
|
- (undefined1)((ushort *)container)[0x3]
+ ((uw_object_hdr_t *)container)->link_word_low
)
...>
}


@receiver_11_w_6_51_address_6@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)container + 0x6)
+ (char *)&((uw_object_hdr_t *)container)->link_word_low
|
- &*(char *)((byte *)container + 0x6)
+ (char *)&((uw_object_hdr_t *)container)->link_word_low
|
- &((char *)container)[0x6]
+ (char *)&((uw_object_hdr_t *)container)->link_word_low
|
- &*(char *)((ushort *)container + 0x3)
+ (char *)&((uw_object_hdr_t *)container)->link_word_low
)
...>
}


@receiver_11_w_6_51_store_6@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x6) = E;
+ ((uw_object_hdr_t *)container)->link_word_low = (byte)E;
|
- *(char *)((byte *)container + 0x6) = E;
+ ((uw_object_hdr_t *)container)->link_word_low = (byte)E;
|
- ((char *)container)[0x6] = E;
+ ((uw_object_hdr_t *)container)->link_word_low = (byte)E;
|
- *(char *)((ushort *)container + 0x3) = E;
+ ((uw_object_hdr_t *)container)->link_word_low = (byte)E;
)
...>
}


@receiver_11_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x6)
+ (char)((uw_object_hdr_t *)container)->link_word_low
|
- *(char *)((byte *)container + 0x6)
+ (char)((uw_object_hdr_t *)container)->link_word_low
|
- ((char *)container)[0x6]
+ (char)((uw_object_hdr_t *)container)->link_word_low
|
- *(char *)((ushort *)container + 0x3)
+ (char)((uw_object_hdr_t *)container)->link_word_low
|
- (char)((ushort *)container)[0x3]
+ (char)((uw_object_hdr_t *)container)->link_word_low
)
...>
}


@receiver_11_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)container + 0x7)
+ ((uw_object_hdr_t *)container)->link_word_high
|
- *(byte *)((byte *)container + 0x7)
+ ((uw_object_hdr_t *)container)->link_word_high
|
- ((byte *)container)[0x7]
+ ((uw_object_hdr_t *)container)->link_word_high
)
...>
}


@receiver_11_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)container + 0x7)
+ ((uw_object_hdr_t *)container)->link_word_high
|
- *(undefined1 *)((byte *)container + 0x7)
+ ((uw_object_hdr_t *)container)->link_word_high
|
- ((undefined1 *)container)[0x7]
+ ((uw_object_hdr_t *)container)->link_word_high
)
...>
}


@receiver_11_w_6_51_address_7@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)container + 0x7)
+ (char *)&((uw_object_hdr_t *)container)->link_word_high
|
- &*(char *)((byte *)container + 0x7)
+ (char *)&((uw_object_hdr_t *)container)->link_word_high
|
- &((char *)container)[0x7]
+ (char *)&((uw_object_hdr_t *)container)->link_word_high
)
...>
}


@receiver_11_w_6_51_store_7@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x7) = E;
+ ((uw_object_hdr_t *)container)->link_word_high = (byte)E;
|
- *(char *)((byte *)container + 0x7) = E;
+ ((uw_object_hdr_t *)container)->link_word_high = (byte)E;
|
- ((char *)container)[0x7] = E;
+ ((uw_object_hdr_t *)container)->link_word_high = (byte)E;
)
...>
}


@receiver_11_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)container + 0x7)
+ (char)((uw_object_hdr_t *)container)->link_word_high
|
- *(char *)((byte *)container + 0x7)
+ (char)((uw_object_hdr_t *)container)->link_word_high
|
- ((char *)container)[0x7]
+ (char)((uw_object_hdr_t *)container)->link_word_high
)
...>
}


@receiver_12_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_0_0_word_ushort@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_0_0_word_short@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_0_0_address_0@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_0_0_store_0@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_0_0_address_1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_0_0_store_1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_2_17_word_ushort@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_2_17_word_short@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_2_17_address_2@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_2_17_store_2@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_2_17_address_3@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_2_17_store_3@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_4_34_word_ushort@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_4_34_word_short@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_4_34_address_4@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_4_34_store_4@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_4_34_address_5@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_4_34_store_5@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@receiver_12_w_6_51_word_ushort@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_6_51_word_short@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_6_51_address_6@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_6_51_store_6@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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
)
...>
}


@receiver_12_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_6_51_address_7@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_6_51_store_7@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_12_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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


@receiver_13_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)rune_object + 0x0) = (char)V;
- *(char *)((char *)rune_object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)rune_object + 0x0) = (char)V;
- *(byte *)((char *)rune_object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)rune_object + 0x0) = (byte)V;
- *(char *)((char *)rune_object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)rune_object + 0x0) = (byte)V;
- *(byte *)((char *)rune_object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_word_ushort@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags
|
- *(ushort *)((byte *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags
|
- ((ushort *)rune_object)[0x0]
+ ((uw_object_hdr_t *)rune_object)->type_flags
|
- *(ushort *)((ushort *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags
)
...>
}


@receiver_13_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags
|
- *(undefined2 *)((byte *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags
|
- ((undefined2 *)rune_object)[0x0]
+ ((uw_object_hdr_t *)rune_object)->type_flags
|
- *(undefined2 *)((undefined2 *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags
)
...>
}


@receiver_13_w_0_0_word_short@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_signed
|
- *(short *)((byte *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_signed
|
- ((short *)rune_object)[0x0]
+ ((uw_object_hdr_t *)rune_object)->type_flags_signed
|
- *(short *)((short *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_signed
)
...>
}


@receiver_13_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(byte *)((byte *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- ((byte *)rune_object)[0x0]
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(byte *)((ushort *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- (byte)((ushort *)rune_object)[0x0]
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(byte *)rune_object
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
)
...>
}


@receiver_13_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(undefined1 *)((byte *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- ((undefined1 *)rune_object)[0x0]
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(undefined1 *)((ushort *)rune_object + 0x0)
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- (undefined1)((ushort *)rune_object)[0x0]
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(undefined1 *)rune_object
+ ((uw_object_hdr_t *)rune_object)->type_flags_low
)
...>
}


@receiver_13_w_0_0_address_0@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)rune_object + 0x0)
+ (char *)&((uw_object_hdr_t *)rune_object)->type_flags_low
|
- &*(char *)((byte *)rune_object + 0x0)
+ (char *)&((uw_object_hdr_t *)rune_object)->type_flags_low
|
- &((char *)rune_object)[0x0]
+ (char *)&((uw_object_hdr_t *)rune_object)->type_flags_low
|
- &*(char *)((ushort *)rune_object + 0x0)
+ (char *)&((uw_object_hdr_t *)rune_object)->type_flags_low
|
- &*(char *)rune_object
+ (char *)&((uw_object_hdr_t *)rune_object)->type_flags_low
)
...>
}


@receiver_13_w_0_0_store_0@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x0) = E;
+ ((uw_object_hdr_t *)rune_object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)rune_object + 0x0) = E;
+ ((uw_object_hdr_t *)rune_object)->type_flags_low = (byte)E;
|
- ((char *)rune_object)[0x0] = E;
+ ((uw_object_hdr_t *)rune_object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)rune_object + 0x0) = E;
+ ((uw_object_hdr_t *)rune_object)->type_flags_low = (byte)E;
|
- *(char *)rune_object = E;
+ ((uw_object_hdr_t *)rune_object)->type_flags_low = (byte)E;
)
...>
}


@receiver_13_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x0)
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(char *)((byte *)rune_object + 0x0)
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_low
|
- ((char *)rune_object)[0x0]
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(char *)((ushort *)rune_object + 0x0)
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_low
|
- (char)((ushort *)rune_object)[0x0]
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_low
|
- *(char *)rune_object
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_low
)
...>
}


@receiver_13_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->type_flags_high
|
- *(byte *)((byte *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->type_flags_high
|
- ((byte *)rune_object)[0x1]
+ ((uw_object_hdr_t *)rune_object)->type_flags_high
)
...>
}


@receiver_13_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->type_flags_high
|
- *(undefined1 *)((byte *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->type_flags_high
|
- ((undefined1 *)rune_object)[0x1]
+ ((uw_object_hdr_t *)rune_object)->type_flags_high
)
...>
}


@receiver_13_w_0_0_address_1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)rune_object + 0x1)
+ (char *)&((uw_object_hdr_t *)rune_object)->type_flags_high
|
- &*(char *)((byte *)rune_object + 0x1)
+ (char *)&((uw_object_hdr_t *)rune_object)->type_flags_high
|
- &((char *)rune_object)[0x1]
+ (char *)&((uw_object_hdr_t *)rune_object)->type_flags_high
)
...>
}


@receiver_13_w_0_0_store_1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x1) = E;
+ ((uw_object_hdr_t *)rune_object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)rune_object + 0x1) = E;
+ ((uw_object_hdr_t *)rune_object)->type_flags_high = (byte)E;
|
- ((char *)rune_object)[0x1] = E;
+ ((uw_object_hdr_t *)rune_object)->type_flags_high = (byte)E;
)
...>
}


@receiver_13_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x1)
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_high
|
- *(char *)((byte *)rune_object + 0x1)
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_high
|
- ((char *)rune_object)[0x1]
+ (char)((uw_object_hdr_t *)rune_object)->type_flags_high
)
...>
}


@receiver_13_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)rune_object + 0x2) = (char)V;
- *(char *)((char *)rune_object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)rune_object + 0x2) = (char)V;
- *(byte *)((char *)rune_object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)rune_object + 0x2) = (byte)V;
- *(char *)((char *)rune_object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)rune_object + 0x2) = (byte)V;
- *(byte *)((char *)rune_object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_word_ushort@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word
|
- *(ushort *)((byte *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word
|
- ((ushort *)rune_object)[0x1]
+ ((uw_object_hdr_t *)rune_object)->position_word
|
- *(ushort *)((ushort *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->position_word
)
...>
}


@receiver_13_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word
|
- *(undefined2 *)((byte *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word
|
- ((undefined2 *)rune_object)[0x1]
+ ((uw_object_hdr_t *)rune_object)->position_word
|
- *(undefined2 *)((undefined2 *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->position_word
)
...>
}


@receiver_13_w_2_17_word_short@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word_signed
|
- *(short *)((byte *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word_signed
|
- ((short *)rune_object)[0x1]
+ ((uw_object_hdr_t *)rune_object)->position_word_signed
|
- *(short *)((short *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->position_word_signed
)
...>
}


@receiver_13_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word_low
|
- *(byte *)((byte *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word_low
|
- ((byte *)rune_object)[0x2]
+ ((uw_object_hdr_t *)rune_object)->position_word_low
|
- *(byte *)((ushort *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->position_word_low
|
- (byte)((ushort *)rune_object)[0x1]
+ ((uw_object_hdr_t *)rune_object)->position_word_low
)
...>
}


@receiver_13_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word_low
|
- *(undefined1 *)((byte *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->position_word_low
|
- ((undefined1 *)rune_object)[0x2]
+ ((uw_object_hdr_t *)rune_object)->position_word_low
|
- *(undefined1 *)((ushort *)rune_object + 0x1)
+ ((uw_object_hdr_t *)rune_object)->position_word_low
|
- (undefined1)((ushort *)rune_object)[0x1]
+ ((uw_object_hdr_t *)rune_object)->position_word_low
)
...>
}


@receiver_13_w_2_17_address_2@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)rune_object + 0x2)
+ (char *)&((uw_object_hdr_t *)rune_object)->position_word_low
|
- &*(char *)((byte *)rune_object + 0x2)
+ (char *)&((uw_object_hdr_t *)rune_object)->position_word_low
|
- &((char *)rune_object)[0x2]
+ (char *)&((uw_object_hdr_t *)rune_object)->position_word_low
|
- &*(char *)((ushort *)rune_object + 0x1)
+ (char *)&((uw_object_hdr_t *)rune_object)->position_word_low
)
...>
}


@receiver_13_w_2_17_store_2@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x2) = E;
+ ((uw_object_hdr_t *)rune_object)->position_word_low = (byte)E;
|
- *(char *)((byte *)rune_object + 0x2) = E;
+ ((uw_object_hdr_t *)rune_object)->position_word_low = (byte)E;
|
- ((char *)rune_object)[0x2] = E;
+ ((uw_object_hdr_t *)rune_object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)rune_object + 0x1) = E;
+ ((uw_object_hdr_t *)rune_object)->position_word_low = (byte)E;
)
...>
}


@receiver_13_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x2)
+ (char)((uw_object_hdr_t *)rune_object)->position_word_low
|
- *(char *)((byte *)rune_object + 0x2)
+ (char)((uw_object_hdr_t *)rune_object)->position_word_low
|
- ((char *)rune_object)[0x2]
+ (char)((uw_object_hdr_t *)rune_object)->position_word_low
|
- *(char *)((ushort *)rune_object + 0x1)
+ (char)((uw_object_hdr_t *)rune_object)->position_word_low
|
- (char)((ushort *)rune_object)[0x1]
+ (char)((uw_object_hdr_t *)rune_object)->position_word_low
)
...>
}


@receiver_13_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->position_word_high
|
- *(byte *)((byte *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->position_word_high
|
- ((byte *)rune_object)[0x3]
+ ((uw_object_hdr_t *)rune_object)->position_word_high
)
...>
}


@receiver_13_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->position_word_high
|
- *(undefined1 *)((byte *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->position_word_high
|
- ((undefined1 *)rune_object)[0x3]
+ ((uw_object_hdr_t *)rune_object)->position_word_high
)
...>
}


@receiver_13_w_2_17_address_3@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)rune_object + 0x3)
+ (char *)&((uw_object_hdr_t *)rune_object)->position_word_high
|
- &*(char *)((byte *)rune_object + 0x3)
+ (char *)&((uw_object_hdr_t *)rune_object)->position_word_high
|
- &((char *)rune_object)[0x3]
+ (char *)&((uw_object_hdr_t *)rune_object)->position_word_high
)
...>
}


@receiver_13_w_2_17_store_3@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x3) = E;
+ ((uw_object_hdr_t *)rune_object)->position_word_high = (byte)E;
|
- *(char *)((byte *)rune_object + 0x3) = E;
+ ((uw_object_hdr_t *)rune_object)->position_word_high = (byte)E;
|
- ((char *)rune_object)[0x3] = E;
+ ((uw_object_hdr_t *)rune_object)->position_word_high = (byte)E;
)
...>
}


@receiver_13_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x3)
+ (char)((uw_object_hdr_t *)rune_object)->position_word_high
|
- *(char *)((byte *)rune_object + 0x3)
+ (char)((uw_object_hdr_t *)rune_object)->position_word_high
|
- ((char *)rune_object)[0x3]
+ (char)((uw_object_hdr_t *)rune_object)->position_word_high
)
...>
}


@receiver_13_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)rune_object + 0x4) = (char)V;
- *(char *)((char *)rune_object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)rune_object + 0x4) = (char)V;
- *(byte *)((char *)rune_object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)rune_object + 0x4) = (byte)V;
- *(char *)((char *)rune_object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)rune_object + 0x4) = (byte)V;
- *(byte *)((char *)rune_object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_word_ushort@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word
|
- *(ushort *)((byte *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word
|
- ((ushort *)rune_object)[0x2]
+ ((uw_object_hdr_t *)rune_object)->chain_word
|
- *(ushort *)((ushort *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->chain_word
)
...>
}


@receiver_13_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word
|
- *(undefined2 *)((byte *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word
|
- ((undefined2 *)rune_object)[0x2]
+ ((uw_object_hdr_t *)rune_object)->chain_word
|
- *(undefined2 *)((undefined2 *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->chain_word
)
...>
}


@receiver_13_w_4_34_word_short@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word_signed
|
- *(short *)((byte *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word_signed
|
- ((short *)rune_object)[0x2]
+ ((uw_object_hdr_t *)rune_object)->chain_word_signed
|
- *(short *)((short *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->chain_word_signed
)
...>
}


@receiver_13_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
|
- *(byte *)((byte *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
|
- ((byte *)rune_object)[0x4]
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
|
- *(byte *)((ushort *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
|
- (byte)((ushort *)rune_object)[0x2]
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
)
...>
}


@receiver_13_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
|
- *(undefined1 *)((byte *)rune_object + 0x4)
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
|
- ((undefined1 *)rune_object)[0x4]
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
|
- *(undefined1 *)((ushort *)rune_object + 0x2)
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
|
- (undefined1)((ushort *)rune_object)[0x2]
+ ((uw_object_hdr_t *)rune_object)->chain_word_low
)
...>
}


@receiver_13_w_4_34_address_4@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)rune_object + 0x4)
+ (char *)&((uw_object_hdr_t *)rune_object)->chain_word_low
|
- &*(char *)((byte *)rune_object + 0x4)
+ (char *)&((uw_object_hdr_t *)rune_object)->chain_word_low
|
- &((char *)rune_object)[0x4]
+ (char *)&((uw_object_hdr_t *)rune_object)->chain_word_low
|
- &*(char *)((ushort *)rune_object + 0x2)
+ (char *)&((uw_object_hdr_t *)rune_object)->chain_word_low
)
...>
}


@receiver_13_w_4_34_store_4@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x4) = E;
+ ((uw_object_hdr_t *)rune_object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)rune_object + 0x4) = E;
+ ((uw_object_hdr_t *)rune_object)->chain_word_low = (byte)E;
|
- ((char *)rune_object)[0x4] = E;
+ ((uw_object_hdr_t *)rune_object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)rune_object + 0x2) = E;
+ ((uw_object_hdr_t *)rune_object)->chain_word_low = (byte)E;
)
...>
}


@receiver_13_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x4)
+ (char)((uw_object_hdr_t *)rune_object)->chain_word_low
|
- *(char *)((byte *)rune_object + 0x4)
+ (char)((uw_object_hdr_t *)rune_object)->chain_word_low
|
- ((char *)rune_object)[0x4]
+ (char)((uw_object_hdr_t *)rune_object)->chain_word_low
|
- *(char *)((ushort *)rune_object + 0x2)
+ (char)((uw_object_hdr_t *)rune_object)->chain_word_low
|
- (char)((ushort *)rune_object)[0x2]
+ (char)((uw_object_hdr_t *)rune_object)->chain_word_low
)
...>
}


@receiver_13_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)rune_object + 0x5)
+ ((uw_object_hdr_t *)rune_object)->chain_word_high
|
- *(byte *)((byte *)rune_object + 0x5)
+ ((uw_object_hdr_t *)rune_object)->chain_word_high
|
- ((byte *)rune_object)[0x5]
+ ((uw_object_hdr_t *)rune_object)->chain_word_high
)
...>
}


@receiver_13_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)rune_object + 0x5)
+ ((uw_object_hdr_t *)rune_object)->chain_word_high
|
- *(undefined1 *)((byte *)rune_object + 0x5)
+ ((uw_object_hdr_t *)rune_object)->chain_word_high
|
- ((undefined1 *)rune_object)[0x5]
+ ((uw_object_hdr_t *)rune_object)->chain_word_high
)
...>
}


@receiver_13_w_4_34_address_5@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)rune_object + 0x5)
+ (char *)&((uw_object_hdr_t *)rune_object)->chain_word_high
|
- &*(char *)((byte *)rune_object + 0x5)
+ (char *)&((uw_object_hdr_t *)rune_object)->chain_word_high
|
- &((char *)rune_object)[0x5]
+ (char *)&((uw_object_hdr_t *)rune_object)->chain_word_high
)
...>
}


@receiver_13_w_4_34_store_5@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x5) = E;
+ ((uw_object_hdr_t *)rune_object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)rune_object + 0x5) = E;
+ ((uw_object_hdr_t *)rune_object)->chain_word_high = (byte)E;
|
- ((char *)rune_object)[0x5] = E;
+ ((uw_object_hdr_t *)rune_object)->chain_word_high = (byte)E;
)
...>
}


@receiver_13_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x5)
+ (char)((uw_object_hdr_t *)rune_object)->chain_word_high
|
- *(char *)((byte *)rune_object + 0x5)
+ (char)((uw_object_hdr_t *)rune_object)->chain_word_high
|
- ((char *)rune_object)[0x5]
+ (char)((uw_object_hdr_t *)rune_object)->chain_word_high
)
...>
}


@receiver_13_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)rune_object + 0x6) = (char)V;
- *(char *)((char *)rune_object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)rune_object + 0x6) = (char)V;
- *(byte *)((char *)rune_object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)rune_object + 0x6) = (byte)V;
- *(char *)((char *)rune_object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)rune_object + 0x6) = (byte)V;
- *(byte *)((char *)rune_object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)rune_object)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_word_ushort@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word
|
- *(ushort *)((byte *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word
|
- ((ushort *)rune_object)[0x3]
+ ((uw_object_hdr_t *)rune_object)->link_word
|
- *(ushort *)((ushort *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->link_word
)
...>
}


@receiver_13_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word
|
- *(undefined2 *)((byte *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word
|
- ((undefined2 *)rune_object)[0x3]
+ ((uw_object_hdr_t *)rune_object)->link_word
|
- *(undefined2 *)((undefined2 *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->link_word
)
...>
}


@receiver_13_w_6_51_word_short@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word_signed
|
- *(short *)((byte *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word_signed
|
- ((short *)rune_object)[0x3]
+ ((uw_object_hdr_t *)rune_object)->link_word_signed
|
- *(short *)((short *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->link_word_signed
)
...>
}


@receiver_13_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word_low
|
- *(byte *)((byte *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word_low
|
- ((byte *)rune_object)[0x6]
+ ((uw_object_hdr_t *)rune_object)->link_word_low
|
- *(byte *)((ushort *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->link_word_low
|
- (byte)((ushort *)rune_object)[0x3]
+ ((uw_object_hdr_t *)rune_object)->link_word_low
)
...>
}


@receiver_13_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word_low
|
- *(undefined1 *)((byte *)rune_object + 0x6)
+ ((uw_object_hdr_t *)rune_object)->link_word_low
|
- ((undefined1 *)rune_object)[0x6]
+ ((uw_object_hdr_t *)rune_object)->link_word_low
|
- *(undefined1 *)((ushort *)rune_object + 0x3)
+ ((uw_object_hdr_t *)rune_object)->link_word_low
|
- (undefined1)((ushort *)rune_object)[0x3]
+ ((uw_object_hdr_t *)rune_object)->link_word_low
)
...>
}


@receiver_13_w_6_51_address_6@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)rune_object + 0x6)
+ (char *)&((uw_object_hdr_t *)rune_object)->link_word_low
|
- &*(char *)((byte *)rune_object + 0x6)
+ (char *)&((uw_object_hdr_t *)rune_object)->link_word_low
|
- &((char *)rune_object)[0x6]
+ (char *)&((uw_object_hdr_t *)rune_object)->link_word_low
|
- &*(char *)((ushort *)rune_object + 0x3)
+ (char *)&((uw_object_hdr_t *)rune_object)->link_word_low
)
...>
}


@receiver_13_w_6_51_store_6@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x6) = E;
+ ((uw_object_hdr_t *)rune_object)->link_word_low = (byte)E;
|
- *(char *)((byte *)rune_object + 0x6) = E;
+ ((uw_object_hdr_t *)rune_object)->link_word_low = (byte)E;
|
- ((char *)rune_object)[0x6] = E;
+ ((uw_object_hdr_t *)rune_object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)rune_object + 0x3) = E;
+ ((uw_object_hdr_t *)rune_object)->link_word_low = (byte)E;
)
...>
}


@receiver_13_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x6)
+ (char)((uw_object_hdr_t *)rune_object)->link_word_low
|
- *(char *)((byte *)rune_object + 0x6)
+ (char)((uw_object_hdr_t *)rune_object)->link_word_low
|
- ((char *)rune_object)[0x6]
+ (char)((uw_object_hdr_t *)rune_object)->link_word_low
|
- *(char *)((ushort *)rune_object + 0x3)
+ (char)((uw_object_hdr_t *)rune_object)->link_word_low
|
- (char)((ushort *)rune_object)[0x3]
+ (char)((uw_object_hdr_t *)rune_object)->link_word_low
)
...>
}


@receiver_13_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)rune_object + 0x7)
+ ((uw_object_hdr_t *)rune_object)->link_word_high
|
- *(byte *)((byte *)rune_object + 0x7)
+ ((uw_object_hdr_t *)rune_object)->link_word_high
|
- ((byte *)rune_object)[0x7]
+ ((uw_object_hdr_t *)rune_object)->link_word_high
)
...>
}


@receiver_13_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)rune_object + 0x7)
+ ((uw_object_hdr_t *)rune_object)->link_word_high
|
- *(undefined1 *)((byte *)rune_object + 0x7)
+ ((uw_object_hdr_t *)rune_object)->link_word_high
|
- ((undefined1 *)rune_object)[0x7]
+ ((uw_object_hdr_t *)rune_object)->link_word_high
)
...>
}


@receiver_13_w_6_51_address_7@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)rune_object + 0x7)
+ (char *)&((uw_object_hdr_t *)rune_object)->link_word_high
|
- &*(char *)((byte *)rune_object + 0x7)
+ (char *)&((uw_object_hdr_t *)rune_object)->link_word_high
|
- &((char *)rune_object)[0x7]
+ (char *)&((uw_object_hdr_t *)rune_object)->link_word_high
)
...>
}


@receiver_13_w_6_51_store_7@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x7) = E;
+ ((uw_object_hdr_t *)rune_object)->link_word_high = (byte)E;
|
- *(char *)((byte *)rune_object + 0x7) = E;
+ ((uw_object_hdr_t *)rune_object)->link_word_high = (byte)E;
|
- ((char *)rune_object)[0x7] = E;
+ ((uw_object_hdr_t *)rune_object)->link_word_high = (byte)E;
)
...>
}


@receiver_13_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)rune_object + 0x7)
+ (char)((uw_object_hdr_t *)rune_object)->link_word_high
|
- *(char *)((byte *)rune_object + 0x7)
+ (char)((uw_object_hdr_t *)rune_object)->link_word_high
|
- ((char *)rune_object)[0x7]
+ (char)((uw_object_hdr_t *)rune_object)->link_word_high
)
...>
}
