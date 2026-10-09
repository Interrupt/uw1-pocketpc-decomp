@iVar2_w_11_0_pair_char_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0xb) = (char)V;
- *(char *)((char *)iVar2 + 0xc) = (char)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->goal_word = (ushort)V;

...>
}

@iVar2_w_11_0_pair_char_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0xb) = (char)V;
- *(byte *)((char *)iVar2 + 0xc) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->goal_word = (ushort)V;

...>
}

@iVar2_w_11_0_pair_byte_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0xb) = (byte)V;
- *(char *)((char *)iVar2 + 0xc) = (char)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->goal_word = (ushort)V;

...>
}

@iVar2_w_11_0_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0xb) = (byte)V;
- *(byte *)((char *)iVar2 + 0xc) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->goal_word = (ushort)V;

...>
}

@iVar2_w_11_0_word_ushort@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word
|
- *(ushort *)((byte *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word
|
- *(ushort *)(iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word
)
...>
}


@iVar2_w_11_0_word_undefined2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word
|
- *(undefined2 *)((byte *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word
|
- *(undefined2 *)(iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word
)
...>
}


@iVar2_w_11_0_word_short@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_signed
|
- *(short *)((byte *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_signed
|
- *(short *)(iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_signed
)
...>
}


@iVar2_w_11_0_byte_11_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(byte *)((byte *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- ((byte *)iVar2)[0xb]
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(byte *)(iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}


@iVar2_w_11_0_byte_11_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(undefined1 *)((byte *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- ((undefined1 *)iVar2)[0xb]
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(undefined1 *)(iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}


@iVar2_w_11_0_address_11@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0xb)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
|
- &*(char *)((byte *)iVar2 + 0xb)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
|
- &((char *)iVar2)[0xb]
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
|
- &*(char *)(iVar2 + 0xb)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
|
- &iVar2[0xb]
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}


@iVar2_w_11_0_store_11@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0xb) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
|
- *(char *)((byte *)iVar2 + 0xb) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
|
- ((char *)iVar2)[0xb] = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
|
- *(char *)(iVar2 + 0xb) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
|
- iVar2[0xb] = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
)
...>
}


@iVar2_w_11_0_byte_11_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0xb)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(char *)((byte *)iVar2 + 0xb)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
|
- ((char *)iVar2)[0xb]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(char *)(iVar2 + 0xb)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
|
- iVar2[0xb]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}


@iVar2_w_11_0_byte_12_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0xc)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(byte *)((byte *)iVar2 + 0xc)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- ((byte *)iVar2)[0xc]
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(byte *)((ushort *)iVar2 + 0x6)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- (byte)((ushort *)iVar2)[0x6]
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(byte *)(iVar2 + 0xc)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}


@iVar2_w_11_0_byte_12_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0xc)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(undefined1 *)((byte *)iVar2 + 0xc)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- ((undefined1 *)iVar2)[0xc]
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(undefined1 *)((ushort *)iVar2 + 0x6)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- (undefined1)((ushort *)iVar2)[0x6]
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(undefined1 *)(iVar2 + 0xc)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}


@iVar2_w_11_0_address_12@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0xc)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &*(char *)((byte *)iVar2 + 0xc)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &((char *)iVar2)[0xc]
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &*(char *)((ushort *)iVar2 + 0x6)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &*(char *)(iVar2 + 0xc)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &iVar2[0xc]
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}


@iVar2_w_11_0_store_12@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0xc) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- *(char *)((byte *)iVar2 + 0xc) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- ((char *)iVar2)[0xc] = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- *(char *)((ushort *)iVar2 + 0x6) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- *(char *)(iVar2 + 0xc) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- iVar2[0xc] = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
)
...>
}


@iVar2_w_11_0_byte_12_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0xc)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(char *)((byte *)iVar2 + 0xc)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- ((char *)iVar2)[0xc]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(char *)((ushort *)iVar2 + 0x6)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- (char)((ushort *)iVar2)[0x6]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(char *)(iVar2 + 0xc)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- iVar2[0xc]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}


@iVar2_w_13_17_pair_char_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0xd) = (char)V;
- *(char *)((char *)iVar2 + 0xe) = (char)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->status_word = (ushort)V;

...>
}

@iVar2_w_13_17_pair_char_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0xd) = (char)V;
- *(byte *)((char *)iVar2 + 0xe) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->status_word = (ushort)V;

...>
}

@iVar2_w_13_17_pair_byte_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0xd) = (byte)V;
- *(char *)((char *)iVar2 + 0xe) = (char)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->status_word = (ushort)V;

...>
}

@iVar2_w_13_17_pair_byte_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0xd) = (byte)V;
- *(byte *)((char *)iVar2 + 0xe) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->status_word = (ushort)V;

...>
}

@iVar2_w_13_17_word_ushort@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word
|
- *(ushort *)((byte *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word
|
- *(ushort *)(iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word
)
...>
}


@iVar2_w_13_17_word_undefined2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word
|
- *(undefined2 *)((byte *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word
|
- *(undefined2 *)(iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word
)
...>
}


@iVar2_w_13_17_word_short@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_signed
|
- *(short *)((byte *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_signed
|
- *(short *)(iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_signed
)
...>
}


@iVar2_w_13_17_byte_13_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(byte *)((byte *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- ((byte *)iVar2)[0xd]
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(byte *)(iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}


@iVar2_w_13_17_byte_13_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(undefined1 *)((byte *)iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- ((undefined1 *)iVar2)[0xd]
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(undefined1 *)(iVar2 + 0xd)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}


@iVar2_w_13_17_address_13@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0xd)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
|
- &*(char *)((byte *)iVar2 + 0xd)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
|
- &((char *)iVar2)[0xd]
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
|
- &*(char *)(iVar2 + 0xd)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
|
- &iVar2[0xd]
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}


@iVar2_w_13_17_store_13@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0xd) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
|
- *(char *)((byte *)iVar2 + 0xd) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
|
- ((char *)iVar2)[0xd] = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
|
- *(char *)(iVar2 + 0xd) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
|
- iVar2[0xd] = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
)
...>
}


@iVar2_w_13_17_byte_13_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0xd)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(char *)((byte *)iVar2 + 0xd)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
|
- ((char *)iVar2)[0xd]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(char *)(iVar2 + 0xd)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
|
- iVar2[0xd]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}


@iVar2_w_13_17_byte_14_byte@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0xe)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(byte *)((byte *)iVar2 + 0xe)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- ((byte *)iVar2)[0xe]
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(byte *)((ushort *)iVar2 + 0x7)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- (byte)((ushort *)iVar2)[0x7]
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(byte *)(iVar2 + 0xe)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}


@iVar2_w_13_17_byte_14_undefined1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0xe)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(undefined1 *)((byte *)iVar2 + 0xe)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- ((undefined1 *)iVar2)[0xe]
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(undefined1 *)((ushort *)iVar2 + 0x7)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- (undefined1)((ushort *)iVar2)[0x7]
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(undefined1 *)(iVar2 + 0xe)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}


@iVar2_w_13_17_address_14@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0xe)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &*(char *)((byte *)iVar2 + 0xe)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &((char *)iVar2)[0xe]
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &*(char *)((ushort *)iVar2 + 0x7)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &*(char *)(iVar2 + 0xe)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &iVar2[0xe]
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}


@iVar2_w_13_17_store_14@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0xe) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- *(char *)((byte *)iVar2 + 0xe) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- ((char *)iVar2)[0xe] = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- *(char *)((ushort *)iVar2 + 0x7) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- *(char *)(iVar2 + 0xe) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- iVar2[0xe] = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
)
...>
}


@iVar2_w_13_17_byte_14_char@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0xe)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(char *)((byte *)iVar2 + 0xe)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- ((char *)iVar2)[0xe]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(char *)((ushort *)iVar2 + 0x7)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- (char)((ushort *)iVar2)[0x7]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(char *)(iVar2 + 0xe)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- iVar2[0xe]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}


@trigger_scripted_npc_conversation_iVar2_identity@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(iVar2 + 0x1a)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@status_word_npc_level_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (B->status_word & 0xf) >> 0
+ B->npc_level
|
- (B->status_word >> 0) & 0xf
+ B->npc_level
|
- B->status_word & 0xf
+ B->npc_level
|
- (B->status_word_signed & 0xf) >> 0
+ B->npc_level
|
- (B->status_word_signed >> 0) & 0xf
+ B->npc_level
|
- B->status_word_signed & 0xf
+ B->npc_level
|
- (B->status_word_low & 0xf) >> 0
+ B->npc_level
|
- (B->status_word_low >> 0) & 0xf
+ B->npc_level
|
- B->status_word_low & 0xf
+ B->npc_level
|
- ((char)B->status_word_low & 0xf) >> 0
+ B->npc_level
|
- ((char)B->status_word_low >> 0) & 0xf
+ B->npc_level
|
- (char)B->status_word_low & 0xf
+ B->npc_level
|
- ((byte)B->status_word & 0xf) >> 0
+ B->npc_level
|
- ((byte)B->status_word >> 0) & 0xf
+ B->npc_level
|
- (byte)B->status_word & 0xf
+ B->npc_level
|
- ((char)B->status_word & 0xf) >> 0
+ B->npc_level
|
- ((char)B->status_word >> 0) & 0xf
+ B->npc_level
|
- (char)B->status_word & 0xf
+ B->npc_level
)

@status_word_npc_talkedto_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B->status_word >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word & 0x2000) >> 13
+ B->npc_talkedto
|
- B->status_word & 0x2000
+ (B->npc_talkedto << 13)
|
- (byte)(B->status_word_signed >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word_signed >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word_signed & 0x2000) >> 13
+ B->npc_talkedto
|
- B->status_word_signed & 0x2000
+ (B->npc_talkedto << 13)
|
- (byte)(B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- (B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- (B->status_word_high & 0x20) >> 5
+ B->npc_talkedto
|
- B->status_word_high & 0x20
+ (B->npc_talkedto << 5)
|
- (byte)((char)B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- ((char)B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- ((char)B->status_word_high & 0x20) >> 5
+ B->npc_talkedto
|
- (char)B->status_word_high & 0x20
+ (B->npc_talkedto << 5)
)

@status_word_npc_attitude_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B->status_word >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word & 0xc000) >> 14
+ B->npc_attitude
|
- B->status_word >> 14
+ B->npc_attitude
|
- B->status_word & 0xc000
+ (B->npc_attitude << 14)
|
- (byte)(B->status_word_signed >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word_signed >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word_signed & 0xc000) >> 14
+ B->npc_attitude
|
- B->status_word_signed & 0xc000
+ (B->npc_attitude << 14)
|
- (byte)(B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- (B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- (B->status_word_high & 0xc0) >> 6
+ B->npc_attitude
|
- B->status_word_high >> 6
+ B->npc_attitude
|
- B->status_word_high & 0xc0
+ (B->npc_attitude << 6)
|
- (byte)((char)B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- ((char)B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- ((char)B->status_word_high & 0xc0) >> 6
+ B->npc_attitude
|
- (char)B->status_word_high & 0xc0
+ (B->npc_attitude << 6)
)

@tile_position_tile_y_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B->tile_position >> 4) & 0x3f
+ B->tile_y
|
- (B->tile_position >> 4) & 0x3f
+ B->tile_y
|
- (B->tile_position & 0x3f0) >> 4
+ B->tile_y
|
- B->tile_position & 0x3f0
+ (B->tile_y << 4)
|
- (byte)(B->tile_position_signed >> 4) & 0x3f
+ B->tile_y
|
- (B->tile_position_signed >> 4) & 0x3f
+ B->tile_y
|
- (B->tile_position_signed & 0x3f0) >> 4
+ B->tile_y
|
- B->tile_position_signed & 0x3f0
+ (B->tile_y << 4)
)

@tile_position_tile_x_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B->tile_position >> 10) & 0x3f
+ B->tile_x
|
- (B->tile_position >> 10) & 0x3f
+ B->tile_x
|
- (B->tile_position & 0xfc00) >> 10
+ B->tile_x
|
- B->tile_position >> 10
+ B->tile_x
|
- B->tile_position & 0xfc00
+ (B->tile_x << 10)
|
- (byte)(B->tile_position_signed >> 10) & 0x3f
+ B->tile_x
|
- (B->tile_position_signed >> 10) & 0x3f
+ B->tile_x
|
- (B->tile_position_signed & 0xfc00) >> 10
+ B->tile_x
|
- B->tile_position_signed & 0xfc00
+ (B->tile_x << 10)
|
- (byte)(B->tile_position_high >> 2) & 0x3f
+ B->tile_x
|
- (B->tile_position_high >> 2) & 0x3f
+ B->tile_x
|
- (B->tile_position_high & 0xfc) >> 2
+ B->tile_x
|
- B->tile_position_high >> 2
+ B->tile_x
|
- B->tile_position_high & 0xfc
+ (B->tile_x << 2)
|
- (byte)((char)B->tile_position_high >> 2) & 0x3f
+ B->tile_x
|
- ((char)B->tile_position_high >> 2) & 0x3f
+ B->tile_x
|
- ((char)B->tile_position_high & 0xfc) >> 2
+ B->tile_x
|
- (char)B->tile_position_high & 0xfc
+ (B->tile_x << 2)
)

@status_word_npc_level_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (B.status_word & 0xf) >> 0
+ B.npc_level
|
- (B.status_word >> 0) & 0xf
+ B.npc_level
|
- B.status_word & 0xf
+ B.npc_level
|
- (B.status_word_signed & 0xf) >> 0
+ B.npc_level
|
- (B.status_word_signed >> 0) & 0xf
+ B.npc_level
|
- B.status_word_signed & 0xf
+ B.npc_level
|
- (B.status_word_low & 0xf) >> 0
+ B.npc_level
|
- (B.status_word_low >> 0) & 0xf
+ B.npc_level
|
- B.status_word_low & 0xf
+ B.npc_level
|
- ((char)B.status_word_low & 0xf) >> 0
+ B.npc_level
|
- ((char)B.status_word_low >> 0) & 0xf
+ B.npc_level
|
- (char)B.status_word_low & 0xf
+ B.npc_level
|
- ((byte)B.status_word & 0xf) >> 0
+ B.npc_level
|
- ((byte)B.status_word >> 0) & 0xf
+ B.npc_level
|
- (byte)B.status_word & 0xf
+ B.npc_level
|
- ((char)B.status_word & 0xf) >> 0
+ B.npc_level
|
- ((char)B.status_word >> 0) & 0xf
+ B.npc_level
|
- (char)B.status_word & 0xf
+ B.npc_level
)

@status_word_npc_talkedto_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B.status_word >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word & 0x2000) >> 13
+ B.npc_talkedto
|
- B.status_word & 0x2000
+ (B.npc_talkedto << 13)
|
- (byte)(B.status_word_signed >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word_signed >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word_signed & 0x2000) >> 13
+ B.npc_talkedto
|
- B.status_word_signed & 0x2000
+ (B.npc_talkedto << 13)
|
- (byte)(B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- (B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- (B.status_word_high & 0x20) >> 5
+ B.npc_talkedto
|
- B.status_word_high & 0x20
+ (B.npc_talkedto << 5)
|
- (byte)((char)B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- ((char)B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- ((char)B.status_word_high & 0x20) >> 5
+ B.npc_talkedto
|
- (char)B.status_word_high & 0x20
+ (B.npc_talkedto << 5)
)

@status_word_npc_attitude_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B.status_word >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word & 0xc000) >> 14
+ B.npc_attitude
|
- B.status_word >> 14
+ B.npc_attitude
|
- B.status_word & 0xc000
+ (B.npc_attitude << 14)
|
- (byte)(B.status_word_signed >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word_signed >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word_signed & 0xc000) >> 14
+ B.npc_attitude
|
- B.status_word_signed & 0xc000
+ (B.npc_attitude << 14)
|
- (byte)(B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- (B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- (B.status_word_high & 0xc0) >> 6
+ B.npc_attitude
|
- B.status_word_high >> 6
+ B.npc_attitude
|
- B.status_word_high & 0xc0
+ (B.npc_attitude << 6)
|
- (byte)((char)B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- ((char)B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- ((char)B.status_word_high & 0xc0) >> 6
+ B.npc_attitude
|
- (char)B.status_word_high & 0xc0
+ (B.npc_attitude << 6)
)

@tile_position_tile_y_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B.tile_position >> 4) & 0x3f
+ B.tile_y
|
- (B.tile_position >> 4) & 0x3f
+ B.tile_y
|
- (B.tile_position & 0x3f0) >> 4
+ B.tile_y
|
- B.tile_position & 0x3f0
+ (B.tile_y << 4)
|
- (byte)(B.tile_position_signed >> 4) & 0x3f
+ B.tile_y
|
- (B.tile_position_signed >> 4) & 0x3f
+ B.tile_y
|
- (B.tile_position_signed & 0x3f0) >> 4
+ B.tile_y
|
- B.tile_position_signed & 0x3f0
+ (B.tile_y << 4)
)

@tile_position_tile_x_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B.tile_position >> 10) & 0x3f
+ B.tile_x
|
- (B.tile_position >> 10) & 0x3f
+ B.tile_x
|
- (B.tile_position & 0xfc00) >> 10
+ B.tile_x
|
- B.tile_position >> 10
+ B.tile_x
|
- B.tile_position & 0xfc00
+ (B.tile_x << 10)
|
- (byte)(B.tile_position_signed >> 10) & 0x3f
+ B.tile_x
|
- (B.tile_position_signed >> 10) & 0x3f
+ B.tile_x
|
- (B.tile_position_signed & 0xfc00) >> 10
+ B.tile_x
|
- B.tile_position_signed & 0xfc00
+ (B.tile_x << 10)
|
- (byte)(B.tile_position_high >> 2) & 0x3f
+ B.tile_x
|
- (B.tile_position_high >> 2) & 0x3f
+ B.tile_x
|
- (B.tile_position_high & 0xfc) >> 2
+ B.tile_x
|
- B.tile_position_high >> 2
+ B.tile_x
|
- B.tile_position_high & 0xfc
+ (B.tile_x << 2)
|
- (byte)((char)B.tile_position_high >> 2) & 0x3f
+ B.tile_x
|
- ((char)B.tile_position_high >> 2) & 0x3f
+ B.tile_x
|
- ((char)B.tile_position_high & 0xfc) >> 2
+ B.tile_x
|
- (char)B.tile_position_high & 0xfc
+ (B.tile_x << 2)
)

@compare_status_word_npc_talkedto_5_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->npc_talkedto << 5) == 0x0
+ B->npc_talkedto == 0
|
- ((B->npc_talkedto << 5)) == 0x0
+ B->npc_talkedto == 0
|
- (B->npc_talkedto << 5) != 0x0
+ B->npc_talkedto != 0
|
- ((B->npc_talkedto << 5)) != 0x0
+ B->npc_talkedto != 0
|
- (B->npc_talkedto << 5) == 0x20
+ B->npc_talkedto == 1
|
- ((B->npc_talkedto << 5)) == 0x20
+ B->npc_talkedto == 1
|
- (B->npc_talkedto << 5) != 0x20
+ B->npc_talkedto != 1
|
- ((B->npc_talkedto << 5)) != 0x20
+ B->npc_talkedto != 1
)

@compare_status_word_npc_talkedto_13_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->npc_talkedto << 13) == 0x0
+ B->npc_talkedto == 0
|
- ((B->npc_talkedto << 13)) == 0x0
+ B->npc_talkedto == 0
|
- (B->npc_talkedto << 13) != 0x0
+ B->npc_talkedto != 0
|
- ((B->npc_talkedto << 13)) != 0x0
+ B->npc_talkedto != 0
|
- (B->npc_talkedto << 13) == 0x2000
+ B->npc_talkedto == 1
|
- ((B->npc_talkedto << 13)) == 0x2000
+ B->npc_talkedto == 1
|
- (B->npc_talkedto << 13) != 0x2000
+ B->npc_talkedto != 1
|
- ((B->npc_talkedto << 13)) != 0x2000
+ B->npc_talkedto != 1
)

@compare_status_word_npc_attitude_6_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->npc_attitude << 6) == 0x0
+ B->npc_attitude == 0
|
- ((B->npc_attitude << 6)) == 0x0
+ B->npc_attitude == 0
|
- (B->npc_attitude << 6) != 0x0
+ B->npc_attitude != 0
|
- ((B->npc_attitude << 6)) != 0x0
+ B->npc_attitude != 0
|
- (B->npc_attitude << 6) == 0x40
+ B->npc_attitude == 1
|
- ((B->npc_attitude << 6)) == 0x40
+ B->npc_attitude == 1
|
- (B->npc_attitude << 6) != 0x40
+ B->npc_attitude != 1
|
- ((B->npc_attitude << 6)) != 0x40
+ B->npc_attitude != 1
|
- (B->npc_attitude << 6) == 0x80
+ B->npc_attitude == 2
|
- ((B->npc_attitude << 6)) == 0x80
+ B->npc_attitude == 2
|
- (B->npc_attitude << 6) != 0x80
+ B->npc_attitude != 2
|
- ((B->npc_attitude << 6)) != 0x80
+ B->npc_attitude != 2
|
- (B->npc_attitude << 6) == 0xc0
+ B->npc_attitude == 3
|
- ((B->npc_attitude << 6)) == 0xc0
+ B->npc_attitude == 3
|
- (B->npc_attitude << 6) != 0xc0
+ B->npc_attitude != 3
|
- ((B->npc_attitude << 6)) != 0xc0
+ B->npc_attitude != 3
)

@compare_status_word_npc_attitude_14_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->npc_attitude << 14) == 0x0
+ B->npc_attitude == 0
|
- ((B->npc_attitude << 14)) == 0x0
+ B->npc_attitude == 0
|
- (B->npc_attitude << 14) != 0x0
+ B->npc_attitude != 0
|
- ((B->npc_attitude << 14)) != 0x0
+ B->npc_attitude != 0
|
- (B->npc_attitude << 14) == 0x4000
+ B->npc_attitude == 1
|
- ((B->npc_attitude << 14)) == 0x4000
+ B->npc_attitude == 1
|
- (B->npc_attitude << 14) != 0x4000
+ B->npc_attitude != 1
|
- ((B->npc_attitude << 14)) != 0x4000
+ B->npc_attitude != 1
|
- (B->npc_attitude << 14) == 0x8000
+ B->npc_attitude == 2
|
- ((B->npc_attitude << 14)) == 0x8000
+ B->npc_attitude == 2
|
- (B->npc_attitude << 14) != 0x8000
+ B->npc_attitude != 2
|
- ((B->npc_attitude << 14)) != 0x8000
+ B->npc_attitude != 2
|
- (B->npc_attitude << 14) == 0xc000
+ B->npc_attitude == 3
|
- ((B->npc_attitude << 14)) == 0xc000
+ B->npc_attitude == 3
|
- (B->npc_attitude << 14) != 0xc000
+ B->npc_attitude != 3
|
- ((B->npc_attitude << 14)) != 0xc000
+ B->npc_attitude != 3
)

@compare_tile_position_tile_y_4_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->tile_y << 4) == 0x0
+ B->tile_y == 0
|
- ((B->tile_y << 4)) == 0x0
+ B->tile_y == 0
|
- (B->tile_y << 4) != 0x0
+ B->tile_y != 0
|
- ((B->tile_y << 4)) != 0x0
+ B->tile_y != 0
|
- (B->tile_y << 4) == 0x10
+ B->tile_y == 1
|
- ((B->tile_y << 4)) == 0x10
+ B->tile_y == 1
|
- (B->tile_y << 4) != 0x10
+ B->tile_y != 1
|
- ((B->tile_y << 4)) != 0x10
+ B->tile_y != 1
|
- (B->tile_y << 4) == 0x20
+ B->tile_y == 2
|
- ((B->tile_y << 4)) == 0x20
+ B->tile_y == 2
|
- (B->tile_y << 4) != 0x20
+ B->tile_y != 2
|
- ((B->tile_y << 4)) != 0x20
+ B->tile_y != 2
|
- (B->tile_y << 4) == 0x30
+ B->tile_y == 3
|
- ((B->tile_y << 4)) == 0x30
+ B->tile_y == 3
|
- (B->tile_y << 4) != 0x30
+ B->tile_y != 3
|
- ((B->tile_y << 4)) != 0x30
+ B->tile_y != 3
|
- (B->tile_y << 4) == 0x40
+ B->tile_y == 4
|
- ((B->tile_y << 4)) == 0x40
+ B->tile_y == 4
|
- (B->tile_y << 4) != 0x40
+ B->tile_y != 4
|
- ((B->tile_y << 4)) != 0x40
+ B->tile_y != 4
|
- (B->tile_y << 4) == 0x50
+ B->tile_y == 5
|
- ((B->tile_y << 4)) == 0x50
+ B->tile_y == 5
|
- (B->tile_y << 4) != 0x50
+ B->tile_y != 5
|
- ((B->tile_y << 4)) != 0x50
+ B->tile_y != 5
|
- (B->tile_y << 4) == 0x60
+ B->tile_y == 6
|
- ((B->tile_y << 4)) == 0x60
+ B->tile_y == 6
|
- (B->tile_y << 4) != 0x60
+ B->tile_y != 6
|
- ((B->tile_y << 4)) != 0x60
+ B->tile_y != 6
|
- (B->tile_y << 4) == 0x70
+ B->tile_y == 7
|
- ((B->tile_y << 4)) == 0x70
+ B->tile_y == 7
|
- (B->tile_y << 4) != 0x70
+ B->tile_y != 7
|
- ((B->tile_y << 4)) != 0x70
+ B->tile_y != 7
|
- (B->tile_y << 4) == 0x80
+ B->tile_y == 8
|
- ((B->tile_y << 4)) == 0x80
+ B->tile_y == 8
|
- (B->tile_y << 4) != 0x80
+ B->tile_y != 8
|
- ((B->tile_y << 4)) != 0x80
+ B->tile_y != 8
|
- (B->tile_y << 4) == 0x90
+ B->tile_y == 9
|
- ((B->tile_y << 4)) == 0x90
+ B->tile_y == 9
|
- (B->tile_y << 4) != 0x90
+ B->tile_y != 9
|
- ((B->tile_y << 4)) != 0x90
+ B->tile_y != 9
|
- (B->tile_y << 4) == 0xa0
+ B->tile_y == 10
|
- ((B->tile_y << 4)) == 0xa0
+ B->tile_y == 10
|
- (B->tile_y << 4) != 0xa0
+ B->tile_y != 10
|
- ((B->tile_y << 4)) != 0xa0
+ B->tile_y != 10
|
- (B->tile_y << 4) == 0xb0
+ B->tile_y == 11
|
- ((B->tile_y << 4)) == 0xb0
+ B->tile_y == 11
|
- (B->tile_y << 4) != 0xb0
+ B->tile_y != 11
|
- ((B->tile_y << 4)) != 0xb0
+ B->tile_y != 11
|
- (B->tile_y << 4) == 0xc0
+ B->tile_y == 12
|
- ((B->tile_y << 4)) == 0xc0
+ B->tile_y == 12
|
- (B->tile_y << 4) != 0xc0
+ B->tile_y != 12
|
- ((B->tile_y << 4)) != 0xc0
+ B->tile_y != 12
|
- (B->tile_y << 4) == 0xd0
+ B->tile_y == 13
|
- ((B->tile_y << 4)) == 0xd0
+ B->tile_y == 13
|
- (B->tile_y << 4) != 0xd0
+ B->tile_y != 13
|
- ((B->tile_y << 4)) != 0xd0
+ B->tile_y != 13
|
- (B->tile_y << 4) == 0xe0
+ B->tile_y == 14
|
- ((B->tile_y << 4)) == 0xe0
+ B->tile_y == 14
|
- (B->tile_y << 4) != 0xe0
+ B->tile_y != 14
|
- ((B->tile_y << 4)) != 0xe0
+ B->tile_y != 14
|
- (B->tile_y << 4) == 0xf0
+ B->tile_y == 15
|
- ((B->tile_y << 4)) == 0xf0
+ B->tile_y == 15
|
- (B->tile_y << 4) != 0xf0
+ B->tile_y != 15
|
- ((B->tile_y << 4)) != 0xf0
+ B->tile_y != 15
)

@compare_tile_position_tile_x_2_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->tile_x << 2) == 0x0
+ B->tile_x == 0
|
- ((B->tile_x << 2)) == 0x0
+ B->tile_x == 0
|
- (B->tile_x << 2) != 0x0
+ B->tile_x != 0
|
- ((B->tile_x << 2)) != 0x0
+ B->tile_x != 0
|
- (B->tile_x << 2) == 0x4
+ B->tile_x == 1
|
- ((B->tile_x << 2)) == 0x4
+ B->tile_x == 1
|
- (B->tile_x << 2) != 0x4
+ B->tile_x != 1
|
- ((B->tile_x << 2)) != 0x4
+ B->tile_x != 1
|
- (B->tile_x << 2) == 0x8
+ B->tile_x == 2
|
- ((B->tile_x << 2)) == 0x8
+ B->tile_x == 2
|
- (B->tile_x << 2) != 0x8
+ B->tile_x != 2
|
- ((B->tile_x << 2)) != 0x8
+ B->tile_x != 2
|
- (B->tile_x << 2) == 0xc
+ B->tile_x == 3
|
- ((B->tile_x << 2)) == 0xc
+ B->tile_x == 3
|
- (B->tile_x << 2) != 0xc
+ B->tile_x != 3
|
- ((B->tile_x << 2)) != 0xc
+ B->tile_x != 3
|
- (B->tile_x << 2) == 0x10
+ B->tile_x == 4
|
- ((B->tile_x << 2)) == 0x10
+ B->tile_x == 4
|
- (B->tile_x << 2) != 0x10
+ B->tile_x != 4
|
- ((B->tile_x << 2)) != 0x10
+ B->tile_x != 4
|
- (B->tile_x << 2) == 0x14
+ B->tile_x == 5
|
- ((B->tile_x << 2)) == 0x14
+ B->tile_x == 5
|
- (B->tile_x << 2) != 0x14
+ B->tile_x != 5
|
- ((B->tile_x << 2)) != 0x14
+ B->tile_x != 5
|
- (B->tile_x << 2) == 0x18
+ B->tile_x == 6
|
- ((B->tile_x << 2)) == 0x18
+ B->tile_x == 6
|
- (B->tile_x << 2) != 0x18
+ B->tile_x != 6
|
- ((B->tile_x << 2)) != 0x18
+ B->tile_x != 6
|
- (B->tile_x << 2) == 0x1c
+ B->tile_x == 7
|
- ((B->tile_x << 2)) == 0x1c
+ B->tile_x == 7
|
- (B->tile_x << 2) != 0x1c
+ B->tile_x != 7
|
- ((B->tile_x << 2)) != 0x1c
+ B->tile_x != 7
|
- (B->tile_x << 2) == 0x20
+ B->tile_x == 8
|
- ((B->tile_x << 2)) == 0x20
+ B->tile_x == 8
|
- (B->tile_x << 2) != 0x20
+ B->tile_x != 8
|
- ((B->tile_x << 2)) != 0x20
+ B->tile_x != 8
|
- (B->tile_x << 2) == 0x24
+ B->tile_x == 9
|
- ((B->tile_x << 2)) == 0x24
+ B->tile_x == 9
|
- (B->tile_x << 2) != 0x24
+ B->tile_x != 9
|
- ((B->tile_x << 2)) != 0x24
+ B->tile_x != 9
|
- (B->tile_x << 2) == 0x28
+ B->tile_x == 10
|
- ((B->tile_x << 2)) == 0x28
+ B->tile_x == 10
|
- (B->tile_x << 2) != 0x28
+ B->tile_x != 10
|
- ((B->tile_x << 2)) != 0x28
+ B->tile_x != 10
|
- (B->tile_x << 2) == 0x2c
+ B->tile_x == 11
|
- ((B->tile_x << 2)) == 0x2c
+ B->tile_x == 11
|
- (B->tile_x << 2) != 0x2c
+ B->tile_x != 11
|
- ((B->tile_x << 2)) != 0x2c
+ B->tile_x != 11
|
- (B->tile_x << 2) == 0x30
+ B->tile_x == 12
|
- ((B->tile_x << 2)) == 0x30
+ B->tile_x == 12
|
- (B->tile_x << 2) != 0x30
+ B->tile_x != 12
|
- ((B->tile_x << 2)) != 0x30
+ B->tile_x != 12
|
- (B->tile_x << 2) == 0x34
+ B->tile_x == 13
|
- ((B->tile_x << 2)) == 0x34
+ B->tile_x == 13
|
- (B->tile_x << 2) != 0x34
+ B->tile_x != 13
|
- ((B->tile_x << 2)) != 0x34
+ B->tile_x != 13
|
- (B->tile_x << 2) == 0x38
+ B->tile_x == 14
|
- ((B->tile_x << 2)) == 0x38
+ B->tile_x == 14
|
- (B->tile_x << 2) != 0x38
+ B->tile_x != 14
|
- ((B->tile_x << 2)) != 0x38
+ B->tile_x != 14
|
- (B->tile_x << 2) == 0x3c
+ B->tile_x == 15
|
- ((B->tile_x << 2)) == 0x3c
+ B->tile_x == 15
|
- (B->tile_x << 2) != 0x3c
+ B->tile_x != 15
|
- ((B->tile_x << 2)) != 0x3c
+ B->tile_x != 15
)

@compare_tile_position_tile_x_10_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->tile_x << 10) == 0x0
+ B->tile_x == 0
|
- ((B->tile_x << 10)) == 0x0
+ B->tile_x == 0
|
- (B->tile_x << 10) != 0x0
+ B->tile_x != 0
|
- ((B->tile_x << 10)) != 0x0
+ B->tile_x != 0
|
- (B->tile_x << 10) == 0x400
+ B->tile_x == 1
|
- ((B->tile_x << 10)) == 0x400
+ B->tile_x == 1
|
- (B->tile_x << 10) != 0x400
+ B->tile_x != 1
|
- ((B->tile_x << 10)) != 0x400
+ B->tile_x != 1
|
- (B->tile_x << 10) == 0x800
+ B->tile_x == 2
|
- ((B->tile_x << 10)) == 0x800
+ B->tile_x == 2
|
- (B->tile_x << 10) != 0x800
+ B->tile_x != 2
|
- ((B->tile_x << 10)) != 0x800
+ B->tile_x != 2
|
- (B->tile_x << 10) == 0xc00
+ B->tile_x == 3
|
- ((B->tile_x << 10)) == 0xc00
+ B->tile_x == 3
|
- (B->tile_x << 10) != 0xc00
+ B->tile_x != 3
|
- ((B->tile_x << 10)) != 0xc00
+ B->tile_x != 3
|
- (B->tile_x << 10) == 0x1000
+ B->tile_x == 4
|
- ((B->tile_x << 10)) == 0x1000
+ B->tile_x == 4
|
- (B->tile_x << 10) != 0x1000
+ B->tile_x != 4
|
- ((B->tile_x << 10)) != 0x1000
+ B->tile_x != 4
|
- (B->tile_x << 10) == 0x1400
+ B->tile_x == 5
|
- ((B->tile_x << 10)) == 0x1400
+ B->tile_x == 5
|
- (B->tile_x << 10) != 0x1400
+ B->tile_x != 5
|
- ((B->tile_x << 10)) != 0x1400
+ B->tile_x != 5
|
- (B->tile_x << 10) == 0x1800
+ B->tile_x == 6
|
- ((B->tile_x << 10)) == 0x1800
+ B->tile_x == 6
|
- (B->tile_x << 10) != 0x1800
+ B->tile_x != 6
|
- ((B->tile_x << 10)) != 0x1800
+ B->tile_x != 6
|
- (B->tile_x << 10) == 0x1c00
+ B->tile_x == 7
|
- ((B->tile_x << 10)) == 0x1c00
+ B->tile_x == 7
|
- (B->tile_x << 10) != 0x1c00
+ B->tile_x != 7
|
- ((B->tile_x << 10)) != 0x1c00
+ B->tile_x != 7
|
- (B->tile_x << 10) == 0x2000
+ B->tile_x == 8
|
- ((B->tile_x << 10)) == 0x2000
+ B->tile_x == 8
|
- (B->tile_x << 10) != 0x2000
+ B->tile_x != 8
|
- ((B->tile_x << 10)) != 0x2000
+ B->tile_x != 8
|
- (B->tile_x << 10) == 0x2400
+ B->tile_x == 9
|
- ((B->tile_x << 10)) == 0x2400
+ B->tile_x == 9
|
- (B->tile_x << 10) != 0x2400
+ B->tile_x != 9
|
- ((B->tile_x << 10)) != 0x2400
+ B->tile_x != 9
|
- (B->tile_x << 10) == 0x2800
+ B->tile_x == 10
|
- ((B->tile_x << 10)) == 0x2800
+ B->tile_x == 10
|
- (B->tile_x << 10) != 0x2800
+ B->tile_x != 10
|
- ((B->tile_x << 10)) != 0x2800
+ B->tile_x != 10
|
- (B->tile_x << 10) == 0x2c00
+ B->tile_x == 11
|
- ((B->tile_x << 10)) == 0x2c00
+ B->tile_x == 11
|
- (B->tile_x << 10) != 0x2c00
+ B->tile_x != 11
|
- ((B->tile_x << 10)) != 0x2c00
+ B->tile_x != 11
|
- (B->tile_x << 10) == 0x3000
+ B->tile_x == 12
|
- ((B->tile_x << 10)) == 0x3000
+ B->tile_x == 12
|
- (B->tile_x << 10) != 0x3000
+ B->tile_x != 12
|
- ((B->tile_x << 10)) != 0x3000
+ B->tile_x != 12
|
- (B->tile_x << 10) == 0x3400
+ B->tile_x == 13
|
- ((B->tile_x << 10)) == 0x3400
+ B->tile_x == 13
|
- (B->tile_x << 10) != 0x3400
+ B->tile_x != 13
|
- ((B->tile_x << 10)) != 0x3400
+ B->tile_x != 13
|
- (B->tile_x << 10) == 0x3800
+ B->tile_x == 14
|
- ((B->tile_x << 10)) == 0x3800
+ B->tile_x == 14
|
- (B->tile_x << 10) != 0x3800
+ B->tile_x != 14
|
- ((B->tile_x << 10)) != 0x3800
+ B->tile_x != 14
|
- (B->tile_x << 10) == 0x3c00
+ B->tile_x == 15
|
- ((B->tile_x << 10)) == 0x3c00
+ B->tile_x == 15
|
- (B->tile_x << 10) != 0x3c00
+ B->tile_x != 15
|
- ((B->tile_x << 10)) != 0x3c00
+ B->tile_x != 15
)

@compare_status_word_npc_talkedto_5_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.npc_talkedto << 5) == 0x0
+ B.npc_talkedto == 0
|
- ((B.npc_talkedto << 5)) == 0x0
+ B.npc_talkedto == 0
|
- (B.npc_talkedto << 5) != 0x0
+ B.npc_talkedto != 0
|
- ((B.npc_talkedto << 5)) != 0x0
+ B.npc_talkedto != 0
|
- (B.npc_talkedto << 5) == 0x20
+ B.npc_talkedto == 1
|
- ((B.npc_talkedto << 5)) == 0x20
+ B.npc_talkedto == 1
|
- (B.npc_talkedto << 5) != 0x20
+ B.npc_talkedto != 1
|
- ((B.npc_talkedto << 5)) != 0x20
+ B.npc_talkedto != 1
)

@compare_status_word_npc_talkedto_13_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.npc_talkedto << 13) == 0x0
+ B.npc_talkedto == 0
|
- ((B.npc_talkedto << 13)) == 0x0
+ B.npc_talkedto == 0
|
- (B.npc_talkedto << 13) != 0x0
+ B.npc_talkedto != 0
|
- ((B.npc_talkedto << 13)) != 0x0
+ B.npc_talkedto != 0
|
- (B.npc_talkedto << 13) == 0x2000
+ B.npc_talkedto == 1
|
- ((B.npc_talkedto << 13)) == 0x2000
+ B.npc_talkedto == 1
|
- (B.npc_talkedto << 13) != 0x2000
+ B.npc_talkedto != 1
|
- ((B.npc_talkedto << 13)) != 0x2000
+ B.npc_talkedto != 1
)

@compare_status_word_npc_attitude_6_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.npc_attitude << 6) == 0x0
+ B.npc_attitude == 0
|
- ((B.npc_attitude << 6)) == 0x0
+ B.npc_attitude == 0
|
- (B.npc_attitude << 6) != 0x0
+ B.npc_attitude != 0
|
- ((B.npc_attitude << 6)) != 0x0
+ B.npc_attitude != 0
|
- (B.npc_attitude << 6) == 0x40
+ B.npc_attitude == 1
|
- ((B.npc_attitude << 6)) == 0x40
+ B.npc_attitude == 1
|
- (B.npc_attitude << 6) != 0x40
+ B.npc_attitude != 1
|
- ((B.npc_attitude << 6)) != 0x40
+ B.npc_attitude != 1
|
- (B.npc_attitude << 6) == 0x80
+ B.npc_attitude == 2
|
- ((B.npc_attitude << 6)) == 0x80
+ B.npc_attitude == 2
|
- (B.npc_attitude << 6) != 0x80
+ B.npc_attitude != 2
|
- ((B.npc_attitude << 6)) != 0x80
+ B.npc_attitude != 2
|
- (B.npc_attitude << 6) == 0xc0
+ B.npc_attitude == 3
|
- ((B.npc_attitude << 6)) == 0xc0
+ B.npc_attitude == 3
|
- (B.npc_attitude << 6) != 0xc0
+ B.npc_attitude != 3
|
- ((B.npc_attitude << 6)) != 0xc0
+ B.npc_attitude != 3
)

@compare_status_word_npc_attitude_14_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.npc_attitude << 14) == 0x0
+ B.npc_attitude == 0
|
- ((B.npc_attitude << 14)) == 0x0
+ B.npc_attitude == 0
|
- (B.npc_attitude << 14) != 0x0
+ B.npc_attitude != 0
|
- ((B.npc_attitude << 14)) != 0x0
+ B.npc_attitude != 0
|
- (B.npc_attitude << 14) == 0x4000
+ B.npc_attitude == 1
|
- ((B.npc_attitude << 14)) == 0x4000
+ B.npc_attitude == 1
|
- (B.npc_attitude << 14) != 0x4000
+ B.npc_attitude != 1
|
- ((B.npc_attitude << 14)) != 0x4000
+ B.npc_attitude != 1
|
- (B.npc_attitude << 14) == 0x8000
+ B.npc_attitude == 2
|
- ((B.npc_attitude << 14)) == 0x8000
+ B.npc_attitude == 2
|
- (B.npc_attitude << 14) != 0x8000
+ B.npc_attitude != 2
|
- ((B.npc_attitude << 14)) != 0x8000
+ B.npc_attitude != 2
|
- (B.npc_attitude << 14) == 0xc000
+ B.npc_attitude == 3
|
- ((B.npc_attitude << 14)) == 0xc000
+ B.npc_attitude == 3
|
- (B.npc_attitude << 14) != 0xc000
+ B.npc_attitude != 3
|
- ((B.npc_attitude << 14)) != 0xc000
+ B.npc_attitude != 3
)

@compare_tile_position_tile_y_4_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.tile_y << 4) == 0x0
+ B.tile_y == 0
|
- ((B.tile_y << 4)) == 0x0
+ B.tile_y == 0
|
- (B.tile_y << 4) != 0x0
+ B.tile_y != 0
|
- ((B.tile_y << 4)) != 0x0
+ B.tile_y != 0
|
- (B.tile_y << 4) == 0x10
+ B.tile_y == 1
|
- ((B.tile_y << 4)) == 0x10
+ B.tile_y == 1
|
- (B.tile_y << 4) != 0x10
+ B.tile_y != 1
|
- ((B.tile_y << 4)) != 0x10
+ B.tile_y != 1
|
- (B.tile_y << 4) == 0x20
+ B.tile_y == 2
|
- ((B.tile_y << 4)) == 0x20
+ B.tile_y == 2
|
- (B.tile_y << 4) != 0x20
+ B.tile_y != 2
|
- ((B.tile_y << 4)) != 0x20
+ B.tile_y != 2
|
- (B.tile_y << 4) == 0x30
+ B.tile_y == 3
|
- ((B.tile_y << 4)) == 0x30
+ B.tile_y == 3
|
- (B.tile_y << 4) != 0x30
+ B.tile_y != 3
|
- ((B.tile_y << 4)) != 0x30
+ B.tile_y != 3
|
- (B.tile_y << 4) == 0x40
+ B.tile_y == 4
|
- ((B.tile_y << 4)) == 0x40
+ B.tile_y == 4
|
- (B.tile_y << 4) != 0x40
+ B.tile_y != 4
|
- ((B.tile_y << 4)) != 0x40
+ B.tile_y != 4
|
- (B.tile_y << 4) == 0x50
+ B.tile_y == 5
|
- ((B.tile_y << 4)) == 0x50
+ B.tile_y == 5
|
- (B.tile_y << 4) != 0x50
+ B.tile_y != 5
|
- ((B.tile_y << 4)) != 0x50
+ B.tile_y != 5
|
- (B.tile_y << 4) == 0x60
+ B.tile_y == 6
|
- ((B.tile_y << 4)) == 0x60
+ B.tile_y == 6
|
- (B.tile_y << 4) != 0x60
+ B.tile_y != 6
|
- ((B.tile_y << 4)) != 0x60
+ B.tile_y != 6
|
- (B.tile_y << 4) == 0x70
+ B.tile_y == 7
|
- ((B.tile_y << 4)) == 0x70
+ B.tile_y == 7
|
- (B.tile_y << 4) != 0x70
+ B.tile_y != 7
|
- ((B.tile_y << 4)) != 0x70
+ B.tile_y != 7
|
- (B.tile_y << 4) == 0x80
+ B.tile_y == 8
|
- ((B.tile_y << 4)) == 0x80
+ B.tile_y == 8
|
- (B.tile_y << 4) != 0x80
+ B.tile_y != 8
|
- ((B.tile_y << 4)) != 0x80
+ B.tile_y != 8
|
- (B.tile_y << 4) == 0x90
+ B.tile_y == 9
|
- ((B.tile_y << 4)) == 0x90
+ B.tile_y == 9
|
- (B.tile_y << 4) != 0x90
+ B.tile_y != 9
|
- ((B.tile_y << 4)) != 0x90
+ B.tile_y != 9
|
- (B.tile_y << 4) == 0xa0
+ B.tile_y == 10
|
- ((B.tile_y << 4)) == 0xa0
+ B.tile_y == 10
|
- (B.tile_y << 4) != 0xa0
+ B.tile_y != 10
|
- ((B.tile_y << 4)) != 0xa0
+ B.tile_y != 10
|
- (B.tile_y << 4) == 0xb0
+ B.tile_y == 11
|
- ((B.tile_y << 4)) == 0xb0
+ B.tile_y == 11
|
- (B.tile_y << 4) != 0xb0
+ B.tile_y != 11
|
- ((B.tile_y << 4)) != 0xb0
+ B.tile_y != 11
|
- (B.tile_y << 4) == 0xc0
+ B.tile_y == 12
|
- ((B.tile_y << 4)) == 0xc0
+ B.tile_y == 12
|
- (B.tile_y << 4) != 0xc0
+ B.tile_y != 12
|
- ((B.tile_y << 4)) != 0xc0
+ B.tile_y != 12
|
- (B.tile_y << 4) == 0xd0
+ B.tile_y == 13
|
- ((B.tile_y << 4)) == 0xd0
+ B.tile_y == 13
|
- (B.tile_y << 4) != 0xd0
+ B.tile_y != 13
|
- ((B.tile_y << 4)) != 0xd0
+ B.tile_y != 13
|
- (B.tile_y << 4) == 0xe0
+ B.tile_y == 14
|
- ((B.tile_y << 4)) == 0xe0
+ B.tile_y == 14
|
- (B.tile_y << 4) != 0xe0
+ B.tile_y != 14
|
- ((B.tile_y << 4)) != 0xe0
+ B.tile_y != 14
|
- (B.tile_y << 4) == 0xf0
+ B.tile_y == 15
|
- ((B.tile_y << 4)) == 0xf0
+ B.tile_y == 15
|
- (B.tile_y << 4) != 0xf0
+ B.tile_y != 15
|
- ((B.tile_y << 4)) != 0xf0
+ B.tile_y != 15
)

@compare_tile_position_tile_x_2_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.tile_x << 2) == 0x0
+ B.tile_x == 0
|
- ((B.tile_x << 2)) == 0x0
+ B.tile_x == 0
|
- (B.tile_x << 2) != 0x0
+ B.tile_x != 0
|
- ((B.tile_x << 2)) != 0x0
+ B.tile_x != 0
|
- (B.tile_x << 2) == 0x4
+ B.tile_x == 1
|
- ((B.tile_x << 2)) == 0x4
+ B.tile_x == 1
|
- (B.tile_x << 2) != 0x4
+ B.tile_x != 1
|
- ((B.tile_x << 2)) != 0x4
+ B.tile_x != 1
|
- (B.tile_x << 2) == 0x8
+ B.tile_x == 2
|
- ((B.tile_x << 2)) == 0x8
+ B.tile_x == 2
|
- (B.tile_x << 2) != 0x8
+ B.tile_x != 2
|
- ((B.tile_x << 2)) != 0x8
+ B.tile_x != 2
|
- (B.tile_x << 2) == 0xc
+ B.tile_x == 3
|
- ((B.tile_x << 2)) == 0xc
+ B.tile_x == 3
|
- (B.tile_x << 2) != 0xc
+ B.tile_x != 3
|
- ((B.tile_x << 2)) != 0xc
+ B.tile_x != 3
|
- (B.tile_x << 2) == 0x10
+ B.tile_x == 4
|
- ((B.tile_x << 2)) == 0x10
+ B.tile_x == 4
|
- (B.tile_x << 2) != 0x10
+ B.tile_x != 4
|
- ((B.tile_x << 2)) != 0x10
+ B.tile_x != 4
|
- (B.tile_x << 2) == 0x14
+ B.tile_x == 5
|
- ((B.tile_x << 2)) == 0x14
+ B.tile_x == 5
|
- (B.tile_x << 2) != 0x14
+ B.tile_x != 5
|
- ((B.tile_x << 2)) != 0x14
+ B.tile_x != 5
|
- (B.tile_x << 2) == 0x18
+ B.tile_x == 6
|
- ((B.tile_x << 2)) == 0x18
+ B.tile_x == 6
|
- (B.tile_x << 2) != 0x18
+ B.tile_x != 6
|
- ((B.tile_x << 2)) != 0x18
+ B.tile_x != 6
|
- (B.tile_x << 2) == 0x1c
+ B.tile_x == 7
|
- ((B.tile_x << 2)) == 0x1c
+ B.tile_x == 7
|
- (B.tile_x << 2) != 0x1c
+ B.tile_x != 7
|
- ((B.tile_x << 2)) != 0x1c
+ B.tile_x != 7
|
- (B.tile_x << 2) == 0x20
+ B.tile_x == 8
|
- ((B.tile_x << 2)) == 0x20
+ B.tile_x == 8
|
- (B.tile_x << 2) != 0x20
+ B.tile_x != 8
|
- ((B.tile_x << 2)) != 0x20
+ B.tile_x != 8
|
- (B.tile_x << 2) == 0x24
+ B.tile_x == 9
|
- ((B.tile_x << 2)) == 0x24
+ B.tile_x == 9
|
- (B.tile_x << 2) != 0x24
+ B.tile_x != 9
|
- ((B.tile_x << 2)) != 0x24
+ B.tile_x != 9
|
- (B.tile_x << 2) == 0x28
+ B.tile_x == 10
|
- ((B.tile_x << 2)) == 0x28
+ B.tile_x == 10
|
- (B.tile_x << 2) != 0x28
+ B.tile_x != 10
|
- ((B.tile_x << 2)) != 0x28
+ B.tile_x != 10
|
- (B.tile_x << 2) == 0x2c
+ B.tile_x == 11
|
- ((B.tile_x << 2)) == 0x2c
+ B.tile_x == 11
|
- (B.tile_x << 2) != 0x2c
+ B.tile_x != 11
|
- ((B.tile_x << 2)) != 0x2c
+ B.tile_x != 11
|
- (B.tile_x << 2) == 0x30
+ B.tile_x == 12
|
- ((B.tile_x << 2)) == 0x30
+ B.tile_x == 12
|
- (B.tile_x << 2) != 0x30
+ B.tile_x != 12
|
- ((B.tile_x << 2)) != 0x30
+ B.tile_x != 12
|
- (B.tile_x << 2) == 0x34
+ B.tile_x == 13
|
- ((B.tile_x << 2)) == 0x34
+ B.tile_x == 13
|
- (B.tile_x << 2) != 0x34
+ B.tile_x != 13
|
- ((B.tile_x << 2)) != 0x34
+ B.tile_x != 13
|
- (B.tile_x << 2) == 0x38
+ B.tile_x == 14
|
- ((B.tile_x << 2)) == 0x38
+ B.tile_x == 14
|
- (B.tile_x << 2) != 0x38
+ B.tile_x != 14
|
- ((B.tile_x << 2)) != 0x38
+ B.tile_x != 14
|
- (B.tile_x << 2) == 0x3c
+ B.tile_x == 15
|
- ((B.tile_x << 2)) == 0x3c
+ B.tile_x == 15
|
- (B.tile_x << 2) != 0x3c
+ B.tile_x != 15
|
- ((B.tile_x << 2)) != 0x3c
+ B.tile_x != 15
)

@compare_tile_position_tile_x_10_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.tile_x << 10) == 0x0
+ B.tile_x == 0
|
- ((B.tile_x << 10)) == 0x0
+ B.tile_x == 0
|
- (B.tile_x << 10) != 0x0
+ B.tile_x != 0
|
- ((B.tile_x << 10)) != 0x0
+ B.tile_x != 0
|
- (B.tile_x << 10) == 0x400
+ B.tile_x == 1
|
- ((B.tile_x << 10)) == 0x400
+ B.tile_x == 1
|
- (B.tile_x << 10) != 0x400
+ B.tile_x != 1
|
- ((B.tile_x << 10)) != 0x400
+ B.tile_x != 1
|
- (B.tile_x << 10) == 0x800
+ B.tile_x == 2
|
- ((B.tile_x << 10)) == 0x800
+ B.tile_x == 2
|
- (B.tile_x << 10) != 0x800
+ B.tile_x != 2
|
- ((B.tile_x << 10)) != 0x800
+ B.tile_x != 2
|
- (B.tile_x << 10) == 0xc00
+ B.tile_x == 3
|
- ((B.tile_x << 10)) == 0xc00
+ B.tile_x == 3
|
- (B.tile_x << 10) != 0xc00
+ B.tile_x != 3
|
- ((B.tile_x << 10)) != 0xc00
+ B.tile_x != 3
|
- (B.tile_x << 10) == 0x1000
+ B.tile_x == 4
|
- ((B.tile_x << 10)) == 0x1000
+ B.tile_x == 4
|
- (B.tile_x << 10) != 0x1000
+ B.tile_x != 4
|
- ((B.tile_x << 10)) != 0x1000
+ B.tile_x != 4
|
- (B.tile_x << 10) == 0x1400
+ B.tile_x == 5
|
- ((B.tile_x << 10)) == 0x1400
+ B.tile_x == 5
|
- (B.tile_x << 10) != 0x1400
+ B.tile_x != 5
|
- ((B.tile_x << 10)) != 0x1400
+ B.tile_x != 5
|
- (B.tile_x << 10) == 0x1800
+ B.tile_x == 6
|
- ((B.tile_x << 10)) == 0x1800
+ B.tile_x == 6
|
- (B.tile_x << 10) != 0x1800
+ B.tile_x != 6
|
- ((B.tile_x << 10)) != 0x1800
+ B.tile_x != 6
|
- (B.tile_x << 10) == 0x1c00
+ B.tile_x == 7
|
- ((B.tile_x << 10)) == 0x1c00
+ B.tile_x == 7
|
- (B.tile_x << 10) != 0x1c00
+ B.tile_x != 7
|
- ((B.tile_x << 10)) != 0x1c00
+ B.tile_x != 7
|
- (B.tile_x << 10) == 0x2000
+ B.tile_x == 8
|
- ((B.tile_x << 10)) == 0x2000
+ B.tile_x == 8
|
- (B.tile_x << 10) != 0x2000
+ B.tile_x != 8
|
- ((B.tile_x << 10)) != 0x2000
+ B.tile_x != 8
|
- (B.tile_x << 10) == 0x2400
+ B.tile_x == 9
|
- ((B.tile_x << 10)) == 0x2400
+ B.tile_x == 9
|
- (B.tile_x << 10) != 0x2400
+ B.tile_x != 9
|
- ((B.tile_x << 10)) != 0x2400
+ B.tile_x != 9
|
- (B.tile_x << 10) == 0x2800
+ B.tile_x == 10
|
- ((B.tile_x << 10)) == 0x2800
+ B.tile_x == 10
|
- (B.tile_x << 10) != 0x2800
+ B.tile_x != 10
|
- ((B.tile_x << 10)) != 0x2800
+ B.tile_x != 10
|
- (B.tile_x << 10) == 0x2c00
+ B.tile_x == 11
|
- ((B.tile_x << 10)) == 0x2c00
+ B.tile_x == 11
|
- (B.tile_x << 10) != 0x2c00
+ B.tile_x != 11
|
- ((B.tile_x << 10)) != 0x2c00
+ B.tile_x != 11
|
- (B.tile_x << 10) == 0x3000
+ B.tile_x == 12
|
- ((B.tile_x << 10)) == 0x3000
+ B.tile_x == 12
|
- (B.tile_x << 10) != 0x3000
+ B.tile_x != 12
|
- ((B.tile_x << 10)) != 0x3000
+ B.tile_x != 12
|
- (B.tile_x << 10) == 0x3400
+ B.tile_x == 13
|
- ((B.tile_x << 10)) == 0x3400
+ B.tile_x == 13
|
- (B.tile_x << 10) != 0x3400
+ B.tile_x != 13
|
- ((B.tile_x << 10)) != 0x3400
+ B.tile_x != 13
|
- (B.tile_x << 10) == 0x3800
+ B.tile_x == 14
|
- ((B.tile_x << 10)) == 0x3800
+ B.tile_x == 14
|
- (B.tile_x << 10) != 0x3800
+ B.tile_x != 14
|
- ((B.tile_x << 10)) != 0x3800
+ B.tile_x != 14
|
- (B.tile_x << 10) == 0x3c00
+ B.tile_x == 15
|
- ((B.tile_x << 10)) == 0x3c00
+ B.tile_x == 15
|
- (B.tile_x << 10) != 0x3c00
+ B.tile_x != 15
|
- ((B.tile_x << 10)) != 0x3c00
+ B.tile_x != 15
)
