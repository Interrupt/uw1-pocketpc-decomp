@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x16) = (char)V;
- *(char *)((char *)iVar2 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x16) = (char)V;
- *(byte *)((char *)iVar2 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x16) = (byte)V;
- *(char *)((char *)iVar2 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x16) = (byte)V;
- *(byte *)((char *)iVar2 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)iVar2)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position
|
- *(ushort *)((byte *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position
|
- ((ushort *)iVar2)[0xb]
+ ((uw_mobile_object_t *)iVar2)->tile_position
|
- *(ushort *)((ushort *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->tile_position
|
- *(ushort *)(iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position
|
- *(undefined2 *)((byte *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position
|
- ((undefined2 *)iVar2)[0xb]
+ ((uw_mobile_object_t *)iVar2)->tile_position
|
- *(undefined2 *)((undefined2 *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->tile_position
|
- *(undefined2 *)(iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_signed
|
- *(short *)((byte *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_signed
|
- ((short *)iVar2)[0xb]
+ ((uw_mobile_object_t *)iVar2)->tile_position_signed
|
- *(short *)((short *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->tile_position_signed
|
- *(short *)(iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(byte *)((byte *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- ((byte *)iVar2)[0x16]
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(byte *)((ushort *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- (byte)((ushort *)iVar2)[0xb]
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(byte *)(iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(undefined1 *)((byte *)iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- ((undefined1 *)iVar2)[0x16]
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(undefined1 *)((ushort *)iVar2 + 0xb)
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- (undefined1)((ushort *)iVar2)[0xb]
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(undefined1 *)(iVar2 + 0x16)
+ ((uw_mobile_object_t *)iVar2)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x16)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_low
|
- &*(char *)((byte *)iVar2 + 0x16)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_low
|
- &((char *)iVar2)[0x16]
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_low
|
- &*(char *)((ushort *)iVar2 + 0xb)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_low
|
- &*(char *)(iVar2 + 0x16)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x16) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_low = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x16) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_low = (byte)E;
|
- ((char *)iVar2)[0x16] = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)iVar2 + 0xb) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_low = (byte)E;
|
- *(char *)(iVar2 + 0x16) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x16)
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(char *)((byte *)iVar2 + 0x16)
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_low
|
- ((char *)iVar2)[0x16]
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(char *)((ushort *)iVar2 + 0xb)
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_low
|
- (char)((ushort *)iVar2)[0xb]
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_low
|
- *(char *)(iVar2 + 0x16)
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x17)
+ ((uw_mobile_object_t *)iVar2)->tile_position_high
|
- *(byte *)((byte *)iVar2 + 0x17)
+ ((uw_mobile_object_t *)iVar2)->tile_position_high
|
- ((byte *)iVar2)[0x17]
+ ((uw_mobile_object_t *)iVar2)->tile_position_high
|
- *(byte *)(iVar2 + 0x17)
+ ((uw_mobile_object_t *)iVar2)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x17)
+ ((uw_mobile_object_t *)iVar2)->tile_position_high
|
- *(undefined1 *)((byte *)iVar2 + 0x17)
+ ((uw_mobile_object_t *)iVar2)->tile_position_high
|
- ((undefined1 *)iVar2)[0x17]
+ ((uw_mobile_object_t *)iVar2)->tile_position_high
|
- *(undefined1 *)(iVar2 + 0x17)
+ ((uw_mobile_object_t *)iVar2)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0x17)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_high
|
- &*(char *)((byte *)iVar2 + 0x17)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_high
|
- &((char *)iVar2)[0x17]
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_high
|
- &*(char *)(iVar2 + 0x17)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x17) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_high = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x17) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_high = (byte)E;
|
- ((char *)iVar2)[0x17] = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_high = (byte)E;
|
- *(char *)(iVar2 + 0x17) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x17)
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_high
|
- *(char *)((byte *)iVar2 + 0x17)
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_high
|
- ((char *)iVar2)[0x17]
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_high
|
- *(char *)(iVar2 + 0x17)
+ (char)((uw_mobile_object_t *)iVar2)->tile_position_high
)
...>
}

