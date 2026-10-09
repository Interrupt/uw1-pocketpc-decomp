@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_bytes + 0x0) = (char)V;
- *(char *)((char *)npc_bytes + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_bytes + 0x0) = (char)V;
- *(byte *)((char *)npc_bytes + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_bytes + 0x0) = (byte)V;
- *(char *)((char *)npc_bytes + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_bytes + 0x0) = (byte)V;
- *(byte *)((char *)npc_bytes + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- *(ushort *)((byte *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- ((ushort *)npc_bytes)[0x0]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- *(ushort *)((ushort *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- *(ushort *)(npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
)
...>
}


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- *(undefined2 *)((byte *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- ((undefined2 *)npc_bytes)[0x0]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- *(undefined2 *)((undefined2 *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- *(undefined2 *)(npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_signed
|
- *(short *)((byte *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_signed
|
- ((short *)npc_bytes)[0x0]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_signed
|
- *(short *)((short *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_signed
|
- *(short *)(npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(byte *)((byte *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- ((byte *)npc_bytes)[0x0]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(byte *)((ushort *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- (byte)((ushort *)npc_bytes)[0x0]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(byte *)npc_bytes
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(byte *)(npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(undefined1 *)((byte *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- ((undefined1 *)npc_bytes)[0x0]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(undefined1 *)((ushort *)npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- (undefined1)((ushort *)npc_bytes)[0x0]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(undefined1 *)npc_bytes
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(undefined1 *)(npc_bytes + 0x0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low
)
...>
}


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- &*(char *)((byte *)npc_bytes + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- &((char *)npc_bytes)[0x0]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- &*(char *)((ushort *)npc_bytes + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- &*(char *)npc_bytes
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- &*(char *)(npc_bytes + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- &npc_bytes[0x0]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- &*npc_bytes
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x0) = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low = (byte)E;
|
- *(char *)((byte *)npc_bytes + 0x0) = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low = (byte)E;
|
- ((char *)npc_bytes)[0x0] = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)npc_bytes + 0x0) = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low = (byte)E;
|
- *(char *)npc_bytes = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low = (byte)E;
|
- *(char *)(npc_bytes + 0x0) = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low = (byte)E;
|
- npc_bytes[0x0] = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low = (byte)E;
|
- *npc_bytes = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x0)
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(char *)((byte *)npc_bytes + 0x0)
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- ((char *)npc_bytes)[0x0]
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(char *)((ushort *)npc_bytes + 0x0)
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- (char)((ushort *)npc_bytes)[0x0]
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(char *)npc_bytes
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *(char *)(npc_bytes + 0x0)
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- npc_bytes[0x0]
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
|
- *npc_bytes
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- *(byte *)((byte *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- ((byte *)npc_bytes)[0x1]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- *(byte *)(npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- *(undefined1 *)((byte *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- ((undefined1 *)npc_bytes)[0x1]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- *(undefined1 *)(npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high
)
...>
}


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- &*(char *)((byte *)npc_bytes + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- &((char *)npc_bytes)[0x1]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- &*(char *)(npc_bytes + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- &npc_bytes[0x1]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x1) = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high = (byte)E;
|
- *(char *)((byte *)npc_bytes + 0x1) = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high = (byte)E;
|
- ((char *)npc_bytes)[0x1] = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high = (byte)E;
|
- *(char *)(npc_bytes + 0x1) = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high = (byte)E;
|
- npc_bytes[0x1] = E;
+ ((uw_object_hdr_t *)npc_bytes)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x1)
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- *(char *)((byte *)npc_bytes + 0x1)
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- ((char *)npc_bytes)[0x1]
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- *(char *)(npc_bytes + 0x1)
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_high
|
- npc_bytes[0x1]
+ (char)((uw_object_hdr_t *)npc_bytes)->type_flags_high
)
...>
}


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_bytes + 0x2) = (char)V;
- *(char *)((char *)npc_bytes + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_bytes + 0x2) = (char)V;
- *(byte *)((char *)npc_bytes + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_bytes + 0x2) = (byte)V;
- *(char *)((char *)npc_bytes + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_bytes + 0x2) = (byte)V;
- *(byte *)((char *)npc_bytes + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- *(ushort *)((byte *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- ((ushort *)npc_bytes)[0x1]
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- *(ushort *)((ushort *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- *(ushort *)(npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
)
...>
}


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- *(undefined2 *)((byte *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- ((undefined2 *)npc_bytes)[0x1]
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- *(undefined2 *)((undefined2 *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- *(undefined2 *)(npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
)
...>
}


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_signed
|
- *(short *)((byte *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_signed
|
- ((short *)npc_bytes)[0x1]
+ ((uw_object_hdr_t *)npc_bytes)->position_word_signed
|
- *(short *)((short *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_signed
|
- *(short *)(npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_signed
)
...>
}


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(byte *)((byte *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- ((byte *)npc_bytes)[0x2]
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(byte *)((ushort *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- (byte)((ushort *)npc_bytes)[0x1]
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(byte *)(npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(undefined1 *)((byte *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- ((undefined1 *)npc_bytes)[0x2]
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(undefined1 *)((ushort *)npc_bytes + 0x1)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- (undefined1)((ushort *)npc_bytes)[0x1]
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(undefined1 *)(npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low
)
...>
}


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- &*(char *)((byte *)npc_bytes + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- &((char *)npc_bytes)[0x2]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- &*(char *)((ushort *)npc_bytes + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- &*(char *)(npc_bytes + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- &npc_bytes[0x2]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_low
)
...>
}


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x2) = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low = (byte)E;
|
- *(char *)((byte *)npc_bytes + 0x2) = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low = (byte)E;
|
- ((char *)npc_bytes)[0x2] = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low = (byte)E;
|
- *(char *)((ushort *)npc_bytes + 0x1) = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low = (byte)E;
|
- *(char *)(npc_bytes + 0x2) = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low = (byte)E;
|
- npc_bytes[0x2] = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x2)
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(char *)((byte *)npc_bytes + 0x2)
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- ((char *)npc_bytes)[0x2]
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(char *)((ushort *)npc_bytes + 0x1)
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- (char)((ushort *)npc_bytes)[0x1]
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- *(char *)(npc_bytes + 0x2)
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_low
|
- npc_bytes[0x2]
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- *(byte *)((byte *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- ((byte *)npc_bytes)[0x3]
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- *(byte *)(npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high
)
...>
}


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- *(undefined1 *)((byte *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- ((undefined1 *)npc_bytes)[0x3]
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- *(undefined1 *)(npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high
)
...>
}


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- &*(char *)((byte *)npc_bytes + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- &((char *)npc_bytes)[0x3]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- &*(char *)(npc_bytes + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- &npc_bytes[0x3]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->position_word_high
)
...>
}


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x3) = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high = (byte)E;
|
- *(char *)((byte *)npc_bytes + 0x3) = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high = (byte)E;
|
- ((char *)npc_bytes)[0x3] = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high = (byte)E;
|
- *(char *)(npc_bytes + 0x3) = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high = (byte)E;
|
- npc_bytes[0x3] = E;
+ ((uw_object_hdr_t *)npc_bytes)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x3)
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- *(char *)((byte *)npc_bytes + 0x3)
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- ((char *)npc_bytes)[0x3]
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- *(char *)(npc_bytes + 0x3)
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_high
|
- npc_bytes[0x3]
+ (char)((uw_object_hdr_t *)npc_bytes)->position_word_high
)
...>
}


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_bytes + 0x4) = (char)V;
- *(char *)((char *)npc_bytes + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_bytes + 0x4) = (char)V;
- *(byte *)((char *)npc_bytes + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_bytes + 0x4) = (byte)V;
- *(char *)((char *)npc_bytes + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_bytes + 0x4) = (byte)V;
- *(byte *)((char *)npc_bytes + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- *(ushort *)((byte *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- ((ushort *)npc_bytes)[0x2]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- *(ushort *)((ushort *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- *(ushort *)(npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
)
...>
}


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- *(undefined2 *)((byte *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- ((undefined2 *)npc_bytes)[0x2]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- *(undefined2 *)((undefined2 *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- *(undefined2 *)(npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
)
...>
}


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_signed
|
- *(short *)((byte *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_signed
|
- ((short *)npc_bytes)[0x2]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_signed
|
- *(short *)((short *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_signed
|
- *(short *)(npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_signed
)
...>
}


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(byte *)((byte *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- ((byte *)npc_bytes)[0x4]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(byte *)((ushort *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- (byte)((ushort *)npc_bytes)[0x2]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(byte *)(npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(undefined1 *)((byte *)npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- ((undefined1 *)npc_bytes)[0x4]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(undefined1 *)((ushort *)npc_bytes + 0x2)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- (undefined1)((ushort *)npc_bytes)[0x2]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(undefined1 *)(npc_bytes + 0x4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low
)
...>
}


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- &*(char *)((byte *)npc_bytes + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- &((char *)npc_bytes)[0x4]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- &*(char *)((ushort *)npc_bytes + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- &*(char *)(npc_bytes + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- &npc_bytes[0x4]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_low
)
...>
}


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x4) = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low = (byte)E;
|
- *(char *)((byte *)npc_bytes + 0x4) = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low = (byte)E;
|
- ((char *)npc_bytes)[0x4] = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)npc_bytes + 0x2) = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low = (byte)E;
|
- *(char *)(npc_bytes + 0x4) = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low = (byte)E;
|
- npc_bytes[0x4] = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x4)
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(char *)((byte *)npc_bytes + 0x4)
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- ((char *)npc_bytes)[0x4]
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(char *)((ushort *)npc_bytes + 0x2)
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- (char)((ushort *)npc_bytes)[0x2]
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- *(char *)(npc_bytes + 0x4)
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_low
|
- npc_bytes[0x4]
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0x5)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- *(byte *)((byte *)npc_bytes + 0x5)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- ((byte *)npc_bytes)[0x5]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- *(byte *)(npc_bytes + 0x5)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high
)
...>
}


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0x5)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- *(undefined1 *)((byte *)npc_bytes + 0x5)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- ((undefined1 *)npc_bytes)[0x5]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- *(undefined1 *)(npc_bytes + 0x5)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high
)
...>
}


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- &*(char *)((byte *)npc_bytes + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- &((char *)npc_bytes)[0x5]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- &*(char *)(npc_bytes + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- &npc_bytes[0x5]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->chain_word_high
)
...>
}


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x5) = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high = (byte)E;
|
- *(char *)((byte *)npc_bytes + 0x5) = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high = (byte)E;
|
- ((char *)npc_bytes)[0x5] = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high = (byte)E;
|
- *(char *)(npc_bytes + 0x5) = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high = (byte)E;
|
- npc_bytes[0x5] = E;
+ ((uw_object_hdr_t *)npc_bytes)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x5)
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- *(char *)((byte *)npc_bytes + 0x5)
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- ((char *)npc_bytes)[0x5]
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- *(char *)(npc_bytes + 0x5)
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_high
|
- npc_bytes[0x5]
+ (char)((uw_object_hdr_t *)npc_bytes)->chain_word_high
)
...>
}


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_bytes + 0x6) = (char)V;
- *(char *)((char *)npc_bytes + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_bytes + 0x6) = (char)V;
- *(byte *)((char *)npc_bytes + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_bytes + 0x6) = (byte)V;
- *(char *)((char *)npc_bytes + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_bytes + 0x6) = (byte)V;
- *(byte *)((char *)npc_bytes + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_bytes)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- *(ushort *)((byte *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- ((ushort *)npc_bytes)[0x3]
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- *(ushort *)((ushort *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- *(ushort *)(npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
)
...>
}


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- *(undefined2 *)((byte *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- ((undefined2 *)npc_bytes)[0x3]
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- *(undefined2 *)((undefined2 *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- *(undefined2 *)(npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
)
...>
}


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_signed
|
- *(short *)((byte *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_signed
|
- ((short *)npc_bytes)[0x3]
+ ((uw_object_hdr_t *)npc_bytes)->link_word_signed
|
- *(short *)((short *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_signed
|
- *(short *)(npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_signed
)
...>
}


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(byte *)((byte *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- ((byte *)npc_bytes)[0x6]
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(byte *)((ushort *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- (byte)((ushort *)npc_bytes)[0x3]
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(byte *)(npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(undefined1 *)((byte *)npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- ((undefined1 *)npc_bytes)[0x6]
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(undefined1 *)((ushort *)npc_bytes + 0x3)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- (undefined1)((ushort *)npc_bytes)[0x3]
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(undefined1 *)(npc_bytes + 0x6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low
)
...>
}


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- &*(char *)((byte *)npc_bytes + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- &((char *)npc_bytes)[0x6]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- &*(char *)((ushort *)npc_bytes + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- &*(char *)(npc_bytes + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- &npc_bytes[0x6]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_low
)
...>
}


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x6) = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low = (byte)E;
|
- *(char *)((byte *)npc_bytes + 0x6) = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low = (byte)E;
|
- ((char *)npc_bytes)[0x6] = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low = (byte)E;
|
- *(char *)((ushort *)npc_bytes + 0x3) = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low = (byte)E;
|
- *(char *)(npc_bytes + 0x6) = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low = (byte)E;
|
- npc_bytes[0x6] = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x6)
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(char *)((byte *)npc_bytes + 0x6)
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- ((char *)npc_bytes)[0x6]
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(char *)((ushort *)npc_bytes + 0x3)
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- (char)((ushort *)npc_bytes)[0x3]
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- *(char *)(npc_bytes + 0x6)
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_low
|
- npc_bytes[0x6]
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0x7)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- *(byte *)((byte *)npc_bytes + 0x7)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- ((byte *)npc_bytes)[0x7]
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- *(byte *)(npc_bytes + 0x7)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high
)
...>
}


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0x7)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- *(undefined1 *)((byte *)npc_bytes + 0x7)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- ((undefined1 *)npc_bytes)[0x7]
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- *(undefined1 *)(npc_bytes + 0x7)
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high
)
...>
}


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- &*(char *)((byte *)npc_bytes + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- &((char *)npc_bytes)[0x7]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- &*(char *)(npc_bytes + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- &npc_bytes[0x7]
+ (char *)&((uw_object_hdr_t *)npc_bytes)->link_word_high
)
...>
}


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x7) = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high = (byte)E;
|
- *(char *)((byte *)npc_bytes + 0x7) = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high = (byte)E;
|
- ((char *)npc_bytes)[0x7] = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high = (byte)E;
|
- *(char *)(npc_bytes + 0x7) = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high = (byte)E;
|
- npc_bytes[0x7] = E;
+ ((uw_object_hdr_t *)npc_bytes)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0x7)
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- *(char *)((byte *)npc_bytes + 0x7)
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- ((char *)npc_bytes)[0x7]
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- *(char *)(npc_bytes + 0x7)
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_high
|
- npc_bytes[0x7]
+ (char)((uw_object_hdr_t *)npc_bytes)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x0) = (char)V;
- *(char *)((char *)puVar11 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x0) = (char)V;
- *(byte *)((char *)puVar11 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x0) = (byte)V;
- *(char *)((char *)puVar11 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x0) = (byte)V;
- *(byte *)((char *)puVar11 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(ushort *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- ((ushort *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(ushort *)((ushort *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(ushort *)(puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- puVar11[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *puVar11
+ ((uw_object_hdr_t *)puVar11)->type_flags
)
...>
}


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(undefined2 *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- ((undefined2 *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(undefined2 *)(puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- puVar11[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *puVar11
+ ((uw_object_hdr_t *)puVar11)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
|
- *(short *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
|
- ((short *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
|
- *(short *)((short *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
|
- *(short *)(puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(byte *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- ((byte *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(byte *)((ushort *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (byte)((ushort *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(byte *)puVar11
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(byte *)(puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (byte)puVar11[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(undefined1 *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- ((undefined1 *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (undefined1)((ushort *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(undefined1 *)puVar11
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(undefined1 *)(puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (undefined1)puVar11[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
)
...>
}


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_low
|
- &*(char *)((byte *)puVar11 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_low
|
- &((char *)puVar11)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_low
|
- &*(char *)((ushort *)puVar11 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_low
|
- &*(char *)puVar11
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_low
|
- &*(char *)(puVar11 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- ((char *)puVar11)[0x0] = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- *(char *)puVar11 = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- *(char *)(puVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x0)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(char *)((byte *)puVar11 + 0x0)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- ((char *)puVar11)[0x0]
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(char *)((ushort *)puVar11 + 0x0)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (char)((ushort *)puVar11)[0x0]
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(char *)puVar11
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(char *)(puVar11 + 0x0)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (char)puVar11[0x0]
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
|
- *(byte *)((byte *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
|
- ((byte *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
|
- *(undefined1 *)((byte *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
|
- ((undefined1 *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
)
...>
}


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_high
|
- &*(char *)((byte *)puVar11 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_high
|
- &((char *)puVar11)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar11)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_high = (byte)E;
|
- ((char *)puVar11)[0x1] = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x1)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_high
|
- *(char *)((byte *)puVar11 + 0x1)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_high
|
- ((char *)puVar11)[0x1]
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_high
)
...>
}


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x2) = (char)V;
- *(char *)((char *)puVar11 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x2) = (char)V;
- *(byte *)((char *)puVar11 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x2) = (byte)V;
- *(char *)((char *)puVar11 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x2) = (byte)V;
- *(byte *)((char *)puVar11 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- *(ushort *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- ((ushort *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- *(ushort *)((ushort *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- *(ushort *)(puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- puVar11[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word
)
...>
}


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- *(undefined2 *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- ((undefined2 *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- *(undefined2 *)((undefined2 *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- *(undefined2 *)(puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- puVar11[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word
)
...>
}


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
|
- *(short *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
|
- ((short *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
|
- *(short *)((short *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
|
- *(short *)(puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
)
...>
}


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(byte *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- ((byte *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(byte *)((ushort *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- (byte)((ushort *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(byte *)(puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- (byte)puVar11[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(undefined1 *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- ((undefined1 *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(undefined1 *)((ushort *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- (undefined1)((ushort *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(undefined1 *)(puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- (undefined1)puVar11[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
)
...>
}


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar11)->position_word_low
|
- &*(char *)((byte *)puVar11 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar11)->position_word_low
|
- &((char *)puVar11)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar11)->position_word_low
|
- &*(char *)((ushort *)puVar11 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar11)->position_word_low
|
- &*(char *)(puVar11 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar11)->position_word_low
)
...>
}


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
|
- ((char *)puVar11)[0x2] = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
|
- *(char *)(puVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x2)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(char *)((byte *)puVar11 + 0x2)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- ((char *)puVar11)[0x2]
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(char *)((ushort *)puVar11 + 0x1)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- (char)((ushort *)puVar11)[0x1]
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(char *)(puVar11 + 0x1)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- (char)puVar11[0x1]
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->position_word_high
|
- *(byte *)((byte *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->position_word_high
|
- ((byte *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->position_word_high
)
...>
}


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->position_word_high
|
- *(undefined1 *)((byte *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->position_word_high
|
- ((undefined1 *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->position_word_high
)
...>
}


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar11)->position_word_high
|
- &*(char *)((byte *)puVar11 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar11)->position_word_high
|
- &((char *)puVar11)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar11)->position_word_high
)
...>
}


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_high = (byte)E;
|
- ((char *)puVar11)[0x3] = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x3)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_high
|
- *(char *)((byte *)puVar11 + 0x3)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_high
|
- ((char *)puVar11)[0x3]
+ (char)((uw_object_hdr_t *)puVar11)->position_word_high
)
...>
}


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x4) = (char)V;
- *(char *)((char *)puVar11 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x4) = (char)V;
- *(byte *)((char *)puVar11 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x4) = (byte)V;
- *(char *)((char *)puVar11 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x4) = (byte)V;
- *(byte *)((char *)puVar11 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- *(ushort *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- ((ushort *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- *(ushort *)((ushort *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- *(ushort *)(puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- puVar11[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word
)
...>
}


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- *(undefined2 *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- ((undefined2 *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- *(undefined2 *)(puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- puVar11[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word
)
...>
}


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
|
- *(short *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
|
- ((short *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
|
- *(short *)((short *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
|
- *(short *)(puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
)
...>
}


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(byte *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- ((byte *)puVar11)[0x4]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(byte *)((ushort *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (byte)((ushort *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(byte *)(puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (byte)puVar11[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(undefined1 *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- ((undefined1 *)puVar11)[0x4]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (undefined1)((ushort *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(undefined1 *)(puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (undefined1)puVar11[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
)
...>
}


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar11)->chain_word_low
|
- &*(char *)((byte *)puVar11 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar11)->chain_word_low
|
- &((char *)puVar11)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar11)->chain_word_low
|
- &*(char *)((ushort *)puVar11 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar11)->chain_word_low
|
- &*(char *)(puVar11 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar11)->chain_word_low
)
...>
}


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
|
- ((char *)puVar11)[0x4] = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
|
- *(char *)(puVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x4)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(char *)((byte *)puVar11 + 0x4)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- ((char *)puVar11)[0x4]
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(char *)((ushort *)puVar11 + 0x2)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (char)((ushort *)puVar11)[0x2]
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(char *)(puVar11 + 0x2)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (char)puVar11[0x2]
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x5)
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
|
- *(byte *)((byte *)puVar11 + 0x5)
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
|
- ((byte *)puVar11)[0x5]
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
)
...>
}


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x5)
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
|
- *(undefined1 *)((byte *)puVar11 + 0x5)
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
|
- ((undefined1 *)puVar11)[0x5]
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
)
...>
}


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar11)->chain_word_high
|
- &*(char *)((byte *)puVar11 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar11)->chain_word_high
|
- &((char *)puVar11)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar11)->chain_word_high
)
...>
}


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_high = (byte)E;
|
- ((char *)puVar11)[0x5] = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x5)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_high
|
- *(char *)((byte *)puVar11 + 0x5)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_high
|
- ((char *)puVar11)[0x5]
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_high
)
...>
}


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x6) = (char)V;
- *(char *)((char *)puVar11 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x6) = (char)V;
- *(byte *)((char *)puVar11 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x6) = (byte)V;
- *(char *)((char *)puVar11 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x6) = (byte)V;
- *(byte *)((char *)puVar11 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- *(ushort *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- ((ushort *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- *(ushort *)((ushort *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- *(ushort *)(puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- puVar11[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word
)
...>
}


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- *(undefined2 *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- ((undefined2 *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- *(undefined2 *)((undefined2 *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- *(undefined2 *)(puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- puVar11[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word
)
...>
}


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
|
- *(short *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
|
- ((short *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
|
- *(short *)((short *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
|
- *(short *)(puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
)
...>
}


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(byte *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- ((byte *)puVar11)[0x6]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(byte *)((ushort *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- (byte)((ushort *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(byte *)(puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- (byte)puVar11[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(undefined1 *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- ((undefined1 *)puVar11)[0x6]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(undefined1 *)((ushort *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- (undefined1)((ushort *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(undefined1 *)(puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- (undefined1)puVar11[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
)
...>
}


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar11)->link_word_low
|
- &*(char *)((byte *)puVar11 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar11)->link_word_low
|
- &((char *)puVar11)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar11)->link_word_low
|
- &*(char *)((ushort *)puVar11 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar11)->link_word_low
|
- &*(char *)(puVar11 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar11)->link_word_low
)
...>
}


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
|
- ((char *)puVar11)[0x6] = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
|
- *(char *)(puVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x6)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(char *)((byte *)puVar11 + 0x6)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- ((char *)puVar11)[0x6]
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(char *)((ushort *)puVar11 + 0x3)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- (char)((ushort *)puVar11)[0x3]
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(char *)(puVar11 + 0x3)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- (char)puVar11[0x3]
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x7)
+ ((uw_object_hdr_t *)puVar11)->link_word_high
|
- *(byte *)((byte *)puVar11 + 0x7)
+ ((uw_object_hdr_t *)puVar11)->link_word_high
|
- ((byte *)puVar11)[0x7]
+ ((uw_object_hdr_t *)puVar11)->link_word_high
)
...>
}


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x7)
+ ((uw_object_hdr_t *)puVar11)->link_word_high
|
- *(undefined1 *)((byte *)puVar11 + 0x7)
+ ((uw_object_hdr_t *)puVar11)->link_word_high
|
- ((undefined1 *)puVar11)[0x7]
+ ((uw_object_hdr_t *)puVar11)->link_word_high
)
...>
}


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar11)->link_word_high
|
- &*(char *)((byte *)puVar11 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar11)->link_word_high
|
- &((char *)puVar11)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar11)->link_word_high
)
...>
}


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_high = (byte)E;
|
- ((char *)puVar11)[0x7] = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x7)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_high
|
- *(char *)((byte *)puVar11 + 0x7)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_high
|
- ((char *)puVar11)[0x7]
+ (char)((uw_object_hdr_t *)puVar11)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x0) = (char)V;
- *(char *)((char *)player_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x0) = (char)V;
- *(byte *)((char *)player_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x0) = (byte)V;
- *(char *)((char *)player_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x0) = (byte)V;
- *(byte *)((char *)player_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(ushort *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- ((ushort *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(ushort *)((ushort *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(ushort *)(player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
)
...>
}


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(undefined2 *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- ((undefined2 *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(undefined2 *)((undefined2 *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(undefined2 *)(player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
|
- *(short *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
|
- ((short *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
|
- *(short *)((short *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
|
- *(short *)(player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(byte *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- ((byte *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(byte *)((ushort *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- (byte)((ushort *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(byte *)player_rec
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(byte *)(player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(undefined1 *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- ((undefined1 *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(undefined1 *)((ushort *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- (undefined1)((ushort *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(undefined1 *)player_rec
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(undefined1 *)(player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
)
...>
}


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_low
|
- &*(char *)((byte *)player_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_low
|
- &((char *)player_rec)[0x0]
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_low
|
- &*(char *)((ushort *)player_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_low
|
- &*(char *)player_rec
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_low
|
- &*(char *)(player_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_low
|
- &player_rec[0x0]
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_low
|
- &*player_rec
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x0) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x0) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- ((char *)player_rec)[0x0] = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0x0) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- *(char *)player_rec = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- *(char *)(player_rec + 0x0) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- player_rec[0x0] = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- *player_rec = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x0)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(char *)((byte *)player_rec + 0x0)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- ((char *)player_rec)[0x0]
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(char *)((ushort *)player_rec + 0x0)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- (char)((ushort *)player_rec)[0x0]
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(char *)player_rec
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(char *)(player_rec + 0x0)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- player_rec[0x0]
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *player_rec
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(byte *)((byte *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- ((byte *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(byte *)(player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
)
...>
}


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(undefined1 *)((byte *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- ((undefined1 *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(undefined1 *)(player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
)
...>
}


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_high
|
- &*(char *)((byte *)player_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_high
|
- &((char *)player_rec)[0x1]
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_high
|
- &*(char *)(player_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_high
|
- &player_rec[0x1]
+ (char *)&((uw_object_hdr_t *)player_rec)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x1) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x1) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_high = (byte)E;
|
- ((char *)player_rec)[0x1] = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_high = (byte)E;
|
- *(char *)(player_rec + 0x1) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_high = (byte)E;
|
- player_rec[0x1] = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_high = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x1)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(char *)((byte *)player_rec + 0x1)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_high
|
- ((char *)player_rec)[0x1]
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(char *)(player_rec + 0x1)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_high
|
- player_rec[0x1]
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_high
)
...>
}


@receiver_2_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x2) = (char)V;
- *(char *)((char *)player_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x2) = (char)V;
- *(byte *)((char *)player_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x2) = (byte)V;
- *(char *)((char *)player_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x2) = (byte)V;
- *(byte *)((char *)player_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(ushort *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- ((ushort *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(ushort *)((ushort *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(ushort *)(player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word
)
...>
}


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(undefined2 *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- ((undefined2 *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(undefined2 *)((undefined2 *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(undefined2 *)(player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word
)
...>
}


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
|
- *(short *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
|
- ((short *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
|
- *(short *)((short *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
|
- *(short *)(player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
)
...>
}


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(byte *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- ((byte *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(byte *)((ushort *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- (byte)((ushort *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(byte *)(player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(undefined1 *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- ((undefined1 *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(undefined1 *)((ushort *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- (undefined1)((ushort *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(undefined1 *)(player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
)
...>
}


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_low
|
- &*(char *)((byte *)player_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_low
|
- &((char *)player_rec)[0x2]
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_low
|
- &*(char *)((ushort *)player_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_low
|
- &*(char *)(player_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_low
|
- &player_rec[0x2]
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_low
)
...>
}


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x2) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x2) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
|
- ((char *)player_rec)[0x2] = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0x1) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
|
- *(char *)(player_rec + 0x2) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
|
- player_rec[0x2] = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x2)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(char *)((byte *)player_rec + 0x2)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- ((char *)player_rec)[0x2]
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(char *)((ushort *)player_rec + 0x1)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- (char)((ushort *)player_rec)[0x1]
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(char *)(player_rec + 0x2)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- player_rec[0x2]
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(byte *)((byte *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- ((byte *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(byte *)(player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
)
...>
}


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(undefined1 *)((byte *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- ((undefined1 *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(undefined1 *)(player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
)
...>
}


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_high
|
- &*(char *)((byte *)player_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_high
|
- &((char *)player_rec)[0x3]
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_high
|
- &*(char *)(player_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_high
|
- &player_rec[0x3]
+ (char *)&((uw_object_hdr_t *)player_rec)->position_word_high
)
...>
}


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x3) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x3) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_high = (byte)E;
|
- ((char *)player_rec)[0x3] = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_high = (byte)E;
|
- *(char *)(player_rec + 0x3) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_high = (byte)E;
|
- player_rec[0x3] = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_high = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x3)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(char *)((byte *)player_rec + 0x3)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_high
|
- ((char *)player_rec)[0x3]
+ (char)((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(char *)(player_rec + 0x3)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_high
|
- player_rec[0x3]
+ (char)((uw_object_hdr_t *)player_rec)->position_word_high
)
...>
}


@receiver_2_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x4) = (char)V;
- *(char *)((char *)player_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x4) = (char)V;
- *(byte *)((char *)player_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x4) = (byte)V;
- *(char *)((char *)player_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x4) = (byte)V;
- *(byte *)((char *)player_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(ushort *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- ((ushort *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(ushort *)((ushort *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(ushort *)(player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
)
...>
}


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(undefined2 *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- ((undefined2 *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(undefined2 *)((undefined2 *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(undefined2 *)(player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
)
...>
}


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
|
- *(short *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
|
- ((short *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
|
- *(short *)((short *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
|
- *(short *)(player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
)
...>
}


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(byte *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- ((byte *)player_rec)[0x4]
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(byte *)((ushort *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- (byte)((ushort *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(byte *)(player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(undefined1 *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- ((undefined1 *)player_rec)[0x4]
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(undefined1 *)((ushort *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- (undefined1)((ushort *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(undefined1 *)(player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
)
...>
}


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_low
|
- &*(char *)((byte *)player_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_low
|
- &((char *)player_rec)[0x4]
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_low
|
- &*(char *)((ushort *)player_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_low
|
- &*(char *)(player_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_low
|
- &player_rec[0x4]
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_low
)
...>
}


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x4) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x4) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
|
- ((char *)player_rec)[0x4] = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0x2) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
|
- *(char *)(player_rec + 0x4) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
|
- player_rec[0x4] = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x4)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(char *)((byte *)player_rec + 0x4)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- ((char *)player_rec)[0x4]
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(char *)((ushort *)player_rec + 0x2)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- (char)((ushort *)player_rec)[0x2]
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(char *)(player_rec + 0x4)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- player_rec[0x4]
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(byte *)((byte *)player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- ((byte *)player_rec)[0x5]
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(byte *)(player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
)
...>
}


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(undefined1 *)((byte *)player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- ((undefined1 *)player_rec)[0x5]
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(undefined1 *)(player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
)
...>
}


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_high
|
- &*(char *)((byte *)player_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_high
|
- &((char *)player_rec)[0x5]
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_high
|
- &*(char *)(player_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_high
|
- &player_rec[0x5]
+ (char *)&((uw_object_hdr_t *)player_rec)->chain_word_high
)
...>
}


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x5) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x5) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_high = (byte)E;
|
- ((char *)player_rec)[0x5] = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_high = (byte)E;
|
- *(char *)(player_rec + 0x5) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_high = (byte)E;
|
- player_rec[0x5] = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_high = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x5)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(char *)((byte *)player_rec + 0x5)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_high
|
- ((char *)player_rec)[0x5]
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(char *)(player_rec + 0x5)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_high
|
- player_rec[0x5]
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_high
)
...>
}


@receiver_2_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x6) = (char)V;
- *(char *)((char *)player_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x6) = (char)V;
- *(byte *)((char *)player_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x6) = (byte)V;
- *(char *)((char *)player_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x6) = (byte)V;
- *(byte *)((char *)player_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(ushort *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- ((ushort *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(ushort *)((ushort *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(ushort *)(player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word
)
...>
}


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(undefined2 *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- ((undefined2 *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(undefined2 *)((undefined2 *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(undefined2 *)(player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word
)
...>
}


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
|
- *(short *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
|
- ((short *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
|
- *(short *)((short *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
|
- *(short *)(player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
)
...>
}


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(byte *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- ((byte *)player_rec)[0x6]
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(byte *)((ushort *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- (byte)((ushort *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(byte *)(player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(undefined1 *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- ((undefined1 *)player_rec)[0x6]
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(undefined1 *)((ushort *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- (undefined1)((ushort *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(undefined1 *)(player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
)
...>
}


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_low
|
- &*(char *)((byte *)player_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_low
|
- &((char *)player_rec)[0x6]
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_low
|
- &*(char *)((ushort *)player_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_low
|
- &*(char *)(player_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_low
|
- &player_rec[0x6]
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_low
)
...>
}


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x6) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x6) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
|
- ((char *)player_rec)[0x6] = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0x3) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
|
- *(char *)(player_rec + 0x6) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
|
- player_rec[0x6] = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x6)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(char *)((byte *)player_rec + 0x6)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- ((char *)player_rec)[0x6]
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(char *)((ushort *)player_rec + 0x3)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- (char)((ushort *)player_rec)[0x3]
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(char *)(player_rec + 0x6)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- player_rec[0x6]
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(byte *)((byte *)player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- ((byte *)player_rec)[0x7]
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(byte *)(player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
)
...>
}


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(undefined1 *)((byte *)player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- ((undefined1 *)player_rec)[0x7]
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(undefined1 *)(player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
)
...>
}


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_high
|
- &*(char *)((byte *)player_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_high
|
- &((char *)player_rec)[0x7]
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_high
|
- &*(char *)(player_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_high
|
- &player_rec[0x7]
+ (char *)&((uw_object_hdr_t *)player_rec)->link_word_high
)
...>
}


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x7) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x7) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_high = (byte)E;
|
- ((char *)player_rec)[0x7] = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_high = (byte)E;
|
- *(char *)(player_rec + 0x7) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_high = (byte)E;
|
- player_rec[0x7] = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_high = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x7)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(char *)((byte *)player_rec + 0x7)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_high
|
- ((char *)player_rec)[0x7]
+ (char)((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(char *)(player_rec + 0x7)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_high
|
- player_rec[0x7]
+ (char)((uw_object_hdr_t *)player_rec)->link_word_high
)
...>
}


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x0) = (char)V;
- *(char *)((char *)pcVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x0) = (char)V;
- *(byte *)((char *)pcVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x0) = (byte)V;
- *(char *)((char *)pcVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x0) = (byte)V;
- *(byte *)((char *)pcVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- ((ushort *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)((ushort *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)(pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
)
...>
}


@receiver_3_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(undefined2 *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- ((undefined2 *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(undefined2 *)((undefined2 *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(undefined2 *)(pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
|
- *(short *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
|
- ((short *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
|
- *(short *)((short *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
|
- *(short *)(pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(byte *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- ((byte *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(byte *)((ushort *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- (byte)((ushort *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(byte *)pcVar3
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(byte *)(pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(undefined1 *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- ((undefined1 *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- (undefined1)((ushort *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(undefined1 *)pcVar3
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(undefined1 *)(pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
)
...>
}


@receiver_3_w_0_0_address_0@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- &*(char *)((byte *)pcVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- &((char *)pcVar3)[0x0]
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- &*(char *)((ushort *)pcVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- &*(char *)pcVar3
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- &*(char *)(pcVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- &pcVar3[0x0]
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- &*pcVar3
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- ((char *)pcVar3)[0x0] = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pcVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- *(char *)pcVar3 = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- *(char *)(pcVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- pcVar3[0x0] = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- *pcVar3 = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(char *)((byte *)pcVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- ((char *)pcVar3)[0x0]
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(char *)((ushort *)pcVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- (char)((ushort *)pcVar3)[0x0]
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(char *)pcVar3
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(char *)(pcVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- pcVar3[0x0]
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *pcVar3
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(byte *)((byte *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- ((byte *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(byte *)(pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(undefined1 *)((byte *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- ((undefined1 *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(undefined1 *)(pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
)
...>
}


@receiver_3_w_0_0_address_1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- &*(char *)((byte *)pcVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- &((char *)pcVar3)[0x1]
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- &*(char *)(pcVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- &pcVar3[0x1]
+ (char *)&((uw_object_hdr_t *)pcVar3)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high = (byte)E;
|
- ((char *)pcVar3)[0x1] = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high = (byte)E;
|
- *(char *)(pcVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high = (byte)E;
|
- pcVar3[0x1] = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(char *)((byte *)pcVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- ((char *)pcVar3)[0x1]
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(char *)(pcVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- pcVar3[0x1]
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_high
)
...>
}


@receiver_3_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x2) = (char)V;
- *(char *)((char *)pcVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x2) = (char)V;
- *(byte *)((char *)pcVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x2) = (byte)V;
- *(char *)((char *)pcVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x2) = (byte)V;
- *(byte *)((char *)pcVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_word_ushort@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(ushort *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- ((ushort *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(ushort *)((ushort *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(ushort *)(pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
)
...>
}


@receiver_3_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(undefined2 *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- ((undefined2 *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(undefined2 *)((undefined2 *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(undefined2 *)(pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
)
...>
}


@receiver_3_w_2_17_word_short@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
|
- *(short *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
|
- ((short *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
|
- *(short *)((short *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
|
- *(short *)(pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
)
...>
}


@receiver_3_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(byte *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- ((byte *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(byte *)((ushort *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- (byte)((ushort *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(byte *)(pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(undefined1 *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- ((undefined1 *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(undefined1 *)((ushort *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- (undefined1)((ushort *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(undefined1 *)(pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
)
...>
}


@receiver_3_w_2_17_address_2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_low
|
- &*(char *)((byte *)pcVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_low
|
- &((char *)pcVar3)[0x2]
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_low
|
- &*(char *)((ushort *)pcVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_low
|
- &*(char *)(pcVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_low
|
- &pcVar3[0x2]
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_low
)
...>
}


@receiver_3_w_2_17_store_2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
|
- ((char *)pcVar3)[0x2] = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
|
- *(char *)(pcVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
|
- pcVar3[0x2] = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(char *)((byte *)pcVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- ((char *)pcVar3)[0x2]
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(char *)((ushort *)pcVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- (char)((ushort *)pcVar3)[0x1]
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(char *)(pcVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- pcVar3[0x2]
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(byte *)((byte *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- ((byte *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(byte *)(pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
)
...>
}


@receiver_3_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(undefined1 *)((byte *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- ((undefined1 *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(undefined1 *)(pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
)
...>
}


@receiver_3_w_2_17_address_3@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_high
|
- &*(char *)((byte *)pcVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_high
|
- &((char *)pcVar3)[0x3]
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_high
|
- &*(char *)(pcVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_high
|
- &pcVar3[0x3]
+ (char *)&((uw_object_hdr_t *)pcVar3)->position_word_high
)
...>
}


@receiver_3_w_2_17_store_3@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_high = (byte)E;
|
- ((char *)pcVar3)[0x3] = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_high = (byte)E;
|
- *(char *)(pcVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_high = (byte)E;
|
- pcVar3[0x3] = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(char *)((byte *)pcVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_high
|
- ((char *)pcVar3)[0x3]
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(char *)(pcVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_high
|
- pcVar3[0x3]
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_high
)
...>
}


@receiver_3_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x4) = (char)V;
- *(char *)((char *)pcVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x4) = (char)V;
- *(byte *)((char *)pcVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x4) = (byte)V;
- *(char *)((char *)pcVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x4) = (byte)V;
- *(byte *)((char *)pcVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_word_ushort@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(ushort *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- ((ushort *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(ushort *)((ushort *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(ushort *)(pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
)
...>
}


@receiver_3_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(undefined2 *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- ((undefined2 *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(undefined2 *)((undefined2 *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(undefined2 *)(pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
)
...>
}


@receiver_3_w_4_34_word_short@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
|
- *(short *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
|
- ((short *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
|
- *(short *)((short *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
|
- *(short *)(pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
)
...>
}


@receiver_3_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(byte *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- ((byte *)pcVar3)[0x4]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(byte *)((ushort *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- (byte)((ushort *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(byte *)(pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(undefined1 *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- ((undefined1 *)pcVar3)[0x4]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- (undefined1)((ushort *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(undefined1 *)(pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
)
...>
}


@receiver_3_w_4_34_address_4@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- &*(char *)((byte *)pcVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- &((char *)pcVar3)[0x4]
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- &*(char *)((ushort *)pcVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- &*(char *)(pcVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- &pcVar3[0x4]
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_low
)
...>
}


@receiver_3_w_4_34_store_4@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
|
- ((char *)pcVar3)[0x4] = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
|
- *(char *)(pcVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
|
- pcVar3[0x4] = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(char *)((byte *)pcVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- ((char *)pcVar3)[0x4]
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(char *)((ushort *)pcVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- (char)((ushort *)pcVar3)[0x2]
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(char *)(pcVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- pcVar3[0x4]
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(byte *)((byte *)pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- ((byte *)pcVar3)[0x5]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(byte *)(pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
)
...>
}


@receiver_3_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(undefined1 *)((byte *)pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- ((undefined1 *)pcVar3)[0x5]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(undefined1 *)(pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
)
...>
}


@receiver_3_w_4_34_address_5@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- &*(char *)((byte *)pcVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- &((char *)pcVar3)[0x5]
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- &*(char *)(pcVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- &pcVar3[0x5]
+ (char *)&((uw_object_hdr_t *)pcVar3)->chain_word_high
)
...>
}


@receiver_3_w_4_34_store_5@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high = (byte)E;
|
- ((char *)pcVar3)[0x5] = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high = (byte)E;
|
- *(char *)(pcVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high = (byte)E;
|
- pcVar3[0x5] = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(char *)((byte *)pcVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- ((char *)pcVar3)[0x5]
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(char *)(pcVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- pcVar3[0x5]
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_high
)
...>
}


@receiver_3_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x6) = (char)V;
- *(char *)((char *)pcVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x6) = (char)V;
- *(byte *)((char *)pcVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x6) = (byte)V;
- *(char *)((char *)pcVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x6) = (byte)V;
- *(byte *)((char *)pcVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_word_ushort@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(ushort *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- ((ushort *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(ushort *)((ushort *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(ushort *)(pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
)
...>
}


@receiver_3_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(undefined2 *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- ((undefined2 *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(undefined2 *)((undefined2 *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(undefined2 *)(pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
)
...>
}


@receiver_3_w_6_51_word_short@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
|
- *(short *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
|
- ((short *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
|
- *(short *)((short *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
|
- *(short *)(pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
)
...>
}


@receiver_3_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(byte *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- ((byte *)pcVar3)[0x6]
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(byte *)((ushort *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- (byte)((ushort *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(byte *)(pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(undefined1 *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- ((undefined1 *)pcVar3)[0x6]
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(undefined1 *)((ushort *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- (undefined1)((ushort *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(undefined1 *)(pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
)
...>
}


@receiver_3_w_6_51_address_6@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_low
|
- &*(char *)((byte *)pcVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_low
|
- &((char *)pcVar3)[0x6]
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_low
|
- &*(char *)((ushort *)pcVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_low
|
- &*(char *)(pcVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_low
|
- &pcVar3[0x6]
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_low
)
...>
}


@receiver_3_w_6_51_store_6@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
|
- ((char *)pcVar3)[0x6] = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
|
- *(char *)(pcVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
|
- pcVar3[0x6] = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(char *)((byte *)pcVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- ((char *)pcVar3)[0x6]
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(char *)((ushort *)pcVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- (char)((ushort *)pcVar3)[0x3]
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(char *)(pcVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- pcVar3[0x6]
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(byte *)((byte *)pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- ((byte *)pcVar3)[0x7]
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(byte *)(pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
)
...>
}


@receiver_3_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(undefined1 *)((byte *)pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- ((undefined1 *)pcVar3)[0x7]
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(undefined1 *)(pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
)
...>
}


@receiver_3_w_6_51_address_7@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_high
|
- &*(char *)((byte *)pcVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_high
|
- &((char *)pcVar3)[0x7]
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_high
|
- &*(char *)(pcVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_high
|
- &pcVar3[0x7]
+ (char *)&((uw_object_hdr_t *)pcVar3)->link_word_high
)
...>
}


@receiver_3_w_6_51_store_7@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_high = (byte)E;
|
- ((char *)pcVar3)[0x7] = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_high = (byte)E;
|
- *(char *)(pcVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_high = (byte)E;
|
- pcVar3[0x7] = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(char *)((byte *)pcVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_high
|
- ((char *)pcVar3)[0x7]
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(char *)(pcVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_high
|
- pcVar3[0x7]
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_address_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_address_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_2_17_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_address_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_store_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_address_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_store_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_4_34_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_address_4@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_store_4@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_address_5@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_store_5@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_4_w_6_51_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_address_6@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_store_6@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_address_7@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_store_7@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_4_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)projectile + 0x0) = (char)V;
- *(char *)((char *)projectile + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)projectile + 0x0) = (char)V;
- *(byte *)((char *)projectile + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)projectile + 0x0) = (byte)V;
- *(char *)((char *)projectile + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)projectile + 0x0) = (byte)V;
- *(byte *)((char *)projectile + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags
|
- *(ushort *)((byte *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags
|
- ((ushort *)projectile)[0x0]
+ ((uw_object_hdr_t *)projectile)->type_flags
|
- *(ushort *)((ushort *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags
)
...>
}


@receiver_5_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags
|
- *(undefined2 *)((byte *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags
|
- ((undefined2 *)projectile)[0x0]
+ ((uw_object_hdr_t *)projectile)->type_flags
|
- *(undefined2 *)((undefined2 *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_signed
|
- *(short *)((byte *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_signed
|
- ((short *)projectile)[0x0]
+ ((uw_object_hdr_t *)projectile)->type_flags_signed
|
- *(short *)((short *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(byte *)((byte *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- ((byte *)projectile)[0x0]
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(byte *)((ushort *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- (byte)((ushort *)projectile)[0x0]
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(byte *)projectile
+ ((uw_object_hdr_t *)projectile)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(undefined1 *)((byte *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- ((undefined1 *)projectile)[0x0]
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(undefined1 *)((ushort *)projectile + 0x0)
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- (undefined1)((ushort *)projectile)[0x0]
+ ((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(undefined1 *)projectile
+ ((uw_object_hdr_t *)projectile)->type_flags_low
)
...>
}


@receiver_5_w_0_0_address_0@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)projectile + 0x0)
+ (char *)&((uw_object_hdr_t *)projectile)->type_flags_low
|
- &*(char *)((byte *)projectile + 0x0)
+ (char *)&((uw_object_hdr_t *)projectile)->type_flags_low
|
- &((char *)projectile)[0x0]
+ (char *)&((uw_object_hdr_t *)projectile)->type_flags_low
|
- &*(char *)((ushort *)projectile + 0x0)
+ (char *)&((uw_object_hdr_t *)projectile)->type_flags_low
|
- &*(char *)projectile
+ (char *)&((uw_object_hdr_t *)projectile)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x0) = E;
+ ((uw_object_hdr_t *)projectile)->type_flags_low = (byte)E;
|
- *(char *)((byte *)projectile + 0x0) = E;
+ ((uw_object_hdr_t *)projectile)->type_flags_low = (byte)E;
|
- ((char *)projectile)[0x0] = E;
+ ((uw_object_hdr_t *)projectile)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)projectile + 0x0) = E;
+ ((uw_object_hdr_t *)projectile)->type_flags_low = (byte)E;
|
- *(char *)projectile = E;
+ ((uw_object_hdr_t *)projectile)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x0)
+ (char)((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(char *)((byte *)projectile + 0x0)
+ (char)((uw_object_hdr_t *)projectile)->type_flags_low
|
- ((char *)projectile)[0x0]
+ (char)((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(char *)((ushort *)projectile + 0x0)
+ (char)((uw_object_hdr_t *)projectile)->type_flags_low
|
- (char)((ushort *)projectile)[0x0]
+ (char)((uw_object_hdr_t *)projectile)->type_flags_low
|
- *(char *)projectile
+ (char)((uw_object_hdr_t *)projectile)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->type_flags_high
|
- *(byte *)((byte *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->type_flags_high
|
- ((byte *)projectile)[0x1]
+ ((uw_object_hdr_t *)projectile)->type_flags_high
)
...>
}


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->type_flags_high
|
- *(undefined1 *)((byte *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->type_flags_high
|
- ((undefined1 *)projectile)[0x1]
+ ((uw_object_hdr_t *)projectile)->type_flags_high
)
...>
}


@receiver_5_w_0_0_address_1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)projectile + 0x1)
+ (char *)&((uw_object_hdr_t *)projectile)->type_flags_high
|
- &*(char *)((byte *)projectile + 0x1)
+ (char *)&((uw_object_hdr_t *)projectile)->type_flags_high
|
- &((char *)projectile)[0x1]
+ (char *)&((uw_object_hdr_t *)projectile)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x1) = E;
+ ((uw_object_hdr_t *)projectile)->type_flags_high = (byte)E;
|
- *(char *)((byte *)projectile + 0x1) = E;
+ ((uw_object_hdr_t *)projectile)->type_flags_high = (byte)E;
|
- ((char *)projectile)[0x1] = E;
+ ((uw_object_hdr_t *)projectile)->type_flags_high = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x1)
+ (char)((uw_object_hdr_t *)projectile)->type_flags_high
|
- *(char *)((byte *)projectile + 0x1)
+ (char)((uw_object_hdr_t *)projectile)->type_flags_high
|
- ((char *)projectile)[0x1]
+ (char)((uw_object_hdr_t *)projectile)->type_flags_high
)
...>
}


@receiver_5_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)projectile + 0x2) = (char)V;
- *(char *)((char *)projectile + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)projectile + 0x2) = (char)V;
- *(byte *)((char *)projectile + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)projectile + 0x2) = (byte)V;
- *(char *)((char *)projectile + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)projectile + 0x2) = (byte)V;
- *(byte *)((char *)projectile + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_word_ushort@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word
|
- *(ushort *)((byte *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word
|
- ((ushort *)projectile)[0x1]
+ ((uw_object_hdr_t *)projectile)->position_word
|
- *(ushort *)((ushort *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->position_word
)
...>
}


@receiver_5_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word
|
- *(undefined2 *)((byte *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word
|
- ((undefined2 *)projectile)[0x1]
+ ((uw_object_hdr_t *)projectile)->position_word
|
- *(undefined2 *)((undefined2 *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->position_word
)
...>
}


@receiver_5_w_2_17_word_short@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word_signed
|
- *(short *)((byte *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word_signed
|
- ((short *)projectile)[0x1]
+ ((uw_object_hdr_t *)projectile)->position_word_signed
|
- *(short *)((short *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->position_word_signed
)
...>
}


@receiver_5_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word_low
|
- *(byte *)((byte *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word_low
|
- ((byte *)projectile)[0x2]
+ ((uw_object_hdr_t *)projectile)->position_word_low
|
- *(byte *)((ushort *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->position_word_low
|
- (byte)((ushort *)projectile)[0x1]
+ ((uw_object_hdr_t *)projectile)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word_low
|
- *(undefined1 *)((byte *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->position_word_low
|
- ((undefined1 *)projectile)[0x2]
+ ((uw_object_hdr_t *)projectile)->position_word_low
|
- *(undefined1 *)((ushort *)projectile + 0x1)
+ ((uw_object_hdr_t *)projectile)->position_word_low
|
- (undefined1)((ushort *)projectile)[0x1]
+ ((uw_object_hdr_t *)projectile)->position_word_low
)
...>
}


@receiver_5_w_2_17_address_2@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)projectile + 0x2)
+ (char *)&((uw_object_hdr_t *)projectile)->position_word_low
|
- &*(char *)((byte *)projectile + 0x2)
+ (char *)&((uw_object_hdr_t *)projectile)->position_word_low
|
- &((char *)projectile)[0x2]
+ (char *)&((uw_object_hdr_t *)projectile)->position_word_low
|
- &*(char *)((ushort *)projectile + 0x1)
+ (char *)&((uw_object_hdr_t *)projectile)->position_word_low
)
...>
}


@receiver_5_w_2_17_store_2@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x2) = E;
+ ((uw_object_hdr_t *)projectile)->position_word_low = (byte)E;
|
- *(char *)((byte *)projectile + 0x2) = E;
+ ((uw_object_hdr_t *)projectile)->position_word_low = (byte)E;
|
- ((char *)projectile)[0x2] = E;
+ ((uw_object_hdr_t *)projectile)->position_word_low = (byte)E;
|
- *(char *)((ushort *)projectile + 0x1) = E;
+ ((uw_object_hdr_t *)projectile)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x2)
+ (char)((uw_object_hdr_t *)projectile)->position_word_low
|
- *(char *)((byte *)projectile + 0x2)
+ (char)((uw_object_hdr_t *)projectile)->position_word_low
|
- ((char *)projectile)[0x2]
+ (char)((uw_object_hdr_t *)projectile)->position_word_low
|
- *(char *)((ushort *)projectile + 0x1)
+ (char)((uw_object_hdr_t *)projectile)->position_word_low
|
- (char)((ushort *)projectile)[0x1]
+ (char)((uw_object_hdr_t *)projectile)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->position_word_high
|
- *(byte *)((byte *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->position_word_high
|
- ((byte *)projectile)[0x3]
+ ((uw_object_hdr_t *)projectile)->position_word_high
)
...>
}


@receiver_5_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->position_word_high
|
- *(undefined1 *)((byte *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->position_word_high
|
- ((undefined1 *)projectile)[0x3]
+ ((uw_object_hdr_t *)projectile)->position_word_high
)
...>
}


@receiver_5_w_2_17_address_3@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)projectile + 0x3)
+ (char *)&((uw_object_hdr_t *)projectile)->position_word_high
|
- &*(char *)((byte *)projectile + 0x3)
+ (char *)&((uw_object_hdr_t *)projectile)->position_word_high
|
- &((char *)projectile)[0x3]
+ (char *)&((uw_object_hdr_t *)projectile)->position_word_high
)
...>
}


@receiver_5_w_2_17_store_3@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x3) = E;
+ ((uw_object_hdr_t *)projectile)->position_word_high = (byte)E;
|
- *(char *)((byte *)projectile + 0x3) = E;
+ ((uw_object_hdr_t *)projectile)->position_word_high = (byte)E;
|
- ((char *)projectile)[0x3] = E;
+ ((uw_object_hdr_t *)projectile)->position_word_high = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x3)
+ (char)((uw_object_hdr_t *)projectile)->position_word_high
|
- *(char *)((byte *)projectile + 0x3)
+ (char)((uw_object_hdr_t *)projectile)->position_word_high
|
- ((char *)projectile)[0x3]
+ (char)((uw_object_hdr_t *)projectile)->position_word_high
)
...>
}


@receiver_5_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)projectile + 0x4) = (char)V;
- *(char *)((char *)projectile + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)projectile + 0x4) = (char)V;
- *(byte *)((char *)projectile + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)projectile + 0x4) = (byte)V;
- *(char *)((char *)projectile + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)projectile + 0x4) = (byte)V;
- *(byte *)((char *)projectile + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_word_ushort@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word
|
- *(ushort *)((byte *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word
|
- ((ushort *)projectile)[0x2]
+ ((uw_object_hdr_t *)projectile)->chain_word
|
- *(ushort *)((ushort *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->chain_word
)
...>
}


@receiver_5_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word
|
- *(undefined2 *)((byte *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word
|
- ((undefined2 *)projectile)[0x2]
+ ((uw_object_hdr_t *)projectile)->chain_word
|
- *(undefined2 *)((undefined2 *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->chain_word
)
...>
}


@receiver_5_w_4_34_word_short@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word_signed
|
- *(short *)((byte *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word_signed
|
- ((short *)projectile)[0x2]
+ ((uw_object_hdr_t *)projectile)->chain_word_signed
|
- *(short *)((short *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->chain_word_signed
)
...>
}


@receiver_5_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word_low
|
- *(byte *)((byte *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word_low
|
- ((byte *)projectile)[0x4]
+ ((uw_object_hdr_t *)projectile)->chain_word_low
|
- *(byte *)((ushort *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->chain_word_low
|
- (byte)((ushort *)projectile)[0x2]
+ ((uw_object_hdr_t *)projectile)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word_low
|
- *(undefined1 *)((byte *)projectile + 0x4)
+ ((uw_object_hdr_t *)projectile)->chain_word_low
|
- ((undefined1 *)projectile)[0x4]
+ ((uw_object_hdr_t *)projectile)->chain_word_low
|
- *(undefined1 *)((ushort *)projectile + 0x2)
+ ((uw_object_hdr_t *)projectile)->chain_word_low
|
- (undefined1)((ushort *)projectile)[0x2]
+ ((uw_object_hdr_t *)projectile)->chain_word_low
)
...>
}


@receiver_5_w_4_34_address_4@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)projectile + 0x4)
+ (char *)&((uw_object_hdr_t *)projectile)->chain_word_low
|
- &*(char *)((byte *)projectile + 0x4)
+ (char *)&((uw_object_hdr_t *)projectile)->chain_word_low
|
- &((char *)projectile)[0x4]
+ (char *)&((uw_object_hdr_t *)projectile)->chain_word_low
|
- &*(char *)((ushort *)projectile + 0x2)
+ (char *)&((uw_object_hdr_t *)projectile)->chain_word_low
)
...>
}


@receiver_5_w_4_34_store_4@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x4) = E;
+ ((uw_object_hdr_t *)projectile)->chain_word_low = (byte)E;
|
- *(char *)((byte *)projectile + 0x4) = E;
+ ((uw_object_hdr_t *)projectile)->chain_word_low = (byte)E;
|
- ((char *)projectile)[0x4] = E;
+ ((uw_object_hdr_t *)projectile)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)projectile + 0x2) = E;
+ ((uw_object_hdr_t *)projectile)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x4)
+ (char)((uw_object_hdr_t *)projectile)->chain_word_low
|
- *(char *)((byte *)projectile + 0x4)
+ (char)((uw_object_hdr_t *)projectile)->chain_word_low
|
- ((char *)projectile)[0x4]
+ (char)((uw_object_hdr_t *)projectile)->chain_word_low
|
- *(char *)((ushort *)projectile + 0x2)
+ (char)((uw_object_hdr_t *)projectile)->chain_word_low
|
- (char)((ushort *)projectile)[0x2]
+ (char)((uw_object_hdr_t *)projectile)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)projectile + 0x5)
+ ((uw_object_hdr_t *)projectile)->chain_word_high
|
- *(byte *)((byte *)projectile + 0x5)
+ ((uw_object_hdr_t *)projectile)->chain_word_high
|
- ((byte *)projectile)[0x5]
+ ((uw_object_hdr_t *)projectile)->chain_word_high
)
...>
}


@receiver_5_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)projectile + 0x5)
+ ((uw_object_hdr_t *)projectile)->chain_word_high
|
- *(undefined1 *)((byte *)projectile + 0x5)
+ ((uw_object_hdr_t *)projectile)->chain_word_high
|
- ((undefined1 *)projectile)[0x5]
+ ((uw_object_hdr_t *)projectile)->chain_word_high
)
...>
}


@receiver_5_w_4_34_address_5@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)projectile + 0x5)
+ (char *)&((uw_object_hdr_t *)projectile)->chain_word_high
|
- &*(char *)((byte *)projectile + 0x5)
+ (char *)&((uw_object_hdr_t *)projectile)->chain_word_high
|
- &((char *)projectile)[0x5]
+ (char *)&((uw_object_hdr_t *)projectile)->chain_word_high
)
...>
}


@receiver_5_w_4_34_store_5@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x5) = E;
+ ((uw_object_hdr_t *)projectile)->chain_word_high = (byte)E;
|
- *(char *)((byte *)projectile + 0x5) = E;
+ ((uw_object_hdr_t *)projectile)->chain_word_high = (byte)E;
|
- ((char *)projectile)[0x5] = E;
+ ((uw_object_hdr_t *)projectile)->chain_word_high = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x5)
+ (char)((uw_object_hdr_t *)projectile)->chain_word_high
|
- *(char *)((byte *)projectile + 0x5)
+ (char)((uw_object_hdr_t *)projectile)->chain_word_high
|
- ((char *)projectile)[0x5]
+ (char)((uw_object_hdr_t *)projectile)->chain_word_high
)
...>
}


@receiver_5_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)projectile + 0x6) = (char)V;
- *(char *)((char *)projectile + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)projectile + 0x6) = (char)V;
- *(byte *)((char *)projectile + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)projectile + 0x6) = (byte)V;
- *(char *)((char *)projectile + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)projectile + 0x6) = (byte)V;
- *(byte *)((char *)projectile + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)projectile)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_word_ushort@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word
|
- *(ushort *)((byte *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word
|
- ((ushort *)projectile)[0x3]
+ ((uw_object_hdr_t *)projectile)->link_word
|
- *(ushort *)((ushort *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->link_word
)
...>
}


@receiver_5_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word
|
- *(undefined2 *)((byte *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word
|
- ((undefined2 *)projectile)[0x3]
+ ((uw_object_hdr_t *)projectile)->link_word
|
- *(undefined2 *)((undefined2 *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->link_word
)
...>
}


@receiver_5_w_6_51_word_short@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word_signed
|
- *(short *)((byte *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word_signed
|
- ((short *)projectile)[0x3]
+ ((uw_object_hdr_t *)projectile)->link_word_signed
|
- *(short *)((short *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->link_word_signed
)
...>
}


@receiver_5_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word_low
|
- *(byte *)((byte *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word_low
|
- ((byte *)projectile)[0x6]
+ ((uw_object_hdr_t *)projectile)->link_word_low
|
- *(byte *)((ushort *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->link_word_low
|
- (byte)((ushort *)projectile)[0x3]
+ ((uw_object_hdr_t *)projectile)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word_low
|
- *(undefined1 *)((byte *)projectile + 0x6)
+ ((uw_object_hdr_t *)projectile)->link_word_low
|
- ((undefined1 *)projectile)[0x6]
+ ((uw_object_hdr_t *)projectile)->link_word_low
|
- *(undefined1 *)((ushort *)projectile + 0x3)
+ ((uw_object_hdr_t *)projectile)->link_word_low
|
- (undefined1)((ushort *)projectile)[0x3]
+ ((uw_object_hdr_t *)projectile)->link_word_low
)
...>
}


@receiver_5_w_6_51_address_6@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)projectile + 0x6)
+ (char *)&((uw_object_hdr_t *)projectile)->link_word_low
|
- &*(char *)((byte *)projectile + 0x6)
+ (char *)&((uw_object_hdr_t *)projectile)->link_word_low
|
- &((char *)projectile)[0x6]
+ (char *)&((uw_object_hdr_t *)projectile)->link_word_low
|
- &*(char *)((ushort *)projectile + 0x3)
+ (char *)&((uw_object_hdr_t *)projectile)->link_word_low
)
...>
}


@receiver_5_w_6_51_store_6@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x6) = E;
+ ((uw_object_hdr_t *)projectile)->link_word_low = (byte)E;
|
- *(char *)((byte *)projectile + 0x6) = E;
+ ((uw_object_hdr_t *)projectile)->link_word_low = (byte)E;
|
- ((char *)projectile)[0x6] = E;
+ ((uw_object_hdr_t *)projectile)->link_word_low = (byte)E;
|
- *(char *)((ushort *)projectile + 0x3) = E;
+ ((uw_object_hdr_t *)projectile)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x6)
+ (char)((uw_object_hdr_t *)projectile)->link_word_low
|
- *(char *)((byte *)projectile + 0x6)
+ (char)((uw_object_hdr_t *)projectile)->link_word_low
|
- ((char *)projectile)[0x6]
+ (char)((uw_object_hdr_t *)projectile)->link_word_low
|
- *(char *)((ushort *)projectile + 0x3)
+ (char)((uw_object_hdr_t *)projectile)->link_word_low
|
- (char)((ushort *)projectile)[0x3]
+ (char)((uw_object_hdr_t *)projectile)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)projectile + 0x7)
+ ((uw_object_hdr_t *)projectile)->link_word_high
|
- *(byte *)((byte *)projectile + 0x7)
+ ((uw_object_hdr_t *)projectile)->link_word_high
|
- ((byte *)projectile)[0x7]
+ ((uw_object_hdr_t *)projectile)->link_word_high
)
...>
}


@receiver_5_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)projectile + 0x7)
+ ((uw_object_hdr_t *)projectile)->link_word_high
|
- *(undefined1 *)((byte *)projectile + 0x7)
+ ((uw_object_hdr_t *)projectile)->link_word_high
|
- ((undefined1 *)projectile)[0x7]
+ ((uw_object_hdr_t *)projectile)->link_word_high
)
...>
}


@receiver_5_w_6_51_address_7@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)projectile + 0x7)
+ (char *)&((uw_object_hdr_t *)projectile)->link_word_high
|
- &*(char *)((byte *)projectile + 0x7)
+ (char *)&((uw_object_hdr_t *)projectile)->link_word_high
|
- &((char *)projectile)[0x7]
+ (char *)&((uw_object_hdr_t *)projectile)->link_word_high
)
...>
}


@receiver_5_w_6_51_store_7@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x7) = E;
+ ((uw_object_hdr_t *)projectile)->link_word_high = (byte)E;
|
- *(char *)((byte *)projectile + 0x7) = E;
+ ((uw_object_hdr_t *)projectile)->link_word_high = (byte)E;
|
- ((char *)projectile)[0x7] = E;
+ ((uw_object_hdr_t *)projectile)->link_word_high = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)projectile + 0x7)
+ (char)((uw_object_hdr_t *)projectile)->link_word_high
|
- *(char *)((byte *)projectile + 0x7)
+ (char)((uw_object_hdr_t *)projectile)->link_word_high
|
- ((char *)projectile)[0x7]
+ (char)((uw_object_hdr_t *)projectile)->link_word_high
)
...>
}


@receiver_6_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_0_0_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
|
- puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags
)
...>
}


@receiver_6_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
|
- puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags
)
...>
}


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (byte)puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (undefined1)puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_6_w_0_0_address_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
|
- (char)puVar9[0x0]
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_0_0_address_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_2_17_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(ushort *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word
)
...>
}


@receiver_6_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(undefined2 *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word
)
...>
}


@receiver_6_w_2_17_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(short *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
)
...>
}


@receiver_6_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(byte *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- (byte)puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_6_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(undefined1 *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- (undefined1)puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_6_w_2_17_address_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- &*(char *)(puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_6_w_2_17_store_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(char *)(puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
)
...>
}


@receiver_6_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(char *)(puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- (char)puVar9[0x1]
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_6_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_2_17_address_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_2_17_store_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_4_34_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(ushort *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
)
...>
}


@receiver_6_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(undefined2 *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
)
...>
}


@receiver_6_w_4_34_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(short *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
)
...>
}


@receiver_6_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(byte *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (byte)puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_6_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(undefined1 *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (undefined1)puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_6_w_4_34_address_4@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- &*(char *)(puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_6_w_4_34_store_4@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(char *)(puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
)
...>
}


@receiver_6_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(char *)(puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (char)puVar9[0x2]
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_6_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_4_34_address_5@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_4_34_store_5@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@receiver_6_w_6_51_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(ushort *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word
)
...>
}


@receiver_6_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(undefined2 *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word
)
...>
}


@receiver_6_w_6_51_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(short *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
)
...>
}


@receiver_6_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(byte *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- (byte)puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_6_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(undefined1 *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- (undefined1)puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_6_w_6_51_address_6@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- &*(char *)(puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_6_w_6_51_store_6@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(char *)(puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
)
...>
}


@receiver_6_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(char *)(puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- (char)puVar9[0x3]
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_6_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_6_51_address_7@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_6_51_store_7@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_6_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}


@receiver_7_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x0) = (char)V;
- *(char *)((char *)pbVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x0) = (char)V;
- *(byte *)((char *)pbVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x0) = (byte)V;
- *(char *)((char *)pbVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- ((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)(pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
)
...>
}


@receiver_8_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(undefined2 *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- ((undefined2 *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(undefined2 *)((undefined2 *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(undefined2 *)(pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
)
...>
}


@receiver_8_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- *(short *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- ((short *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- *(short *)((short *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- *(short *)(pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
)
...>
}


@receiver_8_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((byte *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (byte)((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)(pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- pbVar4[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((undefined1 *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (undefined1)((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)(pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- pbVar4[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_8_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &*(char *)((byte *)pbVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &((char *)pbVar4)[0x0]
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &*(char *)((ushort *)pbVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &*(char *)pbVar4
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &*(char *)(pbVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_8_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- ((char *)pbVar4)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)pbVar4 = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)(pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)((byte *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((char *)pbVar4)[0x0]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)((ushort *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (char)((ushort *)pbVar4)[0x0]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)pbVar4
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)(pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(byte *)((byte *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((byte *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(byte *)(pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- pbVar4[0x1]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_8_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((undefined1 *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(undefined1 *)(pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- pbVar4[0x1]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_8_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- &*(char *)((byte *)pbVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- &((char *)pbVar4)[0x1]
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- &*(char *)(pbVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_8_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
|
- ((char *)pbVar4)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
|
- *(char *)(pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(char *)((byte *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((char *)pbVar4)[0x1]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(char *)(pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_8_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x2) = (char)V;
- *(char *)((char *)pbVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x2) = (char)V;
- *(byte *)((char *)pbVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x2) = (byte)V;
- *(char *)((char *)pbVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- ((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)(pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
)
...>
}


@receiver_8_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(undefined2 *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- ((undefined2 *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(undefined2 *)((undefined2 *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(undefined2 *)(pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
)
...>
}


@receiver_8_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- *(short *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- ((short *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- *(short *)((short *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- *(short *)(pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
)
...>
}


@receiver_8_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(byte *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((byte *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (byte)((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(byte *)(pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- pbVar4[0x2]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_8_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((undefined1 *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (undefined1)((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(undefined1 *)(pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- pbVar4[0x2]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_8_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
|
- &*(char *)((byte *)pbVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
|
- &((char *)pbVar4)[0x2]
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
|
- &*(char *)((ushort *)pbVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
|
- &*(char *)(pbVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_8_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- ((char *)pbVar4)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- *(char *)(pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_8_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(char *)((byte *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((char *)pbVar4)[0x2]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(char *)((ushort *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (char)((ushort *)pbVar4)[0x1]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(char *)(pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_8_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(byte *)((byte *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((byte *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(byte *)(pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- pbVar4[0x3]
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_8_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((undefined1 *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(undefined1 *)(pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- pbVar4[0x3]
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_8_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_high
|
- &*(char *)((byte *)pbVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_high
|
- &((char *)pbVar4)[0x3]
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_high
|
- &*(char *)(pbVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_8_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
|
- ((char *)pbVar4)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
|
- *(char *)(pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
)
...>
}


@receiver_8_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(char *)((byte *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((char *)pbVar4)[0x3]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(char *)(pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_8_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x4) = (char)V;
- *(char *)((char *)pbVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x4) = (char)V;
- *(byte *)((char *)pbVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x4) = (byte)V;
- *(char *)((char *)pbVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- ((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)(pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
)
...>
}


@receiver_8_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(undefined2 *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- ((undefined2 *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(undefined2 *)((undefined2 *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(undefined2 *)(pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
)
...>
}


@receiver_8_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- *(short *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- ((short *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- *(short *)((short *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- *(short *)(pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
)
...>
}


@receiver_8_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(byte *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((byte *)pbVar4)[0x4]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (byte)((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(byte *)(pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- pbVar4[0x4]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_8_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((undefined1 *)pbVar4)[0x4]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (undefined1)((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(undefined1 *)(pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- pbVar4[0x4]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_8_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- &*(char *)((byte *)pbVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- &((char *)pbVar4)[0x4]
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- &*(char *)((ushort *)pbVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- &*(char *)(pbVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_8_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- ((char *)pbVar4)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- *(char *)(pbVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_8_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(char *)((byte *)pbVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((char *)pbVar4)[0x4]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(char *)((ushort *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (char)((ushort *)pbVar4)[0x2]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(char *)(pbVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_8_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(byte *)((byte *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((byte *)pbVar4)[0x5]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(byte *)(pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- pbVar4[0x5]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_8_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((undefined1 *)pbVar4)[0x5]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(undefined1 *)(pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- pbVar4[0x5]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_8_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- &*(char *)((byte *)pbVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- &((char *)pbVar4)[0x5]
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- &*(char *)(pbVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_8_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
|
- ((char *)pbVar4)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
|
- *(char *)(pbVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
)
...>
}


@receiver_8_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(char *)((byte *)pbVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((char *)pbVar4)[0x5]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(char *)(pbVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_8_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x6) = (char)V;
- *(char *)((char *)pbVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x6) = (char)V;
- *(byte *)((char *)pbVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x6) = (byte)V;
- *(char *)((char *)pbVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- ((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)(pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
)
...>
}


@receiver_8_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(undefined2 *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- ((undefined2 *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(undefined2 *)((undefined2 *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(undefined2 *)(pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
)
...>
}


@receiver_8_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- *(short *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- ((short *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- *(short *)((short *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- *(short *)(pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
)
...>
}


@receiver_8_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(byte *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((byte *)pbVar4)[0x6]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (byte)((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(byte *)(pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- pbVar4[0x6]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_8_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((undefined1 *)pbVar4)[0x6]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (undefined1)((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(undefined1 *)(pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- pbVar4[0x6]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_8_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
|
- &*(char *)((byte *)pbVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
|
- &((char *)pbVar4)[0x6]
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
|
- &*(char *)((ushort *)pbVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
|
- &*(char *)(pbVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_8_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- ((char *)pbVar4)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- *(char *)(pbVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_8_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(char *)((byte *)pbVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((char *)pbVar4)[0x6]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(char *)((ushort *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (char)((ushort *)pbVar4)[0x3]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(char *)(pbVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_8_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(byte *)((byte *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((byte *)pbVar4)[0x7]
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(byte *)(pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- pbVar4[0x7]
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_8_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((undefined1 *)pbVar4)[0x7]
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(undefined1 *)(pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- pbVar4[0x7]
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_8_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_high
|
- &*(char *)((byte *)pbVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_high
|
- &((char *)pbVar4)[0x7]
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_high
|
- &*(char *)(pbVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_8_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
|
- ((char *)pbVar4)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
|
- *(char *)(pbVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
)
...>
}


@receiver_8_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(char *)((byte *)pbVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((char *)pbVar4)[0x7]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(char *)(pbVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_9_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x0) = (char)V;
- *(char *)((char *)iVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x0) = (char)V;
- *(byte *)((char *)iVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x0) = (byte)V;
- *(char *)((char *)iVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x0) = (byte)V;
- *(byte *)((char *)iVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(ushort *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- ((ushort *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(ushort *)((ushort *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(ushort *)(iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
)
...>
}


@receiver_9_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(undefined2 *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- ((undefined2 *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(undefined2 *)(iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
)
...>
}


@receiver_9_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
|
- *(short *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
|
- ((short *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
|
- *(short *)((short *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
|
- *(short *)(iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
)
...>
}


@receiver_9_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(byte *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- ((byte *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(byte *)((ushort *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- (byte)((ushort *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(byte *)iVar6
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(byte *)(iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(undefined1 *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- ((undefined1 *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- (undefined1)((ushort *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(undefined1 *)iVar6
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(undefined1 *)(iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
)
...>
}


@receiver_9_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_low
|
- &*(char *)((byte *)iVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_low
|
- &((char *)iVar6)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_low
|
- &*(char *)((ushort *)iVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_low
|
- &*(char *)iVar6
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_low
|
- &*(char *)(iVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_low
|
- &iVar6[0x0]
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_low
|
- &*iVar6
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_low
)
...>
}


@receiver_9_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- ((char *)iVar6)[0x0] = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- *(char *)iVar6 = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- *(char *)(iVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- iVar6[0x0] = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- *iVar6 = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x0)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(char *)((byte *)iVar6 + 0x0)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- ((char *)iVar6)[0x0]
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(char *)((ushort *)iVar6 + 0x0)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- (char)((ushort *)iVar6)[0x0]
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(char *)iVar6
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(char *)(iVar6 + 0x0)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- iVar6[0x0]
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *iVar6
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(byte *)((byte *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- ((byte *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(byte *)(iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
)
...>
}


@receiver_9_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(undefined1 *)((byte *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- ((undefined1 *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(undefined1 *)(iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
)
...>
}


@receiver_9_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_high
|
- &*(char *)((byte *)iVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_high
|
- &((char *)iVar6)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_high
|
- &*(char *)(iVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_high
|
- &iVar6[0x1]
+ (char *)&((uw_object_hdr_t *)iVar6)->type_flags_high
)
...>
}


@receiver_9_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_high = (byte)E;
|
- ((char *)iVar6)[0x1] = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_high = (byte)E;
|
- *(char *)(iVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_high = (byte)E;
|
- iVar6[0x1] = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_high = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x1)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(char *)((byte *)iVar6 + 0x1)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_high
|
- ((char *)iVar6)[0x1]
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(char *)(iVar6 + 0x1)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_high
|
- iVar6[0x1]
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_high
)
...>
}


@receiver_9_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x2) = (char)V;
- *(char *)((char *)iVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x2) = (char)V;
- *(byte *)((char *)iVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x2) = (byte)V;
- *(char *)((char *)iVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x2) = (byte)V;
- *(byte *)((char *)iVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(ushort *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- ((ushort *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(ushort *)((ushort *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(ushort *)(iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word
)
...>
}


@receiver_9_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(undefined2 *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- ((undefined2 *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(undefined2 *)((undefined2 *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(undefined2 *)(iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word
)
...>
}


@receiver_9_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
|
- *(short *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
|
- ((short *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
|
- *(short *)((short *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
|
- *(short *)(iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
)
...>
}


@receiver_9_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(byte *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- ((byte *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(byte *)((ushort *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- (byte)((ushort *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(byte *)(iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
)
...>
}


@receiver_9_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(undefined1 *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- ((undefined1 *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(undefined1 *)((ushort *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- (undefined1)((ushort *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(undefined1 *)(iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
)
...>
}


@receiver_9_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_low
|
- &*(char *)((byte *)iVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_low
|
- &((char *)iVar6)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_low
|
- &*(char *)((ushort *)iVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_low
|
- &*(char *)(iVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_low
|
- &iVar6[0x2]
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_low
)
...>
}


@receiver_9_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
|
- ((char *)iVar6)[0x2] = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
|
- *(char *)(iVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
|
- iVar6[0x2] = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
)
...>
}


@receiver_9_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x2)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(char *)((byte *)iVar6 + 0x2)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- ((char *)iVar6)[0x2]
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(char *)((ushort *)iVar6 + 0x1)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- (char)((ushort *)iVar6)[0x1]
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(char *)(iVar6 + 0x2)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- iVar6[0x2]
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
)
...>
}


@receiver_9_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(byte *)((byte *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- ((byte *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(byte *)(iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
)
...>
}


@receiver_9_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(undefined1 *)((byte *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- ((undefined1 *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(undefined1 *)(iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
)
...>
}


@receiver_9_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_high
|
- &*(char *)((byte *)iVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_high
|
- &((char *)iVar6)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_high
|
- &*(char *)(iVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_high
|
- &iVar6[0x3]
+ (char *)&((uw_object_hdr_t *)iVar6)->position_word_high
)
...>
}


@receiver_9_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_high = (byte)E;
|
- ((char *)iVar6)[0x3] = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_high = (byte)E;
|
- *(char *)(iVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_high = (byte)E;
|
- iVar6[0x3] = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_high = (byte)E;
)
...>
}


@receiver_9_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x3)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(char *)((byte *)iVar6 + 0x3)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_high
|
- ((char *)iVar6)[0x3]
+ (char)((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(char *)(iVar6 + 0x3)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_high
|
- iVar6[0x3]
+ (char)((uw_object_hdr_t *)iVar6)->position_word_high
)
...>
}


@receiver_9_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x4) = (char)V;
- *(char *)((char *)iVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x4) = (char)V;
- *(byte *)((char *)iVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x4) = (byte)V;
- *(char *)((char *)iVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x4) = (byte)V;
- *(byte *)((char *)iVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(ushort *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- ((ushort *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(ushort *)((ushort *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(ushort *)(iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
)
...>
}


@receiver_9_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(undefined2 *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- ((undefined2 *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(undefined2 *)(iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
)
...>
}


@receiver_9_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
|
- *(short *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
|
- ((short *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
|
- *(short *)((short *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
|
- *(short *)(iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
)
...>
}


@receiver_9_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(byte *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- ((byte *)iVar6)[0x4]
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(byte *)((ushort *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- (byte)((ushort *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(byte *)(iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
)
...>
}


@receiver_9_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(undefined1 *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- ((undefined1 *)iVar6)[0x4]
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- (undefined1)((ushort *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(undefined1 *)(iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
)
...>
}


@receiver_9_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_low
|
- &*(char *)((byte *)iVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_low
|
- &((char *)iVar6)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_low
|
- &*(char *)((ushort *)iVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_low
|
- &*(char *)(iVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_low
|
- &iVar6[0x4]
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_low
)
...>
}


@receiver_9_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
|
- ((char *)iVar6)[0x4] = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
|
- *(char *)(iVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
|
- iVar6[0x4] = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
)
...>
}


@receiver_9_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x4)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(char *)((byte *)iVar6 + 0x4)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- ((char *)iVar6)[0x4]
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(char *)((ushort *)iVar6 + 0x2)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- (char)((ushort *)iVar6)[0x2]
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(char *)(iVar6 + 0x4)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- iVar6[0x4]
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
)
...>
}


@receiver_9_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(byte *)((byte *)iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- ((byte *)iVar6)[0x5]
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(byte *)(iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
)
...>
}


@receiver_9_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(undefined1 *)((byte *)iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- ((undefined1 *)iVar6)[0x5]
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(undefined1 *)(iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
)
...>
}


@receiver_9_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_high
|
- &*(char *)((byte *)iVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_high
|
- &((char *)iVar6)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_high
|
- &*(char *)(iVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_high
|
- &iVar6[0x5]
+ (char *)&((uw_object_hdr_t *)iVar6)->chain_word_high
)
...>
}


@receiver_9_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)E;
|
- ((char *)iVar6)[0x5] = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)E;
|
- *(char *)(iVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)E;
|
- iVar6[0x5] = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)E;
)
...>
}


@receiver_9_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x5)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(char *)((byte *)iVar6 + 0x5)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_high
|
- ((char *)iVar6)[0x5]
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(char *)(iVar6 + 0x5)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_high
|
- iVar6[0x5]
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_high
)
...>
}


@receiver_9_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x6) = (char)V;
- *(char *)((char *)iVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x6) = (char)V;
- *(byte *)((char *)iVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x6) = (byte)V;
- *(char *)((char *)iVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x6) = (byte)V;
- *(byte *)((char *)iVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(ushort *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- ((ushort *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(ushort *)((ushort *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(ushort *)(iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word
)
...>
}


@receiver_9_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(undefined2 *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- ((undefined2 *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(undefined2 *)((undefined2 *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(undefined2 *)(iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word
)
...>
}


@receiver_9_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
|
- *(short *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
|
- ((short *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
|
- *(short *)((short *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
|
- *(short *)(iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
)
...>
}


@receiver_9_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(byte *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- ((byte *)iVar6)[0x6]
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(byte *)((ushort *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- (byte)((ushort *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(byte *)(iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
)
...>
}


@receiver_9_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(undefined1 *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- ((undefined1 *)iVar6)[0x6]
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(undefined1 *)((ushort *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- (undefined1)((ushort *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(undefined1 *)(iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
)
...>
}


@receiver_9_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_low
|
- &*(char *)((byte *)iVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_low
|
- &((char *)iVar6)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_low
|
- &*(char *)((ushort *)iVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_low
|
- &*(char *)(iVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_low
|
- &iVar6[0x6]
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_low
)
...>
}


@receiver_9_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
|
- ((char *)iVar6)[0x6] = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
|
- *(char *)(iVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
|
- iVar6[0x6] = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
)
...>
}


@receiver_9_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x6)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(char *)((byte *)iVar6 + 0x6)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- ((char *)iVar6)[0x6]
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(char *)((ushort *)iVar6 + 0x3)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- (char)((ushort *)iVar6)[0x3]
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(char *)(iVar6 + 0x6)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- iVar6[0x6]
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
)
...>
}


@receiver_9_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(byte *)((byte *)iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- ((byte *)iVar6)[0x7]
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(byte *)(iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
)
...>
}


@receiver_9_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(undefined1 *)((byte *)iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- ((undefined1 *)iVar6)[0x7]
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(undefined1 *)(iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
)
...>
}


@receiver_9_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_high
|
- &*(char *)((byte *)iVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_high
|
- &((char *)iVar6)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_high
|
- &*(char *)(iVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_high
|
- &iVar6[0x7]
+ (char *)&((uw_object_hdr_t *)iVar6)->link_word_high
)
...>
}


@receiver_9_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_high = (byte)E;
|
- ((char *)iVar6)[0x7] = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_high = (byte)E;
|
- *(char *)(iVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_high = (byte)E;
|
- iVar6[0x7] = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_high = (byte)E;
)
...>
}


@receiver_9_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x7)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(char *)((byte *)iVar6 + 0x7)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_high
|
- ((char *)iVar6)[0x7]
+ (char)((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(char *)(iVar6 + 0x7)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_high
|
- iVar6[0x7]
+ (char)((uw_object_hdr_t *)iVar6)->link_word_high
)
...>
}


@receiver_10_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_0_0_word_ushort@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
)
...>
}


@receiver_10_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- *(undefined2 *)((byte *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- ((undefined2 *)pDropObj)[0x0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- *(undefined2 *)((undefined2 *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- *(undefined2 *)(pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
)
...>
}


@receiver_10_w_0_0_word_short@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_signed
)
...>
}


@receiver_10_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
)
...>
}


@receiver_10_w_0_0_address_0@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pDropObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- &*(char *)((byte *)pDropObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- &((char *)pDropObj)[0x0]
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- &*(char *)((ushort *)pDropObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- &*(char *)pDropObj
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- &*(char *)(pDropObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- &pDropObj[0x0]
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- &*pDropObj
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_low
)
...>
}


@receiver_10_w_0_0_store_0@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x0) = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low = (byte)E;
|
- pDropObj[0x0] = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low = (byte)E;
|
- *pDropObj = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x0)
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- pDropObj[0x0]
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *pDropObj
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high
)
...>
}


@receiver_10_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high
)
...>
}


@receiver_10_w_0_0_address_1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pDropObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- &*(char *)((byte *)pDropObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- &((char *)pDropObj)[0x1]
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- &*(char *)(pDropObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- &pDropObj[0x1]
+ (char *)&((uw_object_hdr_t *)pDropObj)->type_flags_high
)
...>
}


@receiver_10_w_0_0_store_1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x1) = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high = (byte)E;
|
- pDropObj[0x1] = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x1)
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- pDropObj[0x1]
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_high
)
...>
}


@receiver_10_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_2_17_word_ushort@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
)
...>
}


@receiver_10_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- *(undefined2 *)((byte *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- ((undefined2 *)pDropObj)[0x1]
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- *(undefined2 *)((undefined2 *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- *(undefined2 *)(pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
)
...>
}


@receiver_10_w_2_17_word_short@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_signed
)
...>
}


@receiver_10_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
)
...>
}


@receiver_10_w_2_17_address_2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pDropObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_low
|
- &*(char *)((byte *)pDropObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_low
|
- &((char *)pDropObj)[0x2]
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_low
|
- &*(char *)((ushort *)pDropObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_low
|
- &*(char *)(pDropObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_low
|
- &pDropObj[0x2]
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_low
)
...>
}


@receiver_10_w_2_17_store_2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x2) = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_low = (byte)E;
|
- pDropObj[0x2] = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_low = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x2)
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_low
|
- pDropObj[0x2]
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->position_word_high
)
...>
}


@receiver_10_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->position_word_high
)
...>
}


@receiver_10_w_2_17_address_3@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pDropObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_high
|
- &*(char *)((byte *)pDropObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_high
|
- &((char *)pDropObj)[0x3]
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_high
|
- &*(char *)(pDropObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_high
|
- &pDropObj[0x3]
+ (char *)&((uw_object_hdr_t *)pDropObj)->position_word_high
)
...>
}


@receiver_10_w_2_17_store_3@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x3) = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_high = (byte)E;
|
- pDropObj[0x3] = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_high = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x3)
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_high
|
- pDropObj[0x3]
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_high
)
...>
}


@receiver_10_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_4_34_word_ushort@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
)
...>
}


@receiver_10_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- *(undefined2 *)((byte *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- ((undefined2 *)pDropObj)[0x2]
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- *(undefined2 *)((undefined2 *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- *(undefined2 *)(pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
)
...>
}


@receiver_10_w_4_34_word_short@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_signed
)
...>
}


@receiver_10_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
)
...>
}


@receiver_10_w_4_34_address_4@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pDropObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- &*(char *)((byte *)pDropObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- &((char *)pDropObj)[0x4]
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- &*(char *)((ushort *)pDropObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- &*(char *)(pDropObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- &pDropObj[0x4]
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_low
)
...>
}


@receiver_10_w_4_34_store_4@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x4) = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low = (byte)E;
|
- pDropObj[0x4] = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x4)
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- pDropObj[0x4]
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pDropObj + 0x5)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high
)
...>
}


@receiver_10_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pDropObj + 0x5)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high
)
...>
}


@receiver_10_w_4_34_address_5@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pDropObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- &*(char *)((byte *)pDropObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- &((char *)pDropObj)[0x5]
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- &*(char *)(pDropObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- &pDropObj[0x5]
+ (char *)&((uw_object_hdr_t *)pDropObj)->chain_word_high
)
...>
}


@receiver_10_w_4_34_store_5@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x5) = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high = (byte)E;
|
- pDropObj[0x5] = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x5)
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- pDropObj[0x5]
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_high
)
...>
}


@receiver_10_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
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

@receiver_10_w_6_51_word_ushort@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
)
...>
}


@receiver_10_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- *(undefined2 *)((byte *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- ((undefined2 *)pDropObj)[0x3]
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- *(undefined2 *)((undefined2 *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- *(undefined2 *)(pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
)
...>
}


@receiver_10_w_6_51_word_short@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_signed
)
...>
}


@receiver_10_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
)
...>
}


@receiver_10_w_6_51_address_6@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pDropObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_low
|
- &*(char *)((byte *)pDropObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_low
|
- &((char *)pDropObj)[0x6]
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_low
|
- &*(char *)((ushort *)pDropObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_low
|
- &*(char *)(pDropObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_low
|
- &pDropObj[0x6]
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_low
)
...>
}


@receiver_10_w_6_51_store_6@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x6) = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_low = (byte)E;
|
- pDropObj[0x6] = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_low = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x6)
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_low
|
- pDropObj[0x6]
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pDropObj + 0x7)
+ ((uw_object_hdr_t *)pDropObj)->link_word_high
)
...>
}


@receiver_10_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pDropObj + 0x7)
+ ((uw_object_hdr_t *)pDropObj)->link_word_high
)
...>
}


@receiver_10_w_6_51_address_7@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pDropObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_high
|
- &*(char *)((byte *)pDropObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_high
|
- &((char *)pDropObj)[0x7]
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_high
|
- &*(char *)(pDropObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_high
|
- &pDropObj[0x7]
+ (char *)&((uw_object_hdr_t *)pDropObj)->link_word_high
)
...>
}


@receiver_10_w_6_51_store_7@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x7) = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_high = (byte)E;
|
- pDropObj[0x7] = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_high = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pDropObj + 0x7)
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_high
|
- pDropObj[0x7]
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_high
)
...>
}


@receiver_11_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_0_0_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_address_0@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_store_0@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_address_1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_store_1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_2_17_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_address_2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_store_2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_address_3@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_store_3@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_4_34_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_address_4@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_store_4@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_address_5@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_store_5@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_11_w_6_51_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_address_6@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_store_6@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_address_7@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_store_7@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_11_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_12_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_0_0_word_ushort@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_word_short@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_address_0@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_store_0@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_address_1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_store_1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_2_17_word_ushort@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_word_short@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_address_2@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_store_2@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_address_3@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_store_3@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_4_34_word_ushort@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_word_short@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_address_4@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_store_4@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_address_5@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_store_5@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@receiver_12_w_6_51_word_ushort@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_word_short@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_address_6@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_store_6@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_address_7@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_store_7@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_12_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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


@receiver_13_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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

@receiver_13_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_13_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\)$";
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


@receiver_14_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x0) = (char)V;
- *(char *)((char *)npc_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x0) = (char)V;
- *(byte *)((char *)npc_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x0) = (byte)V;
- *(char *)((char *)npc_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x0) = (byte)V;
- *(byte *)((char *)npc_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(ushort *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- ((ushort *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(ushort *)((ushort *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(ushort *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
)
...>
}


@receiver_14_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(undefined2 *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- ((undefined2 *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(undefined2 *)((undefined2 *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(undefined2 *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
)
...>
}


@receiver_14_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
|
- *(short *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
|
- ((short *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
|
- *(short *)((short *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
|
- *(short *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
)
...>
}


@receiver_14_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(byte *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- ((byte *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(byte *)((ushort *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- (byte)((ushort *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(byte *)npc_rec
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(byte *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
)
...>
}


@receiver_14_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(undefined1 *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- ((undefined1 *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(undefined1 *)((ushort *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- (undefined1)((ushort *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(undefined1 *)npc_rec
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(undefined1 *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
)
...>
}


@receiver_14_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*(char *)((byte *)npc_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &((char *)npc_rec)[0x0]
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*(char *)((ushort *)npc_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*(char *)npc_rec
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*(char *)(npc_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &npc_rec[0x0]
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*npc_rec
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
)
...>
}


@receiver_14_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x0) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x0) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- ((char *)npc_rec)[0x0] = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0x0) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *(char *)npc_rec = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *(char *)(npc_rec + 0x0) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- npc_rec[0x0] = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *npc_rec = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
)
...>
}


@receiver_14_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x0)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(char *)((byte *)npc_rec + 0x0)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- ((char *)npc_rec)[0x0]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(char *)((ushort *)npc_rec + 0x0)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- (char)((ushort *)npc_rec)[0x0]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(char *)npc_rec
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(char *)(npc_rec + 0x0)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- npc_rec[0x0]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *npc_rec
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
)
...>
}


@receiver_14_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(byte *)((byte *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- ((byte *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(byte *)(npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
)
...>
}


@receiver_14_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(undefined1 *)((byte *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- ((undefined1 *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(undefined1 *)(npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
)
...>
}


@receiver_14_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- &*(char *)((byte *)npc_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- &((char *)npc_rec)[0x1]
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- &*(char *)(npc_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- &npc_rec[0x1]
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
)
...>
}


@receiver_14_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x1) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x1) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
|
- ((char *)npc_rec)[0x1] = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
|
- *(char *)(npc_rec + 0x1) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
|
- npc_rec[0x1] = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
)
...>
}


@receiver_14_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x1)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(char *)((byte *)npc_rec + 0x1)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- ((char *)npc_rec)[0x1]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(char *)(npc_rec + 0x1)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- npc_rec[0x1]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
)
...>
}


@receiver_14_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x2) = (char)V;
- *(char *)((char *)npc_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x2) = (char)V;
- *(byte *)((char *)npc_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x2) = (byte)V;
- *(char *)((char *)npc_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x2) = (byte)V;
- *(byte *)((char *)npc_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(ushort *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- ((ushort *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(ushort *)((ushort *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(ushort *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
)
...>
}


@receiver_14_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(undefined2 *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- ((undefined2 *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(undefined2 *)((undefined2 *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(undefined2 *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
)
...>
}


@receiver_14_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
|
- *(short *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
|
- ((short *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
|
- *(short *)((short *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
|
- *(short *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
)
...>
}


@receiver_14_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(byte *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- ((byte *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(byte *)((ushort *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- (byte)((ushort *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(byte *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
)
...>
}


@receiver_14_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(undefined1 *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- ((undefined1 *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(undefined1 *)((ushort *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- (undefined1)((ushort *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(undefined1 *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
)
...>
}


@receiver_14_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &*(char *)((byte *)npc_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &((char *)npc_rec)[0x2]
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &*(char *)((ushort *)npc_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &*(char *)(npc_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &npc_rec[0x2]
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
)
...>
}


@receiver_14_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x2) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x2) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- ((char *)npc_rec)[0x2] = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0x1) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- *(char *)(npc_rec + 0x2) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- npc_rec[0x2] = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
)
...>
}


@receiver_14_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x2)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(char *)((byte *)npc_rec + 0x2)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- ((char *)npc_rec)[0x2]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(char *)((ushort *)npc_rec + 0x1)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- (char)((ushort *)npc_rec)[0x1]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(char *)(npc_rec + 0x2)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- npc_rec[0x2]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
)
...>
}


@receiver_14_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(byte *)((byte *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- ((byte *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(byte *)(npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
)
...>
}


@receiver_14_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(undefined1 *)((byte *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- ((undefined1 *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(undefined1 *)(npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
)
...>
}


@receiver_14_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
|
- &*(char *)((byte *)npc_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
|
- &((char *)npc_rec)[0x3]
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
|
- &*(char *)(npc_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
|
- &npc_rec[0x3]
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
)
...>
}


@receiver_14_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x3) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x3) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
|
- ((char *)npc_rec)[0x3] = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
|
- *(char *)(npc_rec + 0x3) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
|
- npc_rec[0x3] = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
)
...>
}


@receiver_14_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x3)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(char *)((byte *)npc_rec + 0x3)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
|
- ((char *)npc_rec)[0x3]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(char *)(npc_rec + 0x3)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
|
- npc_rec[0x3]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
)
...>
}


@receiver_14_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x4) = (char)V;
- *(char *)((char *)npc_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x4) = (char)V;
- *(byte *)((char *)npc_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x4) = (byte)V;
- *(char *)((char *)npc_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x4) = (byte)V;
- *(byte *)((char *)npc_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(ushort *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- ((ushort *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(ushort *)((ushort *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(ushort *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
)
...>
}


@receiver_14_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(undefined2 *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- ((undefined2 *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(undefined2 *)((undefined2 *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(undefined2 *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
)
...>
}


@receiver_14_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
|
- *(short *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
|
- ((short *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
|
- *(short *)((short *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
|
- *(short *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
)
...>
}


@receiver_14_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(byte *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- ((byte *)npc_rec)[0x4]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(byte *)((ushort *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- (byte)((ushort *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(byte *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
)
...>
}


@receiver_14_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(undefined1 *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- ((undefined1 *)npc_rec)[0x4]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(undefined1 *)((ushort *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- (undefined1)((ushort *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(undefined1 *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
)
...>
}


@receiver_14_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &*(char *)((byte *)npc_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &((char *)npc_rec)[0x4]
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &*(char *)((ushort *)npc_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &*(char *)(npc_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &npc_rec[0x4]
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
)
...>
}


@receiver_14_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x4) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x4) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- ((char *)npc_rec)[0x4] = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0x2) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- *(char *)(npc_rec + 0x4) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- npc_rec[0x4] = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
)
...>
}


@receiver_14_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x4)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(char *)((byte *)npc_rec + 0x4)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- ((char *)npc_rec)[0x4]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(char *)((ushort *)npc_rec + 0x2)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- (char)((ushort *)npc_rec)[0x2]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(char *)(npc_rec + 0x4)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- npc_rec[0x4]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
)
...>
}


@receiver_14_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(byte *)((byte *)npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- ((byte *)npc_rec)[0x5]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(byte *)(npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
)
...>
}


@receiver_14_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(undefined1 *)((byte *)npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- ((undefined1 *)npc_rec)[0x5]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(undefined1 *)(npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
)
...>
}


@receiver_14_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- &*(char *)((byte *)npc_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- &((char *)npc_rec)[0x5]
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- &*(char *)(npc_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- &npc_rec[0x5]
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
)
...>
}


@receiver_14_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x5) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x5) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
|
- ((char *)npc_rec)[0x5] = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
|
- *(char *)(npc_rec + 0x5) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
|
- npc_rec[0x5] = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
)
...>
}


@receiver_14_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x5)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(char *)((byte *)npc_rec + 0x5)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- ((char *)npc_rec)[0x5]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(char *)(npc_rec + 0x5)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- npc_rec[0x5]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
)
...>
}


@receiver_14_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x6) = (char)V;
- *(char *)((char *)npc_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x6) = (char)V;
- *(byte *)((char *)npc_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x6) = (byte)V;
- *(char *)((char *)npc_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x6) = (byte)V;
- *(byte *)((char *)npc_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(ushort *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- ((ushort *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(ushort *)((ushort *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(ushort *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
)
...>
}


@receiver_14_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(undefined2 *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- ((undefined2 *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(undefined2 *)((undefined2 *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(undefined2 *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
)
...>
}


@receiver_14_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
|
- *(short *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
|
- ((short *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
|
- *(short *)((short *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
|
- *(short *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
)
...>
}


@receiver_14_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(byte *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- ((byte *)npc_rec)[0x6]
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(byte *)((ushort *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- (byte)((ushort *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(byte *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
)
...>
}


@receiver_14_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(undefined1 *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- ((undefined1 *)npc_rec)[0x6]
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(undefined1 *)((ushort *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- (undefined1)((ushort *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(undefined1 *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
)
...>
}


@receiver_14_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &*(char *)((byte *)npc_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &((char *)npc_rec)[0x6]
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &*(char *)((ushort *)npc_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &*(char *)(npc_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &npc_rec[0x6]
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
)
...>
}


@receiver_14_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x6) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x6) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- ((char *)npc_rec)[0x6] = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0x3) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- *(char *)(npc_rec + 0x6) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- npc_rec[0x6] = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
)
...>
}


@receiver_14_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x6)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(char *)((byte *)npc_rec + 0x6)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- ((char *)npc_rec)[0x6]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(char *)((ushort *)npc_rec + 0x3)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- (char)((ushort *)npc_rec)[0x3]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(char *)(npc_rec + 0x6)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- npc_rec[0x6]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
)
...>
}


@receiver_14_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(byte *)((byte *)npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- ((byte *)npc_rec)[0x7]
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(byte *)(npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
)
...>
}


@receiver_14_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(undefined1 *)((byte *)npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- ((undefined1 *)npc_rec)[0x7]
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(undefined1 *)(npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
)
...>
}


@receiver_14_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
|
- &*(char *)((byte *)npc_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
|
- &((char *)npc_rec)[0x7]
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
|
- &*(char *)(npc_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
|
- &npc_rec[0x7]
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
)
...>
}


@receiver_14_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x7) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x7) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
|
- ((char *)npc_rec)[0x7] = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
|
- *(char *)(npc_rec + 0x7) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
|
- npc_rec[0x7] = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
)
...>
}


@receiver_14_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x7)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(char *)((byte *)npc_rec + 0x7)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
|
- ((char *)npc_rec)[0x7]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(char *)(npc_rec + 0x7)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
|
- npc_rec[0x7]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
)
...>
}


@receiver_15_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_0_0_word_ushort@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(ushort *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}


@receiver_15_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined2 *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}


@receiver_15_w_0_0_word_short@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(short *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_signed
)
...>
}


@receiver_15_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(byte *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined1 *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_15_w_0_0_address_0@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- &*(char *)(npc + 0x0)
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
|
- &npc[0x0]
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
|
- &*npc
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_15_w_0_0_store_0@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x0) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- npc[0x0] = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- *npc = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x0)
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- npc[0x0]
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- *npc
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(byte *)(npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_15_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined1 *)(npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_15_w_0_0_address_1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- &*(char *)(npc + 0x1)
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_high
|
- &npc[0x1]
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_15_w_0_0_store_1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x1) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_high = (byte)E;
|
- npc[0x1] = E;
+ ((uw_object_hdr_t *)npc)->type_flags_high = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x1)
+ (char)((uw_object_hdr_t *)npc)->type_flags_high
|
- npc[0x1]
+ (char)((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_15_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_2_17_word_ushort@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(ushort *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}


@receiver_15_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined2 *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}


@receiver_15_w_2_17_word_short@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(short *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_signed
)
...>
}


@receiver_15_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(byte *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_15_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined1 *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_15_w_2_17_address_2@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- &*(char *)(npc + 0x2)
+ (char *)&((uw_object_hdr_t *)npc)->position_word_low
|
- &npc[0x2]
+ (char *)&((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_15_w_2_17_store_2@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x2) = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
|
- npc[0x2] = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
)
...>
}


@receiver_15_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x2)
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- npc[0x2]
+ (char)((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_15_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(byte *)(npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_15_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined1 *)(npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_15_w_2_17_address_3@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- &*(char *)(npc + 0x3)
+ (char *)&((uw_object_hdr_t *)npc)->position_word_high
|
- &npc[0x3]
+ (char *)&((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_15_w_2_17_store_3@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x3) = E;
+ ((uw_object_hdr_t *)npc)->position_word_high = (byte)E;
|
- npc[0x3] = E;
+ ((uw_object_hdr_t *)npc)->position_word_high = (byte)E;
)
...>
}


@receiver_15_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x3)
+ (char)((uw_object_hdr_t *)npc)->position_word_high
|
- npc[0x3]
+ (char)((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_15_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_4_34_word_ushort@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(ushort *)(npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}


@receiver_15_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined2 *)(npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}


@receiver_15_w_4_34_word_short@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(short *)(npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_signed
)
...>
}


@receiver_15_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(byte *)(npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_15_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined1 *)(npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_15_w_4_34_address_4@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- &*(char *)(npc + 0x4)
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_low
|
- &npc[0x4]
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_15_w_4_34_store_4@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x4) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
|
- npc[0x4] = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
)
...>
}


@receiver_15_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x4)
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- npc[0x4]
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_15_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(byte *)(npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_15_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined1 *)(npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_15_w_4_34_address_5@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- &*(char *)(npc + 0x5)
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_high
|
- &npc[0x5]
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_15_w_4_34_store_5@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x5) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_high = (byte)E;
|
- npc[0x5] = E;
+ ((uw_object_hdr_t *)npc)->chain_word_high = (byte)E;
)
...>
}


@receiver_15_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x5)
+ (char)((uw_object_hdr_t *)npc)->chain_word_high
|
- npc[0x5]
+ (char)((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_15_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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

@receiver_15_w_6_51_word_ushort@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(ushort *)(npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}


@receiver_15_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined2 *)(npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}


@receiver_15_w_6_51_word_short@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(short *)(npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_signed
)
...>
}


@receiver_15_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(byte *)(npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_15_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined1 *)(npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_15_w_6_51_address_6@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- &*(char *)(npc + 0x6)
+ (char *)&((uw_object_hdr_t *)npc)->link_word_low
|
- &npc[0x6]
+ (char *)&((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_15_w_6_51_store_6@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x6) = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
|
- npc[0x6] = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
)
...>
}


@receiver_15_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x6)
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- npc[0x6]
+ (char)((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_15_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(byte *)(npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_15_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(undefined1 *)(npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_15_w_6_51_address_7@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- &*(char *)(npc + 0x7)
+ (char *)&((uw_object_hdr_t *)npc)->link_word_high
|
- &npc[0x7]
+ (char *)&((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_15_w_6_51_store_7@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x7) = E;
+ ((uw_object_hdr_t *)npc)->link_word_high = (byte)E;
|
- npc[0x7] = E;
+ ((uw_object_hdr_t *)npc)->link_word_high = (byte)E;
)
...>
}


@receiver_15_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
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
|
- *(char *)(npc + 0x7)
+ (char)((uw_object_hdr_t *)npc)->link_word_high
|
- npc[0x7]
+ (char)((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_16_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_ptr + 0x0) = (char)V;
- *(char *)((char *)npc_ptr + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_ptr + 0x0) = (char)V;
- *(byte *)((char *)npc_ptr + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_ptr + 0x0) = (byte)V;
- *(char *)((char *)npc_ptr + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_ptr + 0x0) = (byte)V;
- *(byte *)((char *)npc_ptr + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
|
- *(ushort *)((byte *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
|
- ((ushort *)npc_ptr)[0x0]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
|
- *(ushort *)((ushort *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
)
...>
}


@receiver_16_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
|
- *(undefined2 *)((byte *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
|
- ((undefined2 *)npc_ptr)[0x0]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
|
- *(undefined2 *)((undefined2 *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
)
...>
}


@receiver_16_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_signed
|
- *(short *)((byte *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_signed
|
- ((short *)npc_ptr)[0x0]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_signed
|
- *(short *)((short *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_signed
)
...>
}


@receiver_16_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(byte *)((byte *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- ((byte *)npc_ptr)[0x0]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(byte *)((ushort *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- (byte)((ushort *)npc_ptr)[0x0]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(byte *)npc_ptr
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
)
...>
}


@receiver_16_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(undefined1 *)((byte *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- ((undefined1 *)npc_ptr)[0x0]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(undefined1 *)((ushort *)npc_ptr + 0x0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- (undefined1)((ushort *)npc_ptr)[0x0]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(undefined1 *)npc_ptr
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low
)
...>
}


@receiver_16_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- &*(char *)((byte *)npc_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- &((char *)npc_ptr)[0x0]
+ (char *)&((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- &*(char *)((ushort *)npc_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- &*(char *)npc_ptr
+ (char *)&((uw_object_hdr_t *)npc_ptr)->type_flags_low
)
...>
}


@receiver_16_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low = (byte)E;
|
- *(char *)((byte *)npc_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low = (byte)E;
|
- ((char *)npc_ptr)[0x0] = E;
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)npc_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low = (byte)E;
|
- *(char *)npc_ptr = E;
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_low = (byte)E;
)
...>
}


@receiver_16_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x0)
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(char *)((byte *)npc_ptr + 0x0)
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- ((char *)npc_ptr)[0x0]
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(char *)((ushort *)npc_ptr + 0x0)
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- (char)((ushort *)npc_ptr)[0x0]
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_low
|
- *(char *)npc_ptr
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_low
)
...>
}


@receiver_16_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high
|
- *(byte *)((byte *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high
|
- ((byte *)npc_ptr)[0x1]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high
)
...>
}


@receiver_16_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high
|
- *(undefined1 *)((byte *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high
|
- ((undefined1 *)npc_ptr)[0x1]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high
)
...>
}


@receiver_16_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->type_flags_high
|
- &*(char *)((byte *)npc_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->type_flags_high
|
- &((char *)npc_ptr)[0x1]
+ (char *)&((uw_object_hdr_t *)npc_ptr)->type_flags_high
)
...>
}


@receiver_16_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high = (byte)E;
|
- *(char *)((byte *)npc_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high = (byte)E;
|
- ((char *)npc_ptr)[0x1] = E;
+ ((uw_object_hdr_t *)npc_ptr)->type_flags_high = (byte)E;
)
...>
}


@receiver_16_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x1)
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_high
|
- *(char *)((byte *)npc_ptr + 0x1)
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_high
|
- ((char *)npc_ptr)[0x1]
+ (char)((uw_object_hdr_t *)npc_ptr)->type_flags_high
)
...>
}


@receiver_16_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_ptr + 0x2) = (char)V;
- *(char *)((char *)npc_ptr + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_ptr + 0x2) = (char)V;
- *(byte *)((char *)npc_ptr + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_ptr + 0x2) = (byte)V;
- *(char *)((char *)npc_ptr + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_ptr + 0x2) = (byte)V;
- *(byte *)((char *)npc_ptr + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word
|
- *(ushort *)((byte *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word
|
- ((ushort *)npc_ptr)[0x1]
+ ((uw_object_hdr_t *)npc_ptr)->position_word
|
- *(ushort *)((ushort *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->position_word
)
...>
}


@receiver_16_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word
|
- *(undefined2 *)((byte *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word
|
- ((undefined2 *)npc_ptr)[0x1]
+ ((uw_object_hdr_t *)npc_ptr)->position_word
|
- *(undefined2 *)((undefined2 *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->position_word
)
...>
}


@receiver_16_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_signed
|
- *(short *)((byte *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_signed
|
- ((short *)npc_ptr)[0x1]
+ ((uw_object_hdr_t *)npc_ptr)->position_word_signed
|
- *(short *)((short *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_signed
)
...>
}


@receiver_16_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- *(byte *)((byte *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- ((byte *)npc_ptr)[0x2]
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- *(byte *)((ushort *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- (byte)((ushort *)npc_ptr)[0x1]
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
)
...>
}


@receiver_16_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- *(undefined1 *)((byte *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- ((undefined1 *)npc_ptr)[0x2]
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- *(undefined1 *)((ushort *)npc_ptr + 0x1)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- (undefined1)((ushort *)npc_ptr)[0x1]
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low
)
...>
}


@receiver_16_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- &*(char *)((byte *)npc_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- &((char *)npc_ptr)[0x2]
+ (char *)&((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- &*(char *)((ushort *)npc_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->position_word_low
)
...>
}


@receiver_16_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low = (byte)E;
|
- *(char *)((byte *)npc_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low = (byte)E;
|
- ((char *)npc_ptr)[0x2] = E;
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low = (byte)E;
|
- *(char *)((ushort *)npc_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)npc_ptr)->position_word_low = (byte)E;
)
...>
}


@receiver_16_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x2)
+ (char)((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- *(char *)((byte *)npc_ptr + 0x2)
+ (char)((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- ((char *)npc_ptr)[0x2]
+ (char)((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- *(char *)((ushort *)npc_ptr + 0x1)
+ (char)((uw_object_hdr_t *)npc_ptr)->position_word_low
|
- (char)((ushort *)npc_ptr)[0x1]
+ (char)((uw_object_hdr_t *)npc_ptr)->position_word_low
)
...>
}


@receiver_16_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high
|
- *(byte *)((byte *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high
|
- ((byte *)npc_ptr)[0x3]
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high
)
...>
}


@receiver_16_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high
|
- *(undefined1 *)((byte *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high
|
- ((undefined1 *)npc_ptr)[0x3]
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high
)
...>
}


@receiver_16_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->position_word_high
|
- &*(char *)((byte *)npc_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->position_word_high
|
- &((char *)npc_ptr)[0x3]
+ (char *)&((uw_object_hdr_t *)npc_ptr)->position_word_high
)
...>
}


@receiver_16_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high = (byte)E;
|
- *(char *)((byte *)npc_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high = (byte)E;
|
- ((char *)npc_ptr)[0x3] = E;
+ ((uw_object_hdr_t *)npc_ptr)->position_word_high = (byte)E;
)
...>
}


@receiver_16_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x3)
+ (char)((uw_object_hdr_t *)npc_ptr)->position_word_high
|
- *(char *)((byte *)npc_ptr + 0x3)
+ (char)((uw_object_hdr_t *)npc_ptr)->position_word_high
|
- ((char *)npc_ptr)[0x3]
+ (char)((uw_object_hdr_t *)npc_ptr)->position_word_high
)
...>
}


@receiver_16_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_ptr + 0x4) = (char)V;
- *(char *)((char *)npc_ptr + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_ptr + 0x4) = (char)V;
- *(byte *)((char *)npc_ptr + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_ptr + 0x4) = (byte)V;
- *(char *)((char *)npc_ptr + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_ptr + 0x4) = (byte)V;
- *(byte *)((char *)npc_ptr + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
|
- *(ushort *)((byte *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
|
- ((ushort *)npc_ptr)[0x2]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
|
- *(ushort *)((ushort *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
)
...>
}


@receiver_16_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
|
- *(undefined2 *)((byte *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
|
- ((undefined2 *)npc_ptr)[0x2]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
|
- *(undefined2 *)((undefined2 *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
)
...>
}


@receiver_16_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_signed
|
- *(short *)((byte *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_signed
|
- ((short *)npc_ptr)[0x2]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_signed
|
- *(short *)((short *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_signed
)
...>
}


@receiver_16_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- *(byte *)((byte *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- ((byte *)npc_ptr)[0x4]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- *(byte *)((ushort *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- (byte)((ushort *)npc_ptr)[0x2]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
)
...>
}


@receiver_16_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- *(undefined1 *)((byte *)npc_ptr + 0x4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- ((undefined1 *)npc_ptr)[0x4]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- *(undefined1 *)((ushort *)npc_ptr + 0x2)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- (undefined1)((ushort *)npc_ptr)[0x2]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low
)
...>
}


@receiver_16_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_ptr + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- &*(char *)((byte *)npc_ptr + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- &((char *)npc_ptr)[0x4]
+ (char *)&((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- &*(char *)((ushort *)npc_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->chain_word_low
)
...>
}


@receiver_16_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x4) = E;
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low = (byte)E;
|
- *(char *)((byte *)npc_ptr + 0x4) = E;
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low = (byte)E;
|
- ((char *)npc_ptr)[0x4] = E;
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)npc_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_low = (byte)E;
)
...>
}


@receiver_16_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x4)
+ (char)((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- *(char *)((byte *)npc_ptr + 0x4)
+ (char)((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- ((char *)npc_ptr)[0x4]
+ (char)((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- *(char *)((ushort *)npc_ptr + 0x2)
+ (char)((uw_object_hdr_t *)npc_ptr)->chain_word_low
|
- (char)((ushort *)npc_ptr)[0x2]
+ (char)((uw_object_hdr_t *)npc_ptr)->chain_word_low
)
...>
}


@receiver_16_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_ptr + 0x5)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high
|
- *(byte *)((byte *)npc_ptr + 0x5)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high
|
- ((byte *)npc_ptr)[0x5]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high
)
...>
}


@receiver_16_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_ptr + 0x5)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high
|
- *(undefined1 *)((byte *)npc_ptr + 0x5)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high
|
- ((undefined1 *)npc_ptr)[0x5]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high
)
...>
}


@receiver_16_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_ptr + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->chain_word_high
|
- &*(char *)((byte *)npc_ptr + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->chain_word_high
|
- &((char *)npc_ptr)[0x5]
+ (char *)&((uw_object_hdr_t *)npc_ptr)->chain_word_high
)
...>
}


@receiver_16_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x5) = E;
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high = (byte)E;
|
- *(char *)((byte *)npc_ptr + 0x5) = E;
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high = (byte)E;
|
- ((char *)npc_ptr)[0x5] = E;
+ ((uw_object_hdr_t *)npc_ptr)->chain_word_high = (byte)E;
)
...>
}


@receiver_16_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x5)
+ (char)((uw_object_hdr_t *)npc_ptr)->chain_word_high
|
- *(char *)((byte *)npc_ptr + 0x5)
+ (char)((uw_object_hdr_t *)npc_ptr)->chain_word_high
|
- ((char *)npc_ptr)[0x5]
+ (char)((uw_object_hdr_t *)npc_ptr)->chain_word_high
)
...>
}


@receiver_16_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_ptr + 0x6) = (char)V;
- *(char *)((char *)npc_ptr + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_ptr + 0x6) = (char)V;
- *(byte *)((char *)npc_ptr + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_ptr + 0x6) = (byte)V;
- *(char *)((char *)npc_ptr + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_ptr + 0x6) = (byte)V;
- *(byte *)((char *)npc_ptr + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_ptr)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word
|
- *(ushort *)((byte *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word
|
- ((ushort *)npc_ptr)[0x3]
+ ((uw_object_hdr_t *)npc_ptr)->link_word
|
- *(ushort *)((ushort *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->link_word
)
...>
}


@receiver_16_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word
|
- *(undefined2 *)((byte *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word
|
- ((undefined2 *)npc_ptr)[0x3]
+ ((uw_object_hdr_t *)npc_ptr)->link_word
|
- *(undefined2 *)((undefined2 *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->link_word
)
...>
}


@receiver_16_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_signed
|
- *(short *)((byte *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_signed
|
- ((short *)npc_ptr)[0x3]
+ ((uw_object_hdr_t *)npc_ptr)->link_word_signed
|
- *(short *)((short *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_signed
)
...>
}


@receiver_16_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- *(byte *)((byte *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- ((byte *)npc_ptr)[0x6]
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- *(byte *)((ushort *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- (byte)((ushort *)npc_ptr)[0x3]
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
)
...>
}


@receiver_16_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- *(undefined1 *)((byte *)npc_ptr + 0x6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- ((undefined1 *)npc_ptr)[0x6]
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- *(undefined1 *)((ushort *)npc_ptr + 0x3)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- (undefined1)((ushort *)npc_ptr)[0x3]
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low
)
...>
}


@receiver_16_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_ptr + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- &*(char *)((byte *)npc_ptr + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- &((char *)npc_ptr)[0x6]
+ (char *)&((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- &*(char *)((ushort *)npc_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->link_word_low
)
...>
}


@receiver_16_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x6) = E;
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low = (byte)E;
|
- *(char *)((byte *)npc_ptr + 0x6) = E;
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low = (byte)E;
|
- ((char *)npc_ptr)[0x6] = E;
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low = (byte)E;
|
- *(char *)((ushort *)npc_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)npc_ptr)->link_word_low = (byte)E;
)
...>
}


@receiver_16_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x6)
+ (char)((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- *(char *)((byte *)npc_ptr + 0x6)
+ (char)((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- ((char *)npc_ptr)[0x6]
+ (char)((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- *(char *)((ushort *)npc_ptr + 0x3)
+ (char)((uw_object_hdr_t *)npc_ptr)->link_word_low
|
- (char)((ushort *)npc_ptr)[0x3]
+ (char)((uw_object_hdr_t *)npc_ptr)->link_word_low
)
...>
}


@receiver_16_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_ptr + 0x7)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high
|
- *(byte *)((byte *)npc_ptr + 0x7)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high
|
- ((byte *)npc_ptr)[0x7]
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high
)
...>
}


@receiver_16_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_ptr + 0x7)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high
|
- *(undefined1 *)((byte *)npc_ptr + 0x7)
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high
|
- ((undefined1 *)npc_ptr)[0x7]
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high
)
...>
}


@receiver_16_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_ptr + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->link_word_high
|
- &*(char *)((byte *)npc_ptr + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_ptr)->link_word_high
|
- &((char *)npc_ptr)[0x7]
+ (char *)&((uw_object_hdr_t *)npc_ptr)->link_word_high
)
...>
}


@receiver_16_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x7) = E;
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high = (byte)E;
|
- *(char *)((byte *)npc_ptr + 0x7) = E;
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high = (byte)E;
|
- ((char *)npc_ptr)[0x7] = E;
+ ((uw_object_hdr_t *)npc_ptr)->link_word_high = (byte)E;
)
...>
}


@receiver_16_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_ptr + 0x7)
+ (char)((uw_object_hdr_t *)npc_ptr)->link_word_high
|
- *(char *)((byte *)npc_ptr + 0x7)
+ (char)((uw_object_hdr_t *)npc_ptr)->link_word_high
|
- ((char *)npc_ptr)[0x7]
+ (char)((uw_object_hdr_t *)npc_ptr)->link_word_high
)
...>
}


@receiver_17_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_npc + 0x0) = (char)V;
- *(char *)((char *)saved_npc + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->type_flags = (ushort)V;

...>
}

@receiver_17_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_npc + 0x0) = (char)V;
- *(byte *)((char *)saved_npc + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->type_flags = (ushort)V;

...>
}

@receiver_17_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_npc + 0x0) = (byte)V;
- *(char *)((char *)saved_npc + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->type_flags = (ushort)V;

...>
}

@receiver_17_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_npc + 0x0) = (byte)V;
- *(byte *)((char *)saved_npc + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->type_flags = (ushort)V;

...>
}

@receiver_17_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags
|
- *(ushort *)((byte *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags
|
- ((ushort *)saved_npc)[0x0]
+ ((uw_object_hdr_t *)saved_npc)->type_flags
|
- *(ushort *)((ushort *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags
)
...>
}


@receiver_17_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags
|
- *(undefined2 *)((byte *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags
|
- ((undefined2 *)saved_npc)[0x0]
+ ((uw_object_hdr_t *)saved_npc)->type_flags
|
- *(undefined2 *)((undefined2 *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags
)
...>
}


@receiver_17_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_signed
|
- *(short *)((byte *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_signed
|
- ((short *)saved_npc)[0x0]
+ ((uw_object_hdr_t *)saved_npc)->type_flags_signed
|
- *(short *)((short *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_signed
)
...>
}


@receiver_17_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(byte *)((byte *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- ((byte *)saved_npc)[0x0]
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(byte *)((ushort *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- (byte)((ushort *)saved_npc)[0x0]
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(byte *)saved_npc
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
)
...>
}


@receiver_17_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(undefined1 *)((byte *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- ((undefined1 *)saved_npc)[0x0]
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(undefined1 *)((ushort *)saved_npc + 0x0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- (undefined1)((ushort *)saved_npc)[0x0]
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(undefined1 *)saved_npc
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low
)
...>
}


@receiver_17_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0x0)
+ (char *)&((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- &*(char *)((byte *)saved_npc + 0x0)
+ (char *)&((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- &((char *)saved_npc)[0x0]
+ (char *)&((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- &*(char *)((ushort *)saved_npc + 0x0)
+ (char *)&((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- &*(char *)saved_npc
+ (char *)&((uw_object_hdr_t *)saved_npc)->type_flags_low
)
...>
}


@receiver_17_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x0) = E;
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low = (byte)E;
|
- *(char *)((byte *)saved_npc + 0x0) = E;
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low = (byte)E;
|
- ((char *)saved_npc)[0x0] = E;
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)saved_npc + 0x0) = E;
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low = (byte)E;
|
- *(char *)saved_npc = E;
+ ((uw_object_hdr_t *)saved_npc)->type_flags_low = (byte)E;
)
...>
}


@receiver_17_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x0)
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(char *)((byte *)saved_npc + 0x0)
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- ((char *)saved_npc)[0x0]
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(char *)((ushort *)saved_npc + 0x0)
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- (char)((ushort *)saved_npc)[0x0]
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_low
|
- *(char *)saved_npc
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_low
)
...>
}


@receiver_17_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high
|
- *(byte *)((byte *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high
|
- ((byte *)saved_npc)[0x1]
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high
)
...>
}


@receiver_17_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high
|
- *(undefined1 *)((byte *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high
|
- ((undefined1 *)saved_npc)[0x1]
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high
)
...>
}


@receiver_17_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0x1)
+ (char *)&((uw_object_hdr_t *)saved_npc)->type_flags_high
|
- &*(char *)((byte *)saved_npc + 0x1)
+ (char *)&((uw_object_hdr_t *)saved_npc)->type_flags_high
|
- &((char *)saved_npc)[0x1]
+ (char *)&((uw_object_hdr_t *)saved_npc)->type_flags_high
)
...>
}


@receiver_17_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x1) = E;
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high = (byte)E;
|
- *(char *)((byte *)saved_npc + 0x1) = E;
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high = (byte)E;
|
- ((char *)saved_npc)[0x1] = E;
+ ((uw_object_hdr_t *)saved_npc)->type_flags_high = (byte)E;
)
...>
}


@receiver_17_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x1)
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_high
|
- *(char *)((byte *)saved_npc + 0x1)
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_high
|
- ((char *)saved_npc)[0x1]
+ (char)((uw_object_hdr_t *)saved_npc)->type_flags_high
)
...>
}


@receiver_17_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_npc + 0x2) = (char)V;
- *(char *)((char *)saved_npc + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->position_word = (ushort)V;

...>
}

@receiver_17_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_npc + 0x2) = (char)V;
- *(byte *)((char *)saved_npc + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->position_word = (ushort)V;

...>
}

@receiver_17_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_npc + 0x2) = (byte)V;
- *(char *)((char *)saved_npc + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->position_word = (ushort)V;

...>
}

@receiver_17_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_npc + 0x2) = (byte)V;
- *(byte *)((char *)saved_npc + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->position_word = (ushort)V;

...>
}

@receiver_17_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word
|
- *(ushort *)((byte *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word
|
- ((ushort *)saved_npc)[0x1]
+ ((uw_object_hdr_t *)saved_npc)->position_word
|
- *(ushort *)((ushort *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->position_word
)
...>
}


@receiver_17_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word
|
- *(undefined2 *)((byte *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word
|
- ((undefined2 *)saved_npc)[0x1]
+ ((uw_object_hdr_t *)saved_npc)->position_word
|
- *(undefined2 *)((undefined2 *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->position_word
)
...>
}


@receiver_17_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word_signed
|
- *(short *)((byte *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word_signed
|
- ((short *)saved_npc)[0x1]
+ ((uw_object_hdr_t *)saved_npc)->position_word_signed
|
- *(short *)((short *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->position_word_signed
)
...>
}


@receiver_17_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
|
- *(byte *)((byte *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
|
- ((byte *)saved_npc)[0x2]
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
|
- *(byte *)((ushort *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
|
- (byte)((ushort *)saved_npc)[0x1]
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
)
...>
}


@receiver_17_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
|
- *(undefined1 *)((byte *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
|
- ((undefined1 *)saved_npc)[0x2]
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
|
- *(undefined1 *)((ushort *)saved_npc + 0x1)
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
|
- (undefined1)((ushort *)saved_npc)[0x1]
+ ((uw_object_hdr_t *)saved_npc)->position_word_low
)
...>
}


@receiver_17_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0x2)
+ (char *)&((uw_object_hdr_t *)saved_npc)->position_word_low
|
- &*(char *)((byte *)saved_npc + 0x2)
+ (char *)&((uw_object_hdr_t *)saved_npc)->position_word_low
|
- &((char *)saved_npc)[0x2]
+ (char *)&((uw_object_hdr_t *)saved_npc)->position_word_low
|
- &*(char *)((ushort *)saved_npc + 0x1)
+ (char *)&((uw_object_hdr_t *)saved_npc)->position_word_low
)
...>
}


@receiver_17_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x2) = E;
+ ((uw_object_hdr_t *)saved_npc)->position_word_low = (byte)E;
|
- *(char *)((byte *)saved_npc + 0x2) = E;
+ ((uw_object_hdr_t *)saved_npc)->position_word_low = (byte)E;
|
- ((char *)saved_npc)[0x2] = E;
+ ((uw_object_hdr_t *)saved_npc)->position_word_low = (byte)E;
|
- *(char *)((ushort *)saved_npc + 0x1) = E;
+ ((uw_object_hdr_t *)saved_npc)->position_word_low = (byte)E;
)
...>
}


@receiver_17_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x2)
+ (char)((uw_object_hdr_t *)saved_npc)->position_word_low
|
- *(char *)((byte *)saved_npc + 0x2)
+ (char)((uw_object_hdr_t *)saved_npc)->position_word_low
|
- ((char *)saved_npc)[0x2]
+ (char)((uw_object_hdr_t *)saved_npc)->position_word_low
|
- *(char *)((ushort *)saved_npc + 0x1)
+ (char)((uw_object_hdr_t *)saved_npc)->position_word_low
|
- (char)((ushort *)saved_npc)[0x1]
+ (char)((uw_object_hdr_t *)saved_npc)->position_word_low
)
...>
}


@receiver_17_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->position_word_high
|
- *(byte *)((byte *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->position_word_high
|
- ((byte *)saved_npc)[0x3]
+ ((uw_object_hdr_t *)saved_npc)->position_word_high
)
...>
}


@receiver_17_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->position_word_high
|
- *(undefined1 *)((byte *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->position_word_high
|
- ((undefined1 *)saved_npc)[0x3]
+ ((uw_object_hdr_t *)saved_npc)->position_word_high
)
...>
}


@receiver_17_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0x3)
+ (char *)&((uw_object_hdr_t *)saved_npc)->position_word_high
|
- &*(char *)((byte *)saved_npc + 0x3)
+ (char *)&((uw_object_hdr_t *)saved_npc)->position_word_high
|
- &((char *)saved_npc)[0x3]
+ (char *)&((uw_object_hdr_t *)saved_npc)->position_word_high
)
...>
}


@receiver_17_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x3) = E;
+ ((uw_object_hdr_t *)saved_npc)->position_word_high = (byte)E;
|
- *(char *)((byte *)saved_npc + 0x3) = E;
+ ((uw_object_hdr_t *)saved_npc)->position_word_high = (byte)E;
|
- ((char *)saved_npc)[0x3] = E;
+ ((uw_object_hdr_t *)saved_npc)->position_word_high = (byte)E;
)
...>
}


@receiver_17_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x3)
+ (char)((uw_object_hdr_t *)saved_npc)->position_word_high
|
- *(char *)((byte *)saved_npc + 0x3)
+ (char)((uw_object_hdr_t *)saved_npc)->position_word_high
|
- ((char *)saved_npc)[0x3]
+ (char)((uw_object_hdr_t *)saved_npc)->position_word_high
)
...>
}


@receiver_17_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_npc + 0x4) = (char)V;
- *(char *)((char *)saved_npc + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->chain_word = (ushort)V;

...>
}

@receiver_17_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_npc + 0x4) = (char)V;
- *(byte *)((char *)saved_npc + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->chain_word = (ushort)V;

...>
}

@receiver_17_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_npc + 0x4) = (byte)V;
- *(char *)((char *)saved_npc + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->chain_word = (ushort)V;

...>
}

@receiver_17_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_npc + 0x4) = (byte)V;
- *(byte *)((char *)saved_npc + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->chain_word = (ushort)V;

...>
}

@receiver_17_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word
|
- *(ushort *)((byte *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word
|
- ((ushort *)saved_npc)[0x2]
+ ((uw_object_hdr_t *)saved_npc)->chain_word
|
- *(ushort *)((ushort *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->chain_word
)
...>
}


@receiver_17_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word
|
- *(undefined2 *)((byte *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word
|
- ((undefined2 *)saved_npc)[0x2]
+ ((uw_object_hdr_t *)saved_npc)->chain_word
|
- *(undefined2 *)((undefined2 *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->chain_word
)
...>
}


@receiver_17_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_signed
|
- *(short *)((byte *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_signed
|
- ((short *)saved_npc)[0x2]
+ ((uw_object_hdr_t *)saved_npc)->chain_word_signed
|
- *(short *)((short *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_signed
)
...>
}


@receiver_17_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- *(byte *)((byte *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- ((byte *)saved_npc)[0x4]
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- *(byte *)((ushort *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- (byte)((ushort *)saved_npc)[0x2]
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
)
...>
}


@receiver_17_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- *(undefined1 *)((byte *)saved_npc + 0x4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- ((undefined1 *)saved_npc)[0x4]
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- *(undefined1 *)((ushort *)saved_npc + 0x2)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- (undefined1)((ushort *)saved_npc)[0x2]
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low
)
...>
}


@receiver_17_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0x4)
+ (char *)&((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- &*(char *)((byte *)saved_npc + 0x4)
+ (char *)&((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- &((char *)saved_npc)[0x4]
+ (char *)&((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- &*(char *)((ushort *)saved_npc + 0x2)
+ (char *)&((uw_object_hdr_t *)saved_npc)->chain_word_low
)
...>
}


@receiver_17_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x4) = E;
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low = (byte)E;
|
- *(char *)((byte *)saved_npc + 0x4) = E;
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low = (byte)E;
|
- ((char *)saved_npc)[0x4] = E;
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)saved_npc + 0x2) = E;
+ ((uw_object_hdr_t *)saved_npc)->chain_word_low = (byte)E;
)
...>
}


@receiver_17_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x4)
+ (char)((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- *(char *)((byte *)saved_npc + 0x4)
+ (char)((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- ((char *)saved_npc)[0x4]
+ (char)((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- *(char *)((ushort *)saved_npc + 0x2)
+ (char)((uw_object_hdr_t *)saved_npc)->chain_word_low
|
- (char)((ushort *)saved_npc)[0x2]
+ (char)((uw_object_hdr_t *)saved_npc)->chain_word_low
)
...>
}


@receiver_17_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0x5)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high
|
- *(byte *)((byte *)saved_npc + 0x5)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high
|
- ((byte *)saved_npc)[0x5]
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high
)
...>
}


@receiver_17_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0x5)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high
|
- *(undefined1 *)((byte *)saved_npc + 0x5)
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high
|
- ((undefined1 *)saved_npc)[0x5]
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high
)
...>
}


@receiver_17_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0x5)
+ (char *)&((uw_object_hdr_t *)saved_npc)->chain_word_high
|
- &*(char *)((byte *)saved_npc + 0x5)
+ (char *)&((uw_object_hdr_t *)saved_npc)->chain_word_high
|
- &((char *)saved_npc)[0x5]
+ (char *)&((uw_object_hdr_t *)saved_npc)->chain_word_high
)
...>
}


@receiver_17_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x5) = E;
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high = (byte)E;
|
- *(char *)((byte *)saved_npc + 0x5) = E;
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high = (byte)E;
|
- ((char *)saved_npc)[0x5] = E;
+ ((uw_object_hdr_t *)saved_npc)->chain_word_high = (byte)E;
)
...>
}


@receiver_17_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x5)
+ (char)((uw_object_hdr_t *)saved_npc)->chain_word_high
|
- *(char *)((byte *)saved_npc + 0x5)
+ (char)((uw_object_hdr_t *)saved_npc)->chain_word_high
|
- ((char *)saved_npc)[0x5]
+ (char)((uw_object_hdr_t *)saved_npc)->chain_word_high
)
...>
}


@receiver_17_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_npc + 0x6) = (char)V;
- *(char *)((char *)saved_npc + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->link_word = (ushort)V;

...>
}

@receiver_17_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)saved_npc + 0x6) = (char)V;
- *(byte *)((char *)saved_npc + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->link_word = (ushort)V;

...>
}

@receiver_17_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_npc + 0x6) = (byte)V;
- *(char *)((char *)saved_npc + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->link_word = (ushort)V;

...>
}

@receiver_17_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)saved_npc + 0x6) = (byte)V;
- *(byte *)((char *)saved_npc + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)saved_npc)->link_word = (ushort)V;

...>
}

@receiver_17_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word
|
- *(ushort *)((byte *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word
|
- ((ushort *)saved_npc)[0x3]
+ ((uw_object_hdr_t *)saved_npc)->link_word
|
- *(ushort *)((ushort *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->link_word
)
...>
}


@receiver_17_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word
|
- *(undefined2 *)((byte *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word
|
- ((undefined2 *)saved_npc)[0x3]
+ ((uw_object_hdr_t *)saved_npc)->link_word
|
- *(undefined2 *)((undefined2 *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->link_word
)
...>
}


@receiver_17_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word_signed
|
- *(short *)((byte *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word_signed
|
- ((short *)saved_npc)[0x3]
+ ((uw_object_hdr_t *)saved_npc)->link_word_signed
|
- *(short *)((short *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->link_word_signed
)
...>
}


@receiver_17_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
|
- *(byte *)((byte *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
|
- ((byte *)saved_npc)[0x6]
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
|
- *(byte *)((ushort *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
|
- (byte)((ushort *)saved_npc)[0x3]
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
)
...>
}


@receiver_17_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
|
- *(undefined1 *)((byte *)saved_npc + 0x6)
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
|
- ((undefined1 *)saved_npc)[0x6]
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
|
- *(undefined1 *)((ushort *)saved_npc + 0x3)
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
|
- (undefined1)((ushort *)saved_npc)[0x3]
+ ((uw_object_hdr_t *)saved_npc)->link_word_low
)
...>
}


@receiver_17_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0x6)
+ (char *)&((uw_object_hdr_t *)saved_npc)->link_word_low
|
- &*(char *)((byte *)saved_npc + 0x6)
+ (char *)&((uw_object_hdr_t *)saved_npc)->link_word_low
|
- &((char *)saved_npc)[0x6]
+ (char *)&((uw_object_hdr_t *)saved_npc)->link_word_low
|
- &*(char *)((ushort *)saved_npc + 0x3)
+ (char *)&((uw_object_hdr_t *)saved_npc)->link_word_low
)
...>
}


@receiver_17_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x6) = E;
+ ((uw_object_hdr_t *)saved_npc)->link_word_low = (byte)E;
|
- *(char *)((byte *)saved_npc + 0x6) = E;
+ ((uw_object_hdr_t *)saved_npc)->link_word_low = (byte)E;
|
- ((char *)saved_npc)[0x6] = E;
+ ((uw_object_hdr_t *)saved_npc)->link_word_low = (byte)E;
|
- *(char *)((ushort *)saved_npc + 0x3) = E;
+ ((uw_object_hdr_t *)saved_npc)->link_word_low = (byte)E;
)
...>
}


@receiver_17_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x6)
+ (char)((uw_object_hdr_t *)saved_npc)->link_word_low
|
- *(char *)((byte *)saved_npc + 0x6)
+ (char)((uw_object_hdr_t *)saved_npc)->link_word_low
|
- ((char *)saved_npc)[0x6]
+ (char)((uw_object_hdr_t *)saved_npc)->link_word_low
|
- *(char *)((ushort *)saved_npc + 0x3)
+ (char)((uw_object_hdr_t *)saved_npc)->link_word_low
|
- (char)((ushort *)saved_npc)[0x3]
+ (char)((uw_object_hdr_t *)saved_npc)->link_word_low
)
...>
}


@receiver_17_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0x7)
+ ((uw_object_hdr_t *)saved_npc)->link_word_high
|
- *(byte *)((byte *)saved_npc + 0x7)
+ ((uw_object_hdr_t *)saved_npc)->link_word_high
|
- ((byte *)saved_npc)[0x7]
+ ((uw_object_hdr_t *)saved_npc)->link_word_high
)
...>
}


@receiver_17_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0x7)
+ ((uw_object_hdr_t *)saved_npc)->link_word_high
|
- *(undefined1 *)((byte *)saved_npc + 0x7)
+ ((uw_object_hdr_t *)saved_npc)->link_word_high
|
- ((undefined1 *)saved_npc)[0x7]
+ ((uw_object_hdr_t *)saved_npc)->link_word_high
)
...>
}


@receiver_17_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0x7)
+ (char *)&((uw_object_hdr_t *)saved_npc)->link_word_high
|
- &*(char *)((byte *)saved_npc + 0x7)
+ (char *)&((uw_object_hdr_t *)saved_npc)->link_word_high
|
- &((char *)saved_npc)[0x7]
+ (char *)&((uw_object_hdr_t *)saved_npc)->link_word_high
)
...>
}


@receiver_17_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x7) = E;
+ ((uw_object_hdr_t *)saved_npc)->link_word_high = (byte)E;
|
- *(char *)((byte *)saved_npc + 0x7) = E;
+ ((uw_object_hdr_t *)saved_npc)->link_word_high = (byte)E;
|
- ((char *)saved_npc)[0x7] = E;
+ ((uw_object_hdr_t *)saved_npc)->link_word_high = (byte)E;
)
...>
}


@receiver_17_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0x7)
+ (char)((uw_object_hdr_t *)saved_npc)->link_word_high
|
- *(char *)((byte *)saved_npc + 0x7)
+ (char)((uw_object_hdr_t *)saved_npc)->link_word_high
|
- ((char *)saved_npc)[0x7]
+ (char)((uw_object_hdr_t *)saved_npc)->link_word_high
)
...>
}


@receiver_18_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@receiver_18_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_18_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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


@receiver_19_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_0_0_word_ushort@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(ushort *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- npc[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *npc
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}


@receiver_19_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(undefined2 *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- npc[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *npc
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}


@receiver_19_w_0_0_word_short@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(short *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_signed
)
...>
}


@receiver_19_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(byte *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- (byte)npc[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_19_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(undefined1 *)(npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- (undefined1)npc[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_19_w_0_0_address_0@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- &*(char *)(npc + 0x0)
+ (char *)&((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_19_w_0_0_store_0@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(char *)(npc + 0x0) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
)
...>
}


@receiver_19_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(char *)(npc + 0x0)
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- (char)npc[0x0]
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_19_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_0_0_address_1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_0_0_store_1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_2_17_word_ushort@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(ushort *)(npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word
|
- npc[0x1]
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}


@receiver_19_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(undefined2 *)(npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word
|
- npc[0x1]
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}


@receiver_19_w_2_17_word_short@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(short *)(npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_signed
)
...>
}


@receiver_19_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(byte *)(npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- (byte)npc[0x1]
+ ((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_19_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(undefined1 *)(npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- (undefined1)npc[0x1]
+ ((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_19_w_2_17_address_2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- &*(char *)(npc + 0x1)
+ (char *)&((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_19_w_2_17_store_2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(char *)(npc + 0x1) = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
)
...>
}


@receiver_19_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(char *)(npc + 0x1)
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- (char)npc[0x1]
+ (char)((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_19_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_2_17_address_3@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_2_17_store_3@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_4_34_word_ushort@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(ushort *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- npc[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}


@receiver_19_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(undefined2 *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- npc[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}


@receiver_19_w_4_34_word_short@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(short *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_signed
)
...>
}


@receiver_19_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(byte *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- (byte)npc[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_19_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(undefined1 *)(npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- (undefined1)npc[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_19_w_4_34_address_4@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- &*(char *)(npc + 0x2)
+ (char *)&((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_19_w_4_34_store_4@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(char *)(npc + 0x2) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
)
...>
}


@receiver_19_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(char *)(npc + 0x2)
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- (char)npc[0x2]
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_19_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_4_34_address_5@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_4_34_store_5@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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

@receiver_19_w_6_51_word_ushort@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(ushort *)(npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word
|
- npc[0x3]
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}


@receiver_19_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(undefined2 *)(npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word
|
- npc[0x3]
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}


@receiver_19_w_6_51_word_short@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(short *)(npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_signed
)
...>
}


@receiver_19_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(byte *)(npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- (byte)npc[0x3]
+ ((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_19_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(undefined1 *)(npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- (undefined1)npc[0x3]
+ ((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_19_w_6_51_address_6@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- &*(char *)(npc + 0x3)
+ (char *)&((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_19_w_6_51_store_6@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(char *)(npc + 0x3) = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
)
...>
}


@receiver_19_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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
|
- *(char *)(npc + 0x3)
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- (char)npc[0x3]
+ (char)((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_19_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_6_51_address_7@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_6_51_store_7@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_19_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
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


@receiver_20_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x0) = (char)V;
- *(char *)((char *)source + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->type_flags = (ushort)V;

...>
}

@receiver_20_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x0) = (char)V;
- *(byte *)((char *)source + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->type_flags = (ushort)V;

...>
}

@receiver_20_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x0) = (byte)V;
- *(char *)((char *)source + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->type_flags = (ushort)V;

...>
}

@receiver_20_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x0) = (byte)V;
- *(byte *)((char *)source + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->type_flags = (ushort)V;

...>
}

@receiver_20_w_0_0_word_ushort@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(ushort *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- ((ushort *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(ushort *)((ushort *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(ushort *)(source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- source[0x0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *source
+ ((uw_object_hdr_t *)source)->type_flags
)
...>
}


@receiver_20_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(undefined2 *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- ((undefined2 *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(undefined2 *)((undefined2 *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(undefined2 *)(source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- source[0x0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *source
+ ((uw_object_hdr_t *)source)->type_flags
)
...>
}


@receiver_20_w_0_0_word_short@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_signed
|
- *(short *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_signed
|
- ((short *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_signed
|
- *(short *)((short *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_signed
|
- *(short *)(source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_signed
)
...>
}


@receiver_20_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(byte *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- ((byte *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(byte *)((ushort *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- (byte)((ushort *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(byte *)source
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(byte *)(source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- (byte)source[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
)
...>
}


@receiver_20_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(undefined1 *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- ((undefined1 *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(undefined1 *)((ushort *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- (undefined1)((ushort *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(undefined1 *)source
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(undefined1 *)(source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- (undefined1)source[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
)
...>
}


@receiver_20_w_0_0_address_0@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source + 0x0)
+ (char *)&((uw_object_hdr_t *)source)->type_flags_low
|
- &*(char *)((byte *)source + 0x0)
+ (char *)&((uw_object_hdr_t *)source)->type_flags_low
|
- &((char *)source)[0x0]
+ (char *)&((uw_object_hdr_t *)source)->type_flags_low
|
- &*(char *)((ushort *)source + 0x0)
+ (char *)&((uw_object_hdr_t *)source)->type_flags_low
|
- &*(char *)source
+ (char *)&((uw_object_hdr_t *)source)->type_flags_low
|
- &*(char *)(source + 0x0)
+ (char *)&((uw_object_hdr_t *)source)->type_flags_low
)
...>
}


@receiver_20_w_0_0_store_0@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x0) = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- *(char *)((byte *)source + 0x0) = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- ((char *)source)[0x0] = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)source + 0x0) = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- *(char *)source = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- *(char *)(source + 0x0) = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
)
...>
}


@receiver_20_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x0)
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- *(char *)((byte *)source + 0x0)
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- ((char *)source)[0x0]
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- *(char *)((ushort *)source + 0x0)
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- (char)((ushort *)source)[0x0]
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- *(char *)source
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- *(char *)(source + 0x0)
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- (char)source[0x0]
+ (char)((uw_object_hdr_t *)source)->type_flags_low
)
...>
}


@receiver_20_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x1)
+ ((uw_object_hdr_t *)source)->type_flags_high
|
- *(byte *)((byte *)source + 0x1)
+ ((uw_object_hdr_t *)source)->type_flags_high
|
- ((byte *)source)[0x1]
+ ((uw_object_hdr_t *)source)->type_flags_high
)
...>
}


@receiver_20_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x1)
+ ((uw_object_hdr_t *)source)->type_flags_high
|
- *(undefined1 *)((byte *)source + 0x1)
+ ((uw_object_hdr_t *)source)->type_flags_high
|
- ((undefined1 *)source)[0x1]
+ ((uw_object_hdr_t *)source)->type_flags_high
)
...>
}


@receiver_20_w_0_0_address_1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source + 0x1)
+ (char *)&((uw_object_hdr_t *)source)->type_flags_high
|
- &*(char *)((byte *)source + 0x1)
+ (char *)&((uw_object_hdr_t *)source)->type_flags_high
|
- &((char *)source)[0x1]
+ (char *)&((uw_object_hdr_t *)source)->type_flags_high
)
...>
}


@receiver_20_w_0_0_store_1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x1) = E;
+ ((uw_object_hdr_t *)source)->type_flags_high = (byte)E;
|
- *(char *)((byte *)source + 0x1) = E;
+ ((uw_object_hdr_t *)source)->type_flags_high = (byte)E;
|
- ((char *)source)[0x1] = E;
+ ((uw_object_hdr_t *)source)->type_flags_high = (byte)E;
)
...>
}


@receiver_20_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x1)
+ (char)((uw_object_hdr_t *)source)->type_flags_high
|
- *(char *)((byte *)source + 0x1)
+ (char)((uw_object_hdr_t *)source)->type_flags_high
|
- ((char *)source)[0x1]
+ (char)((uw_object_hdr_t *)source)->type_flags_high
)
...>
}


@receiver_20_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x2) = (char)V;
- *(char *)((char *)source + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->position_word = (ushort)V;

...>
}

@receiver_20_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x2) = (char)V;
- *(byte *)((char *)source + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->position_word = (ushort)V;

...>
}

@receiver_20_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x2) = (byte)V;
- *(char *)((char *)source + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->position_word = (ushort)V;

...>
}

@receiver_20_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x2) = (byte)V;
- *(byte *)((char *)source + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->position_word = (ushort)V;

...>
}

@receiver_20_w_2_17_word_ushort@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word
|
- *(ushort *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word
|
- ((ushort *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word
|
- *(ushort *)((ushort *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word
|
- *(ushort *)(source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word
|
- source[0x1]
+ ((uw_object_hdr_t *)source)->position_word
)
...>
}


@receiver_20_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word
|
- *(undefined2 *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word
|
- ((undefined2 *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word
|
- *(undefined2 *)((undefined2 *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word
|
- *(undefined2 *)(source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word
|
- source[0x1]
+ ((uw_object_hdr_t *)source)->position_word
)
...>
}


@receiver_20_w_2_17_word_short@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_signed
|
- *(short *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_signed
|
- ((short *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word_signed
|
- *(short *)((short *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_signed
|
- *(short *)(source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_signed
)
...>
}


@receiver_20_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(byte *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- ((byte *)source)[0x2]
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(byte *)((ushort *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- (byte)((ushort *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(byte *)(source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- (byte)source[0x1]
+ ((uw_object_hdr_t *)source)->position_word_low
)
...>
}


@receiver_20_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(undefined1 *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- ((undefined1 *)source)[0x2]
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(undefined1 *)((ushort *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- (undefined1)((ushort *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(undefined1 *)(source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- (undefined1)source[0x1]
+ ((uw_object_hdr_t *)source)->position_word_low
)
...>
}


@receiver_20_w_2_17_address_2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source + 0x2)
+ (char *)&((uw_object_hdr_t *)source)->position_word_low
|
- &*(char *)((byte *)source + 0x2)
+ (char *)&((uw_object_hdr_t *)source)->position_word_low
|
- &((char *)source)[0x2]
+ (char *)&((uw_object_hdr_t *)source)->position_word_low
|
- &*(char *)((ushort *)source + 0x1)
+ (char *)&((uw_object_hdr_t *)source)->position_word_low
|
- &*(char *)(source + 0x1)
+ (char *)&((uw_object_hdr_t *)source)->position_word_low
)
...>
}


@receiver_20_w_2_17_store_2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x2) = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
|
- *(char *)((byte *)source + 0x2) = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
|
- ((char *)source)[0x2] = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
|
- *(char *)((ushort *)source + 0x1) = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
|
- *(char *)(source + 0x1) = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
)
...>
}


@receiver_20_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x2)
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- *(char *)((byte *)source + 0x2)
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- ((char *)source)[0x2]
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- *(char *)((ushort *)source + 0x1)
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- (char)((ushort *)source)[0x1]
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- *(char *)(source + 0x1)
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- (char)source[0x1]
+ (char)((uw_object_hdr_t *)source)->position_word_low
)
...>
}


@receiver_20_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x3)
+ ((uw_object_hdr_t *)source)->position_word_high
|
- *(byte *)((byte *)source + 0x3)
+ ((uw_object_hdr_t *)source)->position_word_high
|
- ((byte *)source)[0x3]
+ ((uw_object_hdr_t *)source)->position_word_high
)
...>
}


@receiver_20_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x3)
+ ((uw_object_hdr_t *)source)->position_word_high
|
- *(undefined1 *)((byte *)source + 0x3)
+ ((uw_object_hdr_t *)source)->position_word_high
|
- ((undefined1 *)source)[0x3]
+ ((uw_object_hdr_t *)source)->position_word_high
)
...>
}


@receiver_20_w_2_17_address_3@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source + 0x3)
+ (char *)&((uw_object_hdr_t *)source)->position_word_high
|
- &*(char *)((byte *)source + 0x3)
+ (char *)&((uw_object_hdr_t *)source)->position_word_high
|
- &((char *)source)[0x3]
+ (char *)&((uw_object_hdr_t *)source)->position_word_high
)
...>
}


@receiver_20_w_2_17_store_3@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x3) = E;
+ ((uw_object_hdr_t *)source)->position_word_high = (byte)E;
|
- *(char *)((byte *)source + 0x3) = E;
+ ((uw_object_hdr_t *)source)->position_word_high = (byte)E;
|
- ((char *)source)[0x3] = E;
+ ((uw_object_hdr_t *)source)->position_word_high = (byte)E;
)
...>
}


@receiver_20_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x3)
+ (char)((uw_object_hdr_t *)source)->position_word_high
|
- *(char *)((byte *)source + 0x3)
+ (char)((uw_object_hdr_t *)source)->position_word_high
|
- ((char *)source)[0x3]
+ (char)((uw_object_hdr_t *)source)->position_word_high
)
...>
}


@receiver_20_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x4) = (char)V;
- *(char *)((char *)source + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->chain_word = (ushort)V;

...>
}

@receiver_20_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x4) = (char)V;
- *(byte *)((char *)source + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->chain_word = (ushort)V;

...>
}

@receiver_20_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x4) = (byte)V;
- *(char *)((char *)source + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->chain_word = (ushort)V;

...>
}

@receiver_20_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x4) = (byte)V;
- *(byte *)((char *)source + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->chain_word = (ushort)V;

...>
}

@receiver_20_w_4_34_word_ushort@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word
|
- *(ushort *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word
|
- ((ushort *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word
|
- *(ushort *)((ushort *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word
|
- *(ushort *)(source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word
|
- source[0x2]
+ ((uw_object_hdr_t *)source)->chain_word
)
...>
}


@receiver_20_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word
|
- *(undefined2 *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word
|
- ((undefined2 *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word
|
- *(undefined2 *)((undefined2 *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word
|
- *(undefined2 *)(source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word
|
- source[0x2]
+ ((uw_object_hdr_t *)source)->chain_word
)
...>
}


@receiver_20_w_4_34_word_short@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_signed
|
- *(short *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_signed
|
- ((short *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word_signed
|
- *(short *)((short *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_signed
|
- *(short *)(source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_signed
)
...>
}


@receiver_20_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(byte *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- ((byte *)source)[0x4]
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(byte *)((ushort *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- (byte)((ushort *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(byte *)(source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- (byte)source[0x2]
+ ((uw_object_hdr_t *)source)->chain_word_low
)
...>
}


@receiver_20_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(undefined1 *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- ((undefined1 *)source)[0x4]
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(undefined1 *)((ushort *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- (undefined1)((ushort *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(undefined1 *)(source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- (undefined1)source[0x2]
+ ((uw_object_hdr_t *)source)->chain_word_low
)
...>
}


@receiver_20_w_4_34_address_4@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source + 0x4)
+ (char *)&((uw_object_hdr_t *)source)->chain_word_low
|
- &*(char *)((byte *)source + 0x4)
+ (char *)&((uw_object_hdr_t *)source)->chain_word_low
|
- &((char *)source)[0x4]
+ (char *)&((uw_object_hdr_t *)source)->chain_word_low
|
- &*(char *)((ushort *)source + 0x2)
+ (char *)&((uw_object_hdr_t *)source)->chain_word_low
|
- &*(char *)(source + 0x2)
+ (char *)&((uw_object_hdr_t *)source)->chain_word_low
)
...>
}


@receiver_20_w_4_34_store_4@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x4) = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
|
- *(char *)((byte *)source + 0x4) = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
|
- ((char *)source)[0x4] = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)source + 0x2) = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
|
- *(char *)(source + 0x2) = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
)
...>
}


@receiver_20_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x4)
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- *(char *)((byte *)source + 0x4)
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- ((char *)source)[0x4]
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- *(char *)((ushort *)source + 0x2)
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- (char)((ushort *)source)[0x2]
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- *(char *)(source + 0x2)
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- (char)source[0x2]
+ (char)((uw_object_hdr_t *)source)->chain_word_low
)
...>
}


@receiver_20_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x5)
+ ((uw_object_hdr_t *)source)->chain_word_high
|
- *(byte *)((byte *)source + 0x5)
+ ((uw_object_hdr_t *)source)->chain_word_high
|
- ((byte *)source)[0x5]
+ ((uw_object_hdr_t *)source)->chain_word_high
)
...>
}


@receiver_20_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x5)
+ ((uw_object_hdr_t *)source)->chain_word_high
|
- *(undefined1 *)((byte *)source + 0x5)
+ ((uw_object_hdr_t *)source)->chain_word_high
|
- ((undefined1 *)source)[0x5]
+ ((uw_object_hdr_t *)source)->chain_word_high
)
...>
}


@receiver_20_w_4_34_address_5@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source + 0x5)
+ (char *)&((uw_object_hdr_t *)source)->chain_word_high
|
- &*(char *)((byte *)source + 0x5)
+ (char *)&((uw_object_hdr_t *)source)->chain_word_high
|
- &((char *)source)[0x5]
+ (char *)&((uw_object_hdr_t *)source)->chain_word_high
)
...>
}


@receiver_20_w_4_34_store_5@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x5) = E;
+ ((uw_object_hdr_t *)source)->chain_word_high = (byte)E;
|
- *(char *)((byte *)source + 0x5) = E;
+ ((uw_object_hdr_t *)source)->chain_word_high = (byte)E;
|
- ((char *)source)[0x5] = E;
+ ((uw_object_hdr_t *)source)->chain_word_high = (byte)E;
)
...>
}


@receiver_20_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x5)
+ (char)((uw_object_hdr_t *)source)->chain_word_high
|
- *(char *)((byte *)source + 0x5)
+ (char)((uw_object_hdr_t *)source)->chain_word_high
|
- ((char *)source)[0x5]
+ (char)((uw_object_hdr_t *)source)->chain_word_high
)
...>
}


@receiver_20_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x6) = (char)V;
- *(char *)((char *)source + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->link_word = (ushort)V;

...>
}

@receiver_20_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x6) = (char)V;
- *(byte *)((char *)source + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->link_word = (ushort)V;

...>
}

@receiver_20_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x6) = (byte)V;
- *(char *)((char *)source + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->link_word = (ushort)V;

...>
}

@receiver_20_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x6) = (byte)V;
- *(byte *)((char *)source + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->link_word = (ushort)V;

...>
}

@receiver_20_w_6_51_word_ushort@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word
|
- *(ushort *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word
|
- ((ushort *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word
|
- *(ushort *)((ushort *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word
|
- *(ushort *)(source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word
|
- source[0x3]
+ ((uw_object_hdr_t *)source)->link_word
)
...>
}


@receiver_20_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word
|
- *(undefined2 *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word
|
- ((undefined2 *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word
|
- *(undefined2 *)((undefined2 *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word
|
- *(undefined2 *)(source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word
|
- source[0x3]
+ ((uw_object_hdr_t *)source)->link_word
)
...>
}


@receiver_20_w_6_51_word_short@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_signed
|
- *(short *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_signed
|
- ((short *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word_signed
|
- *(short *)((short *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_signed
|
- *(short *)(source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_signed
)
...>
}


@receiver_20_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(byte *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- ((byte *)source)[0x6]
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(byte *)((ushort *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- (byte)((ushort *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(byte *)(source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- (byte)source[0x3]
+ ((uw_object_hdr_t *)source)->link_word_low
)
...>
}


@receiver_20_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(undefined1 *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- ((undefined1 *)source)[0x6]
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(undefined1 *)((ushort *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- (undefined1)((ushort *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(undefined1 *)(source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- (undefined1)source[0x3]
+ ((uw_object_hdr_t *)source)->link_word_low
)
...>
}


@receiver_20_w_6_51_address_6@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source + 0x6)
+ (char *)&((uw_object_hdr_t *)source)->link_word_low
|
- &*(char *)((byte *)source + 0x6)
+ (char *)&((uw_object_hdr_t *)source)->link_word_low
|
- &((char *)source)[0x6]
+ (char *)&((uw_object_hdr_t *)source)->link_word_low
|
- &*(char *)((ushort *)source + 0x3)
+ (char *)&((uw_object_hdr_t *)source)->link_word_low
|
- &*(char *)(source + 0x3)
+ (char *)&((uw_object_hdr_t *)source)->link_word_low
)
...>
}


@receiver_20_w_6_51_store_6@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x6) = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
|
- *(char *)((byte *)source + 0x6) = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
|
- ((char *)source)[0x6] = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
|
- *(char *)((ushort *)source + 0x3) = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
|
- *(char *)(source + 0x3) = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
)
...>
}


@receiver_20_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x6)
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- *(char *)((byte *)source + 0x6)
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- ((char *)source)[0x6]
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- *(char *)((ushort *)source + 0x3)
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- (char)((ushort *)source)[0x3]
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- *(char *)(source + 0x3)
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- (char)source[0x3]
+ (char)((uw_object_hdr_t *)source)->link_word_low
)
...>
}


@receiver_20_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x7)
+ ((uw_object_hdr_t *)source)->link_word_high
|
- *(byte *)((byte *)source + 0x7)
+ ((uw_object_hdr_t *)source)->link_word_high
|
- ((byte *)source)[0x7]
+ ((uw_object_hdr_t *)source)->link_word_high
)
...>
}


@receiver_20_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x7)
+ ((uw_object_hdr_t *)source)->link_word_high
|
- *(undefined1 *)((byte *)source + 0x7)
+ ((uw_object_hdr_t *)source)->link_word_high
|
- ((undefined1 *)source)[0x7]
+ ((uw_object_hdr_t *)source)->link_word_high
)
...>
}


@receiver_20_w_6_51_address_7@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source + 0x7)
+ (char *)&((uw_object_hdr_t *)source)->link_word_high
|
- &*(char *)((byte *)source + 0x7)
+ (char *)&((uw_object_hdr_t *)source)->link_word_high
|
- &((char *)source)[0x7]
+ (char *)&((uw_object_hdr_t *)source)->link_word_high
)
...>
}


@receiver_20_w_6_51_store_7@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x7) = E;
+ ((uw_object_hdr_t *)source)->link_word_high = (byte)E;
|
- *(char *)((byte *)source + 0x7) = E;
+ ((uw_object_hdr_t *)source)->link_word_high = (byte)E;
|
- ((char *)source)[0x7] = E;
+ ((uw_object_hdr_t *)source)->link_word_high = (byte)E;
)
...>
}


@receiver_20_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x7)
+ (char)((uw_object_hdr_t *)source)->link_word_high
|
- *(char *)((byte *)source + 0x7)
+ (char)((uw_object_hdr_t *)source)->link_word_high
|
- ((char *)source)[0x7]
+ (char)((uw_object_hdr_t *)source)->link_word_high
)
...>
}


@receiver_21_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar9 + 0x0) = (char)V;
- *(char *)((char *)iVar9 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->type_flags = (ushort)V;

...>
}

@receiver_21_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar9 + 0x0) = (char)V;
- *(byte *)((char *)iVar9 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->type_flags = (ushort)V;

...>
}

@receiver_21_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar9 + 0x0) = (byte)V;
- *(char *)((char *)iVar9 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->type_flags = (ushort)V;

...>
}

@receiver_21_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar9 + 0x0) = (byte)V;
- *(byte *)((char *)iVar9 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->type_flags = (ushort)V;

...>
}

@receiver_21_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- *(ushort *)((byte *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- ((ushort *)iVar9)[0x0]
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- *(ushort *)((ushort *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- *(ushort *)(iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
)
...>
}


@receiver_21_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- *(undefined2 *)((byte *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- ((undefined2 *)iVar9)[0x0]
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- *(undefined2 *)(iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
)
...>
}


@receiver_21_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_signed
|
- *(short *)((byte *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_signed
|
- ((short *)iVar9)[0x0]
+ ((uw_object_hdr_t *)iVar9)->type_flags_signed
|
- *(short *)((short *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_signed
|
- *(short *)(iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_signed
)
...>
}


@receiver_21_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(byte *)((byte *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- ((byte *)iVar9)[0x0]
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(byte *)((ushort *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- (byte)((ushort *)iVar9)[0x0]
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(byte *)iVar9
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(byte *)(iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
)
...>
}


@receiver_21_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(undefined1 *)((byte *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- ((undefined1 *)iVar9)[0x0]
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- (undefined1)((ushort *)iVar9)[0x0]
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(undefined1 *)iVar9
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(undefined1 *)(iVar9 + 0x0)
+ ((uw_object_hdr_t *)iVar9)->type_flags_low
)
...>
}


@receiver_21_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_low
|
- &*(char *)((byte *)iVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_low
|
- &((char *)iVar9)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_low
|
- &*(char *)((ushort *)iVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_low
|
- &*(char *)iVar9
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_low
|
- &*(char *)(iVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_low
|
- &iVar9[0x0]
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_low
|
- &*iVar9
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_low
)
...>
}


@receiver_21_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_low = (byte)E;
|
- ((char *)iVar9)[0x0] = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_low = (byte)E;
|
- *(char *)iVar9 = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_low = (byte)E;
|
- *(char *)(iVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_low = (byte)E;
|
- iVar9[0x0] = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_low = (byte)E;
|
- *iVar9 = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_low = (byte)E;
)
...>
}


@receiver_21_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x0)
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(char *)((byte *)iVar9 + 0x0)
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
|
- ((char *)iVar9)[0x0]
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(char *)((ushort *)iVar9 + 0x0)
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
|
- (char)((ushort *)iVar9)[0x0]
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(char *)iVar9
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *(char *)(iVar9 + 0x0)
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
|
- iVar9[0x0]
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
|
- *iVar9
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_low
)
...>
}


@receiver_21_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->type_flags_high
|
- *(byte *)((byte *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->type_flags_high
|
- ((byte *)iVar9)[0x1]
+ ((uw_object_hdr_t *)iVar9)->type_flags_high
|
- *(byte *)(iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->type_flags_high
)
...>
}


@receiver_21_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->type_flags_high
|
- *(undefined1 *)((byte *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->type_flags_high
|
- ((undefined1 *)iVar9)[0x1]
+ ((uw_object_hdr_t *)iVar9)->type_flags_high
|
- *(undefined1 *)(iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->type_flags_high
)
...>
}


@receiver_21_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_high
|
- &*(char *)((byte *)iVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_high
|
- &((char *)iVar9)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_high
|
- &*(char *)(iVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_high
|
- &iVar9[0x1]
+ (char *)&((uw_object_hdr_t *)iVar9)->type_flags_high
)
...>
}


@receiver_21_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_high = (byte)E;
|
- ((char *)iVar9)[0x1] = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_high = (byte)E;
|
- *(char *)(iVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_high = (byte)E;
|
- iVar9[0x1] = E;
+ ((uw_object_hdr_t *)iVar9)->type_flags_high = (byte)E;
)
...>
}


@receiver_21_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x1)
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_high
|
- *(char *)((byte *)iVar9 + 0x1)
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_high
|
- ((char *)iVar9)[0x1]
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_high
|
- *(char *)(iVar9 + 0x1)
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_high
|
- iVar9[0x1]
+ (char)((uw_object_hdr_t *)iVar9)->type_flags_high
)
...>
}


@receiver_21_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar9 + 0x2) = (char)V;
- *(char *)((char *)iVar9 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->position_word = (ushort)V;

...>
}

@receiver_21_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar9 + 0x2) = (char)V;
- *(byte *)((char *)iVar9 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->position_word = (ushort)V;

...>
}

@receiver_21_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar9 + 0x2) = (byte)V;
- *(char *)((char *)iVar9 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->position_word = (ushort)V;

...>
}

@receiver_21_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar9 + 0x2) = (byte)V;
- *(byte *)((char *)iVar9 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->position_word = (ushort)V;

...>
}

@receiver_21_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- *(ushort *)((byte *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- ((ushort *)iVar9)[0x1]
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- *(ushort *)((ushort *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- *(ushort *)(iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word
)
...>
}


@receiver_21_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- *(undefined2 *)((byte *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- ((undefined2 *)iVar9)[0x1]
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- *(undefined2 *)((undefined2 *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- *(undefined2 *)(iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word
)
...>
}


@receiver_21_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_signed
|
- *(short *)((byte *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_signed
|
- ((short *)iVar9)[0x1]
+ ((uw_object_hdr_t *)iVar9)->position_word_signed
|
- *(short *)((short *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->position_word_signed
|
- *(short *)(iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_signed
)
...>
}


@receiver_21_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(byte *)((byte *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- ((byte *)iVar9)[0x2]
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(byte *)((ushort *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- (byte)((ushort *)iVar9)[0x1]
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(byte *)(iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_low
)
...>
}


@receiver_21_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(undefined1 *)((byte *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- ((undefined1 *)iVar9)[0x2]
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(undefined1 *)((ushort *)iVar9 + 0x1)
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- (undefined1)((ushort *)iVar9)[0x1]
+ ((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(undefined1 *)(iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->position_word_low
)
...>
}


@receiver_21_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_low
|
- &*(char *)((byte *)iVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_low
|
- &((char *)iVar9)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_low
|
- &*(char *)((ushort *)iVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_low
|
- &*(char *)(iVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_low
|
- &iVar9[0x2]
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_low
)
...>
}


@receiver_21_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_low = (byte)E;
|
- ((char *)iVar9)[0x2] = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_low = (byte)E;
|
- *(char *)(iVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_low = (byte)E;
|
- iVar9[0x2] = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_low = (byte)E;
)
...>
}


@receiver_21_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x2)
+ (char)((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(char *)((byte *)iVar9 + 0x2)
+ (char)((uw_object_hdr_t *)iVar9)->position_word_low
|
- ((char *)iVar9)[0x2]
+ (char)((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(char *)((ushort *)iVar9 + 0x1)
+ (char)((uw_object_hdr_t *)iVar9)->position_word_low
|
- (char)((ushort *)iVar9)[0x1]
+ (char)((uw_object_hdr_t *)iVar9)->position_word_low
|
- *(char *)(iVar9 + 0x2)
+ (char)((uw_object_hdr_t *)iVar9)->position_word_low
|
- iVar9[0x2]
+ (char)((uw_object_hdr_t *)iVar9)->position_word_low
)
...>
}


@receiver_21_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->position_word_high
|
- *(byte *)((byte *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->position_word_high
|
- ((byte *)iVar9)[0x3]
+ ((uw_object_hdr_t *)iVar9)->position_word_high
|
- *(byte *)(iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->position_word_high
)
...>
}


@receiver_21_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->position_word_high
|
- *(undefined1 *)((byte *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->position_word_high
|
- ((undefined1 *)iVar9)[0x3]
+ ((uw_object_hdr_t *)iVar9)->position_word_high
|
- *(undefined1 *)(iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->position_word_high
)
...>
}


@receiver_21_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_high
|
- &*(char *)((byte *)iVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_high
|
- &((char *)iVar9)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_high
|
- &*(char *)(iVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_high
|
- &iVar9[0x3]
+ (char *)&((uw_object_hdr_t *)iVar9)->position_word_high
)
...>
}


@receiver_21_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_high = (byte)E;
|
- ((char *)iVar9)[0x3] = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_high = (byte)E;
|
- *(char *)(iVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_high = (byte)E;
|
- iVar9[0x3] = E;
+ ((uw_object_hdr_t *)iVar9)->position_word_high = (byte)E;
)
...>
}


@receiver_21_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x3)
+ (char)((uw_object_hdr_t *)iVar9)->position_word_high
|
- *(char *)((byte *)iVar9 + 0x3)
+ (char)((uw_object_hdr_t *)iVar9)->position_word_high
|
- ((char *)iVar9)[0x3]
+ (char)((uw_object_hdr_t *)iVar9)->position_word_high
|
- *(char *)(iVar9 + 0x3)
+ (char)((uw_object_hdr_t *)iVar9)->position_word_high
|
- iVar9[0x3]
+ (char)((uw_object_hdr_t *)iVar9)->position_word_high
)
...>
}


@receiver_21_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar9 + 0x4) = (char)V;
- *(char *)((char *)iVar9 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->chain_word = (ushort)V;

...>
}

@receiver_21_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar9 + 0x4) = (char)V;
- *(byte *)((char *)iVar9 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->chain_word = (ushort)V;

...>
}

@receiver_21_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar9 + 0x4) = (byte)V;
- *(char *)((char *)iVar9 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->chain_word = (ushort)V;

...>
}

@receiver_21_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar9 + 0x4) = (byte)V;
- *(byte *)((char *)iVar9 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->chain_word = (ushort)V;

...>
}

@receiver_21_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- *(ushort *)((byte *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- ((ushort *)iVar9)[0x2]
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- *(ushort *)((ushort *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- *(ushort *)(iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word
)
...>
}


@receiver_21_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- *(undefined2 *)((byte *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- ((undefined2 *)iVar9)[0x2]
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- *(undefined2 *)(iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word
)
...>
}


@receiver_21_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_signed
|
- *(short *)((byte *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_signed
|
- ((short *)iVar9)[0x2]
+ ((uw_object_hdr_t *)iVar9)->chain_word_signed
|
- *(short *)((short *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->chain_word_signed
|
- *(short *)(iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_signed
)
...>
}


@receiver_21_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(byte *)((byte *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- ((byte *)iVar9)[0x4]
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(byte *)((ushort *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- (byte)((ushort *)iVar9)[0x2]
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(byte *)(iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
)
...>
}


@receiver_21_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(undefined1 *)((byte *)iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- ((undefined1 *)iVar9)[0x4]
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar9 + 0x2)
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- (undefined1)((ushort *)iVar9)[0x2]
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(undefined1 *)(iVar9 + 0x4)
+ ((uw_object_hdr_t *)iVar9)->chain_word_low
)
...>
}


@receiver_21_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_low
|
- &*(char *)((byte *)iVar9 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_low
|
- &((char *)iVar9)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_low
|
- &*(char *)((ushort *)iVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_low
|
- &*(char *)(iVar9 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_low
|
- &iVar9[0x4]
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_low
)
...>
}


@receiver_21_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar9 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_low = (byte)E;
|
- ((char *)iVar9)[0x4] = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_low = (byte)E;
|
- *(char *)(iVar9 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_low = (byte)E;
|
- iVar9[0x4] = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_low = (byte)E;
)
...>
}


@receiver_21_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x4)
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(char *)((byte *)iVar9 + 0x4)
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_low
|
- ((char *)iVar9)[0x4]
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(char *)((ushort *)iVar9 + 0x2)
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_low
|
- (char)((ushort *)iVar9)[0x2]
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_low
|
- *(char *)(iVar9 + 0x4)
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_low
|
- iVar9[0x4]
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_low
)
...>
}


@receiver_21_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0x5)
+ ((uw_object_hdr_t *)iVar9)->chain_word_high
|
- *(byte *)((byte *)iVar9 + 0x5)
+ ((uw_object_hdr_t *)iVar9)->chain_word_high
|
- ((byte *)iVar9)[0x5]
+ ((uw_object_hdr_t *)iVar9)->chain_word_high
|
- *(byte *)(iVar9 + 0x5)
+ ((uw_object_hdr_t *)iVar9)->chain_word_high
)
...>
}


@receiver_21_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0x5)
+ ((uw_object_hdr_t *)iVar9)->chain_word_high
|
- *(undefined1 *)((byte *)iVar9 + 0x5)
+ ((uw_object_hdr_t *)iVar9)->chain_word_high
|
- ((undefined1 *)iVar9)[0x5]
+ ((uw_object_hdr_t *)iVar9)->chain_word_high
|
- *(undefined1 *)(iVar9 + 0x5)
+ ((uw_object_hdr_t *)iVar9)->chain_word_high
)
...>
}


@receiver_21_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_high
|
- &*(char *)((byte *)iVar9 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_high
|
- &((char *)iVar9)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_high
|
- &*(char *)(iVar9 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_high
|
- &iVar9[0x5]
+ (char *)&((uw_object_hdr_t *)iVar9)->chain_word_high
)
...>
}


@receiver_21_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar9 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_high = (byte)E;
|
- ((char *)iVar9)[0x5] = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_high = (byte)E;
|
- *(char *)(iVar9 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_high = (byte)E;
|
- iVar9[0x5] = E;
+ ((uw_object_hdr_t *)iVar9)->chain_word_high = (byte)E;
)
...>
}


@receiver_21_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x5)
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_high
|
- *(char *)((byte *)iVar9 + 0x5)
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_high
|
- ((char *)iVar9)[0x5]
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_high
|
- *(char *)(iVar9 + 0x5)
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_high
|
- iVar9[0x5]
+ (char)((uw_object_hdr_t *)iVar9)->chain_word_high
)
...>
}


@receiver_21_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar9 + 0x6) = (char)V;
- *(char *)((char *)iVar9 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->link_word = (ushort)V;

...>
}

@receiver_21_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar9 + 0x6) = (char)V;
- *(byte *)((char *)iVar9 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->link_word = (ushort)V;

...>
}

@receiver_21_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar9 + 0x6) = (byte)V;
- *(char *)((char *)iVar9 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->link_word = (ushort)V;

...>
}

@receiver_21_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar9 + 0x6) = (byte)V;
- *(byte *)((char *)iVar9 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar9)->link_word = (ushort)V;

...>
}

@receiver_21_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- *(ushort *)((byte *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- ((ushort *)iVar9)[0x3]
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- *(ushort *)((ushort *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- *(ushort *)(iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word
)
...>
}


@receiver_21_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- *(undefined2 *)((byte *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- ((undefined2 *)iVar9)[0x3]
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- *(undefined2 *)((undefined2 *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- *(undefined2 *)(iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word
)
...>
}


@receiver_21_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_signed
|
- *(short *)((byte *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_signed
|
- ((short *)iVar9)[0x3]
+ ((uw_object_hdr_t *)iVar9)->link_word_signed
|
- *(short *)((short *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->link_word_signed
|
- *(short *)(iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_signed
)
...>
}


@receiver_21_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(byte *)((byte *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- ((byte *)iVar9)[0x6]
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(byte *)((ushort *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- (byte)((ushort *)iVar9)[0x3]
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(byte *)(iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_low
)
...>
}


@receiver_21_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(undefined1 *)((byte *)iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- ((undefined1 *)iVar9)[0x6]
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(undefined1 *)((ushort *)iVar9 + 0x3)
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- (undefined1)((ushort *)iVar9)[0x3]
+ ((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(undefined1 *)(iVar9 + 0x6)
+ ((uw_object_hdr_t *)iVar9)->link_word_low
)
...>
}


@receiver_21_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_low
|
- &*(char *)((byte *)iVar9 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_low
|
- &((char *)iVar9)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_low
|
- &*(char *)((ushort *)iVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_low
|
- &*(char *)(iVar9 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_low
|
- &iVar9[0x6]
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_low
)
...>
}


@receiver_21_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar9 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_low = (byte)E;
|
- ((char *)iVar9)[0x6] = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_low = (byte)E;
|
- *(char *)(iVar9 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_low = (byte)E;
|
- iVar9[0x6] = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_low = (byte)E;
)
...>
}


@receiver_21_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x6)
+ (char)((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(char *)((byte *)iVar9 + 0x6)
+ (char)((uw_object_hdr_t *)iVar9)->link_word_low
|
- ((char *)iVar9)[0x6]
+ (char)((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(char *)((ushort *)iVar9 + 0x3)
+ (char)((uw_object_hdr_t *)iVar9)->link_word_low
|
- (char)((ushort *)iVar9)[0x3]
+ (char)((uw_object_hdr_t *)iVar9)->link_word_low
|
- *(char *)(iVar9 + 0x6)
+ (char)((uw_object_hdr_t *)iVar9)->link_word_low
|
- iVar9[0x6]
+ (char)((uw_object_hdr_t *)iVar9)->link_word_low
)
...>
}


@receiver_21_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0x7)
+ ((uw_object_hdr_t *)iVar9)->link_word_high
|
- *(byte *)((byte *)iVar9 + 0x7)
+ ((uw_object_hdr_t *)iVar9)->link_word_high
|
- ((byte *)iVar9)[0x7]
+ ((uw_object_hdr_t *)iVar9)->link_word_high
|
- *(byte *)(iVar9 + 0x7)
+ ((uw_object_hdr_t *)iVar9)->link_word_high
)
...>
}


@receiver_21_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0x7)
+ ((uw_object_hdr_t *)iVar9)->link_word_high
|
- *(undefined1 *)((byte *)iVar9 + 0x7)
+ ((uw_object_hdr_t *)iVar9)->link_word_high
|
- ((undefined1 *)iVar9)[0x7]
+ ((uw_object_hdr_t *)iVar9)->link_word_high
|
- *(undefined1 *)(iVar9 + 0x7)
+ ((uw_object_hdr_t *)iVar9)->link_word_high
)
...>
}


@receiver_21_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_high
|
- &*(char *)((byte *)iVar9 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_high
|
- &((char *)iVar9)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_high
|
- &*(char *)(iVar9 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_high
|
- &iVar9[0x7]
+ (char *)&((uw_object_hdr_t *)iVar9)->link_word_high
)
...>
}


@receiver_21_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar9 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_high = (byte)E;
|
- ((char *)iVar9)[0x7] = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_high = (byte)E;
|
- *(char *)(iVar9 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_high = (byte)E;
|
- iVar9[0x7] = E;
+ ((uw_object_hdr_t *)iVar9)->link_word_high = (byte)E;
)
...>
}


@receiver_21_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0x7)
+ (char)((uw_object_hdr_t *)iVar9)->link_word_high
|
- *(char *)((byte *)iVar9 + 0x7)
+ (char)((uw_object_hdr_t *)iVar9)->link_word_high
|
- ((char *)iVar9)[0x7]
+ (char)((uw_object_hdr_t *)iVar9)->link_word_high
|
- *(char *)(iVar9 + 0x7)
+ (char)((uw_object_hdr_t *)iVar9)->link_word_high
|
- iVar9[0x7]
+ (char)((uw_object_hdr_t *)iVar9)->link_word_high
)
...>
}


@receiver_22_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@receiver_22_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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


@receiver_22_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
