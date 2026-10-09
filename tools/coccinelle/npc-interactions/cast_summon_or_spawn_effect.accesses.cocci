@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x16) = (char)V;
- *(char *)((char *)caster + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)caster)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x16) = (char)V;
- *(byte *)((char *)caster + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)caster)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x16) = (byte)V;
- *(char *)((char *)caster + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)caster)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x16) = (byte)V;
- *(byte *)((char *)caster + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)caster)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position
|
- *(ushort *)((byte *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position
|
- ((ushort *)caster)[0xb]
+ ((uw_mobile_object_t *)caster)->tile_position
|
- *(ushort *)((ushort *)caster + 0xb)
+ ((uw_mobile_object_t *)caster)->tile_position
|
- *(ushort *)(caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position
|
- *(undefined2 *)((byte *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position
|
- ((undefined2 *)caster)[0xb]
+ ((uw_mobile_object_t *)caster)->tile_position
|
- *(undefined2 *)((undefined2 *)caster + 0xb)
+ ((uw_mobile_object_t *)caster)->tile_position
|
- *(undefined2 *)(caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_signed
|
- *(short *)((byte *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_signed
|
- ((short *)caster)[0xb]
+ ((uw_mobile_object_t *)caster)->tile_position_signed
|
- *(short *)((short *)caster + 0xb)
+ ((uw_mobile_object_t *)caster)->tile_position_signed
|
- *(short *)(caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- *(byte *)((byte *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- ((byte *)caster)[0x16]
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- *(byte *)((ushort *)caster + 0xb)
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- (byte)((ushort *)caster)[0xb]
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- *(byte *)(caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- *(undefined1 *)((byte *)caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- ((undefined1 *)caster)[0x16]
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- *(undefined1 *)((ushort *)caster + 0xb)
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- (undefined1)((ushort *)caster)[0xb]
+ ((uw_mobile_object_t *)caster)->tile_position_low
|
- *(undefined1 *)(caster + 0x16)
+ ((uw_mobile_object_t *)caster)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x16)
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_low
|
- &*(char *)((byte *)caster + 0x16)
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_low
|
- &((char *)caster)[0x16]
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_low
|
- &*(char *)((ushort *)caster + 0xb)
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_low
|
- &*(char *)(caster + 0x16)
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x16) = E;
+ ((uw_mobile_object_t *)caster)->tile_position_low = (byte)E;
|
- *(char *)((byte *)caster + 0x16) = E;
+ ((uw_mobile_object_t *)caster)->tile_position_low = (byte)E;
|
- ((char *)caster)[0x16] = E;
+ ((uw_mobile_object_t *)caster)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)caster + 0xb) = E;
+ ((uw_mobile_object_t *)caster)->tile_position_low = (byte)E;
|
- *(char *)(caster + 0x16) = E;
+ ((uw_mobile_object_t *)caster)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x16)
+ (char)((uw_mobile_object_t *)caster)->tile_position_low
|
- *(char *)((byte *)caster + 0x16)
+ (char)((uw_mobile_object_t *)caster)->tile_position_low
|
- ((char *)caster)[0x16]
+ (char)((uw_mobile_object_t *)caster)->tile_position_low
|
- *(char *)((ushort *)caster + 0xb)
+ (char)((uw_mobile_object_t *)caster)->tile_position_low
|
- (char)((ushort *)caster)[0xb]
+ (char)((uw_mobile_object_t *)caster)->tile_position_low
|
- *(char *)(caster + 0x16)
+ (char)((uw_mobile_object_t *)caster)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x17)
+ ((uw_mobile_object_t *)caster)->tile_position_high
|
- *(byte *)((byte *)caster + 0x17)
+ ((uw_mobile_object_t *)caster)->tile_position_high
|
- ((byte *)caster)[0x17]
+ ((uw_mobile_object_t *)caster)->tile_position_high
|
- *(byte *)(caster + 0x17)
+ ((uw_mobile_object_t *)caster)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x17)
+ ((uw_mobile_object_t *)caster)->tile_position_high
|
- *(undefined1 *)((byte *)caster + 0x17)
+ ((uw_mobile_object_t *)caster)->tile_position_high
|
- ((undefined1 *)caster)[0x17]
+ ((uw_mobile_object_t *)caster)->tile_position_high
|
- *(undefined1 *)(caster + 0x17)
+ ((uw_mobile_object_t *)caster)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x17)
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_high
|
- &*(char *)((byte *)caster + 0x17)
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_high
|
- &((char *)caster)[0x17]
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_high
|
- &*(char *)(caster + 0x17)
+ (char *)&((uw_mobile_object_t *)caster)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x17) = E;
+ ((uw_mobile_object_t *)caster)->tile_position_high = (byte)E;
|
- *(char *)((byte *)caster + 0x17) = E;
+ ((uw_mobile_object_t *)caster)->tile_position_high = (byte)E;
|
- ((char *)caster)[0x17] = E;
+ ((uw_mobile_object_t *)caster)->tile_position_high = (byte)E;
|
- *(char *)(caster + 0x17) = E;
+ ((uw_mobile_object_t *)caster)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x17)
+ (char)((uw_mobile_object_t *)caster)->tile_position_high
|
- *(char *)((byte *)caster + 0x17)
+ (char)((uw_mobile_object_t *)caster)->tile_position_high
|
- ((char *)caster)[0x17]
+ (char)((uw_mobile_object_t *)caster)->tile_position_high
|
- *(char *)(caster + 0x17)
+ (char)((uw_mobile_object_t *)caster)->tile_position_high
)
...>
}


@site_0_field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)caster)->item_id
|
- ((ushort *)caster)[0] & 0x1ff
+ ((uw_object_hdr_t *)caster)->item_id
|
- *(ushort *)caster & 0x1ff
+ ((uw_object_hdr_t *)caster)->item_id
|
- *(ushort *)(caster + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)caster)->item_id
)
...>
}

@site_0_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)((char *)caster + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (((ushort *)caster)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (((ushort *)caster)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)caster >> 9) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)caster & 0xe00) >> 9
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)(caster + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(ushort *)(caster + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(byte *)((char *)caster + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(byte *)((char *)caster + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(byte *)(caster + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)caster)->flags_res
|
- (*(byte *)(caster + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)caster)->flags_res
)
...>
}

@site_0_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)((char *)caster + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (((ushort *)caster)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (((ushort *)caster)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)caster >> 12) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)caster & 0x1000) >> 12
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)(caster + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(ushort *)(caster + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(byte *)((char *)caster + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(byte *)((char *)caster + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(byte *)(caster + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)caster)->enchanted
|
- (*(byte *)(caster + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)caster)->enchanted
)
...>
}

@site_0_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)((char *)caster + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)caster)->doordir
|
- (((ushort *)caster)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (((ushort *)caster)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)caster >> 13) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)caster & 0x2000) >> 13
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)(caster + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(ushort *)(caster + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(byte *)((char *)caster + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(byte *)((char *)caster + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(byte *)(caster + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)caster)->doordir
|
- (*(byte *)(caster + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)caster)->doordir
)
...>
}

@site_0_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)((char *)caster + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)caster)->invisible
|
- (((ushort *)caster)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (((ushort *)caster)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)caster >> 14) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)caster & 0x4000) >> 14
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)(caster + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(ushort *)(caster + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(byte *)((char *)caster + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(byte *)((char *)caster + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(byte *)(caster + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)caster)->invisible
|
- (*(byte *)(caster + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)caster)->invisible
)
...>
}

@site_0_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)((char *)caster + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (((ushort *)caster)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (((ushort *)caster)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)caster >> 15) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)caster & 0x8000) >> 15
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)(caster + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(ushort *)(caster + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(byte *)((char *)caster + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(byte *)((char *)caster + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)caster)->is_quant
|
- *(byte *)((char *)caster + 0x1) >> 7
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(byte *)(caster + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)caster)->is_quant
|
- (*(byte *)(caster + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)caster)->is_quant
|
- *(byte *)(caster + 0x1) >> 7
+ ((uw_object_hdr_t *)caster)->is_quant
)
...>
}

@site_0_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
|
- ((ushort *)caster)[1] & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
|
- *(ushort *)(caster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
|
- *(byte *)((char *)caster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
|
- *(byte *)(caster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)caster)->zpos
)
...>
}

@site_0_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)caster)->heading
|
- (*(ushort *)((char *)caster + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)caster)->heading
|
- (((ushort *)caster)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)caster)->heading
|
- (((ushort *)caster)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)caster)->heading
|
- (*(ushort *)(caster + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)caster)->heading
|
- (*(ushort *)(caster + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)caster)->heading
)
...>
}

@site_0_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(ushort *)((char *)caster + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)caster)->ypos
|
- (((ushort *)caster)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (((ushort *)caster)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(ushort *)(caster + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(ushort *)(caster + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(byte *)((char *)caster + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(byte *)((char *)caster + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(byte *)(caster + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)caster)->ypos
|
- (*(byte *)(caster + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)caster)->ypos
)
...>
}

@site_0_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(ushort *)((char *)caster + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)caster)->xpos
|
- (((ushort *)caster)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (((ushort *)caster)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(ushort *)(caster + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(ushort *)(caster + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(byte *)((char *)caster + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(byte *)((char *)caster + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)caster)->xpos
|
- *(byte *)((char *)caster + 0x3) >> 5
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(byte *)(caster + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)caster)->xpos
|
- (*(byte *)(caster + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)caster)->xpos
|
- *(byte *)(caster + 0x3) >> 5
+ ((uw_object_hdr_t *)caster)->xpos
)
...>
}

@site_0_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
|
- ((ushort *)caster)[2] & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
|
- *(ushort *)(caster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
|
- *(byte *)((char *)caster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
|
- *(byte *)(caster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)caster)->quality
)
...>
}

@site_0_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->next
|
- (*(ushort *)((char *)caster + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->next
|
- (((ushort *)caster)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->next
|
- (((ushort *)caster)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->next
|
- (*(ushort *)(caster + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->next
|
- (*(ushort *)(caster + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->next
)
...>
}

@site_0_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
|
- ((ushort *)caster)[3] & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
|
- *(ushort *)(caster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
|
- *(byte *)((char *)caster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
|
- *(byte *)(caster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)caster)->owner
)
...>
}

@site_0_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)caster + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->link
|
- (*(ushort *)((char *)caster + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->link
|
- (((ushort *)caster)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->link
|
- (((ushort *)caster)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->link
|
- (*(ushort *)(caster + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)caster)->link
|
- (*(ushort *)(caster + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)caster)->link
)
...>
}

@site_0_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x0) = (char)V;
- *(char *)((char *)caster + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)caster)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x0) = (char)V;
- *(byte *)((char *)caster + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)caster)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x0) = (byte)V;
- *(char *)((char *)caster + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)caster)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x0) = (byte)V;
- *(byte *)((char *)caster + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)caster)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags
|
- *(ushort *)((byte *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags
|
- ((ushort *)caster)[0x0]
+ ((uw_object_hdr_t *)caster)->type_flags
|
- *(ushort *)((ushort *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags
|
- *(ushort *)(caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags
)
...>
}


@site_0_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags
|
- *(undefined2 *)((byte *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags
|
- ((undefined2 *)caster)[0x0]
+ ((uw_object_hdr_t *)caster)->type_flags
|
- *(undefined2 *)((undefined2 *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags
|
- *(undefined2 *)(caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags
)
...>
}


@site_0_header_w_0_0_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_signed
|
- *(short *)((byte *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_signed
|
- ((short *)caster)[0x0]
+ ((uw_object_hdr_t *)caster)->type_flags_signed
|
- *(short *)((short *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_signed
|
- *(short *)(caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_signed
)
...>
}


@site_0_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- *(byte *)((byte *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- ((byte *)caster)[0x0]
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- *(byte *)((ushort *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- (byte)((ushort *)caster)[0x0]
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- *(byte *)caster
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- *(byte *)(caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- *(undefined1 *)((byte *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- ((undefined1 *)caster)[0x0]
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- *(undefined1 *)((ushort *)caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- (undefined1)((ushort *)caster)[0x0]
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- *(undefined1 *)caster
+ ((uw_object_hdr_t *)caster)->type_flags_low
|
- *(undefined1 *)(caster + 0x0)
+ ((uw_object_hdr_t *)caster)->type_flags_low
)
...>
}


@site_0_header_w_0_0_address_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x0)
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_low
|
- &*(char *)((byte *)caster + 0x0)
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_low
|
- &((char *)caster)[0x0]
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_low
|
- &*(char *)((ushort *)caster + 0x0)
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_low
|
- &*(char *)caster
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_low
|
- &*(char *)(caster + 0x0)
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_low
)
...>
}


@site_0_header_w_0_0_store_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x0) = E;
+ ((uw_object_hdr_t *)caster)->type_flags_low = (byte)E;
|
- *(char *)((byte *)caster + 0x0) = E;
+ ((uw_object_hdr_t *)caster)->type_flags_low = (byte)E;
|
- ((char *)caster)[0x0] = E;
+ ((uw_object_hdr_t *)caster)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)caster + 0x0) = E;
+ ((uw_object_hdr_t *)caster)->type_flags_low = (byte)E;
|
- *(char *)caster = E;
+ ((uw_object_hdr_t *)caster)->type_flags_low = (byte)E;
|
- *(char *)(caster + 0x0) = E;
+ ((uw_object_hdr_t *)caster)->type_flags_low = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x0)
+ (char)((uw_object_hdr_t *)caster)->type_flags_low
|
- *(char *)((byte *)caster + 0x0)
+ (char)((uw_object_hdr_t *)caster)->type_flags_low
|
- ((char *)caster)[0x0]
+ (char)((uw_object_hdr_t *)caster)->type_flags_low
|
- *(char *)((ushort *)caster + 0x0)
+ (char)((uw_object_hdr_t *)caster)->type_flags_low
|
- (char)((ushort *)caster)[0x0]
+ (char)((uw_object_hdr_t *)caster)->type_flags_low
|
- *(char *)caster
+ (char)((uw_object_hdr_t *)caster)->type_flags_low
|
- *(char *)(caster + 0x0)
+ (char)((uw_object_hdr_t *)caster)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->type_flags_high
|
- *(byte *)((byte *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->type_flags_high
|
- ((byte *)caster)[0x1]
+ ((uw_object_hdr_t *)caster)->type_flags_high
|
- *(byte *)(caster + 0x1)
+ ((uw_object_hdr_t *)caster)->type_flags_high
)
...>
}


@site_0_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->type_flags_high
|
- *(undefined1 *)((byte *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->type_flags_high
|
- ((undefined1 *)caster)[0x1]
+ ((uw_object_hdr_t *)caster)->type_flags_high
|
- *(undefined1 *)(caster + 0x1)
+ ((uw_object_hdr_t *)caster)->type_flags_high
)
...>
}


@site_0_header_w_0_0_address_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x1)
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_high
|
- &*(char *)((byte *)caster + 0x1)
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_high
|
- &((char *)caster)[0x1]
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_high
|
- &*(char *)(caster + 0x1)
+ (char *)&((uw_object_hdr_t *)caster)->type_flags_high
)
...>
}


@site_0_header_w_0_0_store_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x1) = E;
+ ((uw_object_hdr_t *)caster)->type_flags_high = (byte)E;
|
- *(char *)((byte *)caster + 0x1) = E;
+ ((uw_object_hdr_t *)caster)->type_flags_high = (byte)E;
|
- ((char *)caster)[0x1] = E;
+ ((uw_object_hdr_t *)caster)->type_flags_high = (byte)E;
|
- *(char *)(caster + 0x1) = E;
+ ((uw_object_hdr_t *)caster)->type_flags_high = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x1)
+ (char)((uw_object_hdr_t *)caster)->type_flags_high
|
- *(char *)((byte *)caster + 0x1)
+ (char)((uw_object_hdr_t *)caster)->type_flags_high
|
- ((char *)caster)[0x1]
+ (char)((uw_object_hdr_t *)caster)->type_flags_high
|
- *(char *)(caster + 0x1)
+ (char)((uw_object_hdr_t *)caster)->type_flags_high
)
...>
}


@site_0_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x2) = (char)V;
- *(char *)((char *)caster + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)caster)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x2) = (char)V;
- *(byte *)((char *)caster + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)caster)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x2) = (byte)V;
- *(char *)((char *)caster + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)caster)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x2) = (byte)V;
- *(byte *)((char *)caster + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)caster)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word
|
- *(ushort *)((byte *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word
|
- ((ushort *)caster)[0x1]
+ ((uw_object_hdr_t *)caster)->position_word
|
- *(ushort *)((ushort *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->position_word
|
- *(ushort *)(caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word
)
...>
}


@site_0_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word
|
- *(undefined2 *)((byte *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word
|
- ((undefined2 *)caster)[0x1]
+ ((uw_object_hdr_t *)caster)->position_word
|
- *(undefined2 *)((undefined2 *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->position_word
|
- *(undefined2 *)(caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word
)
...>
}


@site_0_header_w_2_17_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_signed
|
- *(short *)((byte *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_signed
|
- ((short *)caster)[0x1]
+ ((uw_object_hdr_t *)caster)->position_word_signed
|
- *(short *)((short *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->position_word_signed
|
- *(short *)(caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_signed
)
...>
}


@site_0_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- *(byte *)((byte *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- ((byte *)caster)[0x2]
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- *(byte *)((ushort *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- (byte)((ushort *)caster)[0x1]
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- *(byte *)(caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- *(undefined1 *)((byte *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- ((undefined1 *)caster)[0x2]
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- *(undefined1 *)((ushort *)caster + 0x1)
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- (undefined1)((ushort *)caster)[0x1]
+ ((uw_object_hdr_t *)caster)->position_word_low
|
- *(undefined1 *)(caster + 0x2)
+ ((uw_object_hdr_t *)caster)->position_word_low
)
...>
}


@site_0_header_w_2_17_address_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x2)
+ (char *)&((uw_object_hdr_t *)caster)->position_word_low
|
- &*(char *)((byte *)caster + 0x2)
+ (char *)&((uw_object_hdr_t *)caster)->position_word_low
|
- &((char *)caster)[0x2]
+ (char *)&((uw_object_hdr_t *)caster)->position_word_low
|
- &*(char *)((ushort *)caster + 0x1)
+ (char *)&((uw_object_hdr_t *)caster)->position_word_low
|
- &*(char *)(caster + 0x2)
+ (char *)&((uw_object_hdr_t *)caster)->position_word_low
)
...>
}


@site_0_header_w_2_17_store_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x2) = E;
+ ((uw_object_hdr_t *)caster)->position_word_low = (byte)E;
|
- *(char *)((byte *)caster + 0x2) = E;
+ ((uw_object_hdr_t *)caster)->position_word_low = (byte)E;
|
- ((char *)caster)[0x2] = E;
+ ((uw_object_hdr_t *)caster)->position_word_low = (byte)E;
|
- *(char *)((ushort *)caster + 0x1) = E;
+ ((uw_object_hdr_t *)caster)->position_word_low = (byte)E;
|
- *(char *)(caster + 0x2) = E;
+ ((uw_object_hdr_t *)caster)->position_word_low = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x2)
+ (char)((uw_object_hdr_t *)caster)->position_word_low
|
- *(char *)((byte *)caster + 0x2)
+ (char)((uw_object_hdr_t *)caster)->position_word_low
|
- ((char *)caster)[0x2]
+ (char)((uw_object_hdr_t *)caster)->position_word_low
|
- *(char *)((ushort *)caster + 0x1)
+ (char)((uw_object_hdr_t *)caster)->position_word_low
|
- (char)((ushort *)caster)[0x1]
+ (char)((uw_object_hdr_t *)caster)->position_word_low
|
- *(char *)(caster + 0x2)
+ (char)((uw_object_hdr_t *)caster)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->position_word_high
|
- *(byte *)((byte *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->position_word_high
|
- ((byte *)caster)[0x3]
+ ((uw_object_hdr_t *)caster)->position_word_high
|
- *(byte *)(caster + 0x3)
+ ((uw_object_hdr_t *)caster)->position_word_high
)
...>
}


@site_0_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->position_word_high
|
- *(undefined1 *)((byte *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->position_word_high
|
- ((undefined1 *)caster)[0x3]
+ ((uw_object_hdr_t *)caster)->position_word_high
|
- *(undefined1 *)(caster + 0x3)
+ ((uw_object_hdr_t *)caster)->position_word_high
)
...>
}


@site_0_header_w_2_17_address_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x3)
+ (char *)&((uw_object_hdr_t *)caster)->position_word_high
|
- &*(char *)((byte *)caster + 0x3)
+ (char *)&((uw_object_hdr_t *)caster)->position_word_high
|
- &((char *)caster)[0x3]
+ (char *)&((uw_object_hdr_t *)caster)->position_word_high
|
- &*(char *)(caster + 0x3)
+ (char *)&((uw_object_hdr_t *)caster)->position_word_high
)
...>
}


@site_0_header_w_2_17_store_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x3) = E;
+ ((uw_object_hdr_t *)caster)->position_word_high = (byte)E;
|
- *(char *)((byte *)caster + 0x3) = E;
+ ((uw_object_hdr_t *)caster)->position_word_high = (byte)E;
|
- ((char *)caster)[0x3] = E;
+ ((uw_object_hdr_t *)caster)->position_word_high = (byte)E;
|
- *(char *)(caster + 0x3) = E;
+ ((uw_object_hdr_t *)caster)->position_word_high = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x3)
+ (char)((uw_object_hdr_t *)caster)->position_word_high
|
- *(char *)((byte *)caster + 0x3)
+ (char)((uw_object_hdr_t *)caster)->position_word_high
|
- ((char *)caster)[0x3]
+ (char)((uw_object_hdr_t *)caster)->position_word_high
|
- *(char *)(caster + 0x3)
+ (char)((uw_object_hdr_t *)caster)->position_word_high
)
...>
}


@site_0_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x4) = (char)V;
- *(char *)((char *)caster + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)caster)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x4) = (char)V;
- *(byte *)((char *)caster + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)caster)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x4) = (byte)V;
- *(char *)((char *)caster + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)caster)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x4) = (byte)V;
- *(byte *)((char *)caster + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)caster)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word
|
- *(ushort *)((byte *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word
|
- ((ushort *)caster)[0x2]
+ ((uw_object_hdr_t *)caster)->chain_word
|
- *(ushort *)((ushort *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->chain_word
|
- *(ushort *)(caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word
)
...>
}


@site_0_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word
|
- *(undefined2 *)((byte *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word
|
- ((undefined2 *)caster)[0x2]
+ ((uw_object_hdr_t *)caster)->chain_word
|
- *(undefined2 *)((undefined2 *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->chain_word
|
- *(undefined2 *)(caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word
)
...>
}


@site_0_header_w_4_34_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_signed
|
- *(short *)((byte *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_signed
|
- ((short *)caster)[0x2]
+ ((uw_object_hdr_t *)caster)->chain_word_signed
|
- *(short *)((short *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->chain_word_signed
|
- *(short *)(caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_signed
)
...>
}


@site_0_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- *(byte *)((byte *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- ((byte *)caster)[0x4]
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- *(byte *)((ushort *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- (byte)((ushort *)caster)[0x2]
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- *(byte *)(caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- *(undefined1 *)((byte *)caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- ((undefined1 *)caster)[0x4]
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- *(undefined1 *)((ushort *)caster + 0x2)
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- (undefined1)((ushort *)caster)[0x2]
+ ((uw_object_hdr_t *)caster)->chain_word_low
|
- *(undefined1 *)(caster + 0x4)
+ ((uw_object_hdr_t *)caster)->chain_word_low
)
...>
}


@site_0_header_w_4_34_address_4@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x4)
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_low
|
- &*(char *)((byte *)caster + 0x4)
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_low
|
- &((char *)caster)[0x4]
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_low
|
- &*(char *)((ushort *)caster + 0x2)
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_low
|
- &*(char *)(caster + 0x4)
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_low
)
...>
}


@site_0_header_w_4_34_store_4@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x4) = E;
+ ((uw_object_hdr_t *)caster)->chain_word_low = (byte)E;
|
- *(char *)((byte *)caster + 0x4) = E;
+ ((uw_object_hdr_t *)caster)->chain_word_low = (byte)E;
|
- ((char *)caster)[0x4] = E;
+ ((uw_object_hdr_t *)caster)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)caster + 0x2) = E;
+ ((uw_object_hdr_t *)caster)->chain_word_low = (byte)E;
|
- *(char *)(caster + 0x4) = E;
+ ((uw_object_hdr_t *)caster)->chain_word_low = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x4)
+ (char)((uw_object_hdr_t *)caster)->chain_word_low
|
- *(char *)((byte *)caster + 0x4)
+ (char)((uw_object_hdr_t *)caster)->chain_word_low
|
- ((char *)caster)[0x4]
+ (char)((uw_object_hdr_t *)caster)->chain_word_low
|
- *(char *)((ushort *)caster + 0x2)
+ (char)((uw_object_hdr_t *)caster)->chain_word_low
|
- (char)((ushort *)caster)[0x2]
+ (char)((uw_object_hdr_t *)caster)->chain_word_low
|
- *(char *)(caster + 0x4)
+ (char)((uw_object_hdr_t *)caster)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x5)
+ ((uw_object_hdr_t *)caster)->chain_word_high
|
- *(byte *)((byte *)caster + 0x5)
+ ((uw_object_hdr_t *)caster)->chain_word_high
|
- ((byte *)caster)[0x5]
+ ((uw_object_hdr_t *)caster)->chain_word_high
|
- *(byte *)(caster + 0x5)
+ ((uw_object_hdr_t *)caster)->chain_word_high
)
...>
}


@site_0_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x5)
+ ((uw_object_hdr_t *)caster)->chain_word_high
|
- *(undefined1 *)((byte *)caster + 0x5)
+ ((uw_object_hdr_t *)caster)->chain_word_high
|
- ((undefined1 *)caster)[0x5]
+ ((uw_object_hdr_t *)caster)->chain_word_high
|
- *(undefined1 *)(caster + 0x5)
+ ((uw_object_hdr_t *)caster)->chain_word_high
)
...>
}


@site_0_header_w_4_34_address_5@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x5)
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_high
|
- &*(char *)((byte *)caster + 0x5)
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_high
|
- &((char *)caster)[0x5]
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_high
|
- &*(char *)(caster + 0x5)
+ (char *)&((uw_object_hdr_t *)caster)->chain_word_high
)
...>
}


@site_0_header_w_4_34_store_5@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x5) = E;
+ ((uw_object_hdr_t *)caster)->chain_word_high = (byte)E;
|
- *(char *)((byte *)caster + 0x5) = E;
+ ((uw_object_hdr_t *)caster)->chain_word_high = (byte)E;
|
- ((char *)caster)[0x5] = E;
+ ((uw_object_hdr_t *)caster)->chain_word_high = (byte)E;
|
- *(char *)(caster + 0x5) = E;
+ ((uw_object_hdr_t *)caster)->chain_word_high = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x5)
+ (char)((uw_object_hdr_t *)caster)->chain_word_high
|
- *(char *)((byte *)caster + 0x5)
+ (char)((uw_object_hdr_t *)caster)->chain_word_high
|
- ((char *)caster)[0x5]
+ (char)((uw_object_hdr_t *)caster)->chain_word_high
|
- *(char *)(caster + 0x5)
+ (char)((uw_object_hdr_t *)caster)->chain_word_high
)
...>
}


@site_0_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x6) = (char)V;
- *(char *)((char *)caster + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)caster)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)caster + 0x6) = (char)V;
- *(byte *)((char *)caster + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)caster)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x6) = (byte)V;
- *(char *)((char *)caster + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)caster)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)caster + 0x6) = (byte)V;
- *(byte *)((char *)caster + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)caster)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word
|
- *(ushort *)((byte *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word
|
- ((ushort *)caster)[0x3]
+ ((uw_object_hdr_t *)caster)->link_word
|
- *(ushort *)((ushort *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->link_word
|
- *(ushort *)(caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word
)
...>
}


@site_0_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word
|
- *(undefined2 *)((byte *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word
|
- ((undefined2 *)caster)[0x3]
+ ((uw_object_hdr_t *)caster)->link_word
|
- *(undefined2 *)((undefined2 *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->link_word
|
- *(undefined2 *)(caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word
)
...>
}


@site_0_header_w_6_51_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_signed
|
- *(short *)((byte *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_signed
|
- ((short *)caster)[0x3]
+ ((uw_object_hdr_t *)caster)->link_word_signed
|
- *(short *)((short *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->link_word_signed
|
- *(short *)(caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_signed
)
...>
}


@site_0_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- *(byte *)((byte *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- ((byte *)caster)[0x6]
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- *(byte *)((ushort *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- (byte)((ushort *)caster)[0x3]
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- *(byte *)(caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- *(undefined1 *)((byte *)caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- ((undefined1 *)caster)[0x6]
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- *(undefined1 *)((ushort *)caster + 0x3)
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- (undefined1)((ushort *)caster)[0x3]
+ ((uw_object_hdr_t *)caster)->link_word_low
|
- *(undefined1 *)(caster + 0x6)
+ ((uw_object_hdr_t *)caster)->link_word_low
)
...>
}


@site_0_header_w_6_51_address_6@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x6)
+ (char *)&((uw_object_hdr_t *)caster)->link_word_low
|
- &*(char *)((byte *)caster + 0x6)
+ (char *)&((uw_object_hdr_t *)caster)->link_word_low
|
- &((char *)caster)[0x6]
+ (char *)&((uw_object_hdr_t *)caster)->link_word_low
|
- &*(char *)((ushort *)caster + 0x3)
+ (char *)&((uw_object_hdr_t *)caster)->link_word_low
|
- &*(char *)(caster + 0x6)
+ (char *)&((uw_object_hdr_t *)caster)->link_word_low
)
...>
}


@site_0_header_w_6_51_store_6@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x6) = E;
+ ((uw_object_hdr_t *)caster)->link_word_low = (byte)E;
|
- *(char *)((byte *)caster + 0x6) = E;
+ ((uw_object_hdr_t *)caster)->link_word_low = (byte)E;
|
- ((char *)caster)[0x6] = E;
+ ((uw_object_hdr_t *)caster)->link_word_low = (byte)E;
|
- *(char *)((ushort *)caster + 0x3) = E;
+ ((uw_object_hdr_t *)caster)->link_word_low = (byte)E;
|
- *(char *)(caster + 0x6) = E;
+ ((uw_object_hdr_t *)caster)->link_word_low = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x6)
+ (char)((uw_object_hdr_t *)caster)->link_word_low
|
- *(char *)((byte *)caster + 0x6)
+ (char)((uw_object_hdr_t *)caster)->link_word_low
|
- ((char *)caster)[0x6]
+ (char)((uw_object_hdr_t *)caster)->link_word_low
|
- *(char *)((ushort *)caster + 0x3)
+ (char)((uw_object_hdr_t *)caster)->link_word_low
|
- (char)((ushort *)caster)[0x3]
+ (char)((uw_object_hdr_t *)caster)->link_word_low
|
- *(char *)(caster + 0x6)
+ (char)((uw_object_hdr_t *)caster)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x7)
+ ((uw_object_hdr_t *)caster)->link_word_high
|
- *(byte *)((byte *)caster + 0x7)
+ ((uw_object_hdr_t *)caster)->link_word_high
|
- ((byte *)caster)[0x7]
+ ((uw_object_hdr_t *)caster)->link_word_high
|
- *(byte *)(caster + 0x7)
+ ((uw_object_hdr_t *)caster)->link_word_high
)
...>
}


@site_0_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x7)
+ ((uw_object_hdr_t *)caster)->link_word_high
|
- *(undefined1 *)((byte *)caster + 0x7)
+ ((uw_object_hdr_t *)caster)->link_word_high
|
- ((undefined1 *)caster)[0x7]
+ ((uw_object_hdr_t *)caster)->link_word_high
|
- *(undefined1 *)(caster + 0x7)
+ ((uw_object_hdr_t *)caster)->link_word_high
)
...>
}


@site_0_header_w_6_51_address_7@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x7)
+ (char *)&((uw_object_hdr_t *)caster)->link_word_high
|
- &*(char *)((byte *)caster + 0x7)
+ (char *)&((uw_object_hdr_t *)caster)->link_word_high
|
- &((char *)caster)[0x7]
+ (char *)&((uw_object_hdr_t *)caster)->link_word_high
|
- &*(char *)(caster + 0x7)
+ (char *)&((uw_object_hdr_t *)caster)->link_word_high
)
...>
}


@site_0_header_w_6_51_store_7@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x7) = E;
+ ((uw_object_hdr_t *)caster)->link_word_high = (byte)E;
|
- *(char *)((byte *)caster + 0x7) = E;
+ ((uw_object_hdr_t *)caster)->link_word_high = (byte)E;
|
- ((char *)caster)[0x7] = E;
+ ((uw_object_hdr_t *)caster)->link_word_high = (byte)E;
|
- *(char *)(caster + 0x7) = E;
+ ((uw_object_hdr_t *)caster)->link_word_high = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x7)
+ (char)((uw_object_hdr_t *)caster)->link_word_high
|
- *(char *)((byte *)caster + 0x7)
+ (char)((uw_object_hdr_t *)caster)->link_word_high
|
- ((char *)caster)[0x7]
+ (char)((uw_object_hdr_t *)caster)->link_word_high
|
- *(char *)(caster + 0x7)
+ (char)((uw_object_hdr_t *)caster)->link_word_high
)
...>
}


@cast_summon_or_spawn_effect_caster_hit_points_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x8)
+ ((uw_mobile_object_t *)caster)->hit_points
|
- *(byte *)(caster + 0x8)
+ ((uw_mobile_object_t *)caster)->hit_points
)
...>
}

@cast_summon_or_spawn_effect_caster_hit_points_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x8)
+ ((uw_mobile_object_t *)caster)->hit_points
|
- *(undefined1 *)(caster + 0x8)
+ ((uw_mobile_object_t *)caster)->hit_points
)
...>
}

@cast_summon_or_spawn_effect_caster_hit_points_address@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x8)
+ (char *)&((uw_mobile_object_t *)caster)->hit_points
|
- &*(char *)(caster + 0x8)
+ (char *)&((uw_mobile_object_t *)caster)->hit_points
)
...>
}

@cast_summon_or_spawn_effect_caster_hit_points_store@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x8) = E;
+ ((uw_mobile_object_t *)caster)->hit_points = (byte)E;
|
- *(char *)(caster + 0x8) = E;
+ ((uw_mobile_object_t *)caster)->hit_points = (byte)E;
)
...>
}

@cast_summon_or_spawn_effect_caster_hit_points_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x8)
+ (char)((uw_mobile_object_t *)caster)->hit_points
|
- *(char *)(caster + 0x8)
+ (char)((uw_mobile_object_t *)caster)->hit_points
)
...>
}

@cast_summon_or_spawn_effect_caster_full_heading_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x9)
+ ((uw_mobile_object_t *)caster)->full_heading
|
- *(byte *)(caster + 0x9)
+ ((uw_mobile_object_t *)caster)->full_heading
)
...>
}

@cast_summon_or_spawn_effect_caster_full_heading_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x9)
+ ((uw_mobile_object_t *)caster)->full_heading
|
- *(undefined1 *)(caster + 0x9)
+ ((uw_mobile_object_t *)caster)->full_heading
)
...>
}

@cast_summon_or_spawn_effect_caster_full_heading_address@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x9)
+ (char *)&((uw_mobile_object_t *)caster)->full_heading
|
- &*(char *)(caster + 0x9)
+ (char *)&((uw_mobile_object_t *)caster)->full_heading
)
...>
}

@cast_summon_or_spawn_effect_caster_full_heading_store@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x9) = E;
+ ((uw_mobile_object_t *)caster)->full_heading = (byte)E;
|
- *(char *)(caster + 0x9) = E;
+ ((uw_mobile_object_t *)caster)->full_heading = (byte)E;
)
...>
}

@cast_summon_or_spawn_effect_caster_full_heading_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x9)
+ (char)((uw_mobile_object_t *)caster)->full_heading
|
- *(char *)(caster + 0x9)
+ (char)((uw_mobile_object_t *)caster)->full_heading
)
...>
}

@cast_summon_or_spawn_effect_caster_movement_flags_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0xa)
+ ((uw_mobile_object_t *)caster)->movement_flags
|
- *(byte *)(caster + 0xa)
+ ((uw_mobile_object_t *)caster)->movement_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_movement_flags_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0xa)
+ ((uw_mobile_object_t *)caster)->movement_flags
|
- *(undefined1 *)(caster + 0xa)
+ ((uw_mobile_object_t *)caster)->movement_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_movement_flags_address@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0xa)
+ (char *)&((uw_mobile_object_t *)caster)->movement_flags
|
- &*(char *)(caster + 0xa)
+ (char *)&((uw_mobile_object_t *)caster)->movement_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_movement_flags_store@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0xa) = E;
+ ((uw_mobile_object_t *)caster)->movement_flags = (byte)E;
|
- *(char *)(caster + 0xa) = E;
+ ((uw_mobile_object_t *)caster)->movement_flags = (byte)E;
)
...>
}

@cast_summon_or_spawn_effect_caster_movement_flags_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0xa)
+ (char)((uw_mobile_object_t *)caster)->movement_flags
|
- *(char *)(caster + 0xa)
+ (char)((uw_mobile_object_t *)caster)->movement_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_motion_flags_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x13)
+ ((uw_mobile_object_t *)caster)->motion_flags
|
- *(byte *)(caster + 0x13)
+ ((uw_mobile_object_t *)caster)->motion_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_motion_flags_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x13)
+ ((uw_mobile_object_t *)caster)->motion_flags
|
- *(undefined1 *)(caster + 0x13)
+ ((uw_mobile_object_t *)caster)->motion_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_motion_flags_address@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x13)
+ (char *)&((uw_mobile_object_t *)caster)->motion_flags
|
- &*(char *)(caster + 0x13)
+ (char *)&((uw_mobile_object_t *)caster)->motion_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_motion_flags_store@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x13) = E;
+ ((uw_mobile_object_t *)caster)->motion_flags = (byte)E;
|
- *(char *)(caster + 0x13) = E;
+ ((uw_mobile_object_t *)caster)->motion_flags = (byte)E;
)
...>
}

@cast_summon_or_spawn_effect_caster_motion_flags_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x13)
+ (char)((uw_mobile_object_t *)caster)->motion_flags
|
- *(char *)(caster + 0x13)
+ (char)((uw_mobile_object_t *)caster)->motion_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_attack_pitch_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x14)
+ ((uw_mobile_object_t *)caster)->attack_pitch
|
- *(byte *)(caster + 0x14)
+ ((uw_mobile_object_t *)caster)->attack_pitch
)
...>
}

@cast_summon_or_spawn_effect_caster_attack_pitch_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x14)
+ ((uw_mobile_object_t *)caster)->attack_pitch
|
- *(undefined1 *)(caster + 0x14)
+ ((uw_mobile_object_t *)caster)->attack_pitch
)
...>
}

@cast_summon_or_spawn_effect_caster_attack_pitch_address@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x14)
+ (char *)&((uw_mobile_object_t *)caster)->attack_pitch
|
- &*(char *)(caster + 0x14)
+ (char *)&((uw_mobile_object_t *)caster)->attack_pitch
)
...>
}

@cast_summon_or_spawn_effect_caster_attack_pitch_store@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x14) = E;
+ ((uw_mobile_object_t *)caster)->attack_pitch = (byte)E;
|
- *(char *)(caster + 0x14) = E;
+ ((uw_mobile_object_t *)caster)->attack_pitch = (byte)E;
)
...>
}

@cast_summon_or_spawn_effect_caster_attack_pitch_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x14)
+ (char)((uw_mobile_object_t *)caster)->attack_pitch
|
- *(char *)(caster + 0x14)
+ (char)((uw_mobile_object_t *)caster)->attack_pitch
)
...>
}

@cast_summon_or_spawn_effect_caster_animation_flags_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x15)
+ ((uw_mobile_object_t *)caster)->animation_flags
|
- *(byte *)(caster + 0x15)
+ ((uw_mobile_object_t *)caster)->animation_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_animation_flags_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x15)
+ ((uw_mobile_object_t *)caster)->animation_flags
|
- *(undefined1 *)(caster + 0x15)
+ ((uw_mobile_object_t *)caster)->animation_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_animation_flags_address@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x15)
+ (char *)&((uw_mobile_object_t *)caster)->animation_flags
|
- &*(char *)(caster + 0x15)
+ (char *)&((uw_mobile_object_t *)caster)->animation_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_animation_flags_store@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x15) = E;
+ ((uw_mobile_object_t *)caster)->animation_flags = (byte)E;
|
- *(char *)(caster + 0x15) = E;
+ ((uw_mobile_object_t *)caster)->animation_flags = (byte)E;
)
...>
}

@cast_summon_or_spawn_effect_caster_animation_flags_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x15)
+ (char)((uw_mobile_object_t *)caster)->animation_flags
|
- *(char *)(caster + 0x15)
+ (char)((uw_mobile_object_t *)caster)->animation_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_heading_flags_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)caster + 0x18)
+ ((uw_mobile_object_t *)caster)->heading_flags
|
- *(byte *)(caster + 0x18)
+ ((uw_mobile_object_t *)caster)->heading_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_heading_flags_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)caster + 0x18)
+ ((uw_mobile_object_t *)caster)->heading_flags
|
- *(undefined1 *)(caster + 0x18)
+ ((uw_mobile_object_t *)caster)->heading_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_heading_flags_address@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)caster + 0x18)
+ (char *)&((uw_mobile_object_t *)caster)->heading_flags
|
- &*(char *)(caster + 0x18)
+ (char *)&((uw_mobile_object_t *)caster)->heading_flags
)
...>
}

@cast_summon_or_spawn_effect_caster_heading_flags_store@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x18) = E;
+ ((uw_mobile_object_t *)caster)->heading_flags = (byte)E;
|
- *(char *)(caster + 0x18) = E;
+ ((uw_mobile_object_t *)caster)->heading_flags = (byte)E;
)
...>
}

@cast_summon_or_spawn_effect_caster_heading_flags_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)caster + 0x18)
+ (char)((uw_mobile_object_t *)caster)->heading_flags
|
- *(char *)(caster + 0x18)
+ (char)((uw_mobile_object_t *)caster)->heading_flags
)
...>
}

@pObj_w_13_0_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0xd) = (char)V;
- *(char *)((char *)pObj + 0xe) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->status_word = (ushort)V;

...>
}

@pObj_w_13_0_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0xd) = (char)V;
- *(byte *)((char *)pObj + 0xe) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->status_word = (ushort)V;

...>
}

@pObj_w_13_0_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0xd) = (byte)V;
- *(char *)((char *)pObj + 0xe) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->status_word = (ushort)V;

...>
}

@pObj_w_13_0_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0xd) = (byte)V;
- *(byte *)((char *)pObj + 0xe) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->status_word = (ushort)V;

...>
}

@pObj_w_13_0_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word
|
- *(ushort *)((byte *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word
|
- *(ushort *)(pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word
)
...>
}


@pObj_w_13_0_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word
|
- *(undefined2 *)((byte *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word
|
- *(undefined2 *)(pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word
)
...>
}


@pObj_w_13_0_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_signed
|
- *(short *)((byte *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_signed
|
- *(short *)(pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_signed
)
...>
}


@pObj_w_13_0_byte_13_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_low
|
- *(byte *)((byte *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_low
|
- ((byte *)pObj)[0xd]
+ ((uw_mobile_object_t *)pObj)->status_word_low
|
- *(byte *)(pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_low
)
...>
}


@pObj_w_13_0_byte_13_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_low
|
- *(undefined1 *)((byte *)pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_low
|
- ((undefined1 *)pObj)[0xd]
+ ((uw_mobile_object_t *)pObj)->status_word_low
|
- *(undefined1 *)(pObj + 0xd)
+ ((uw_mobile_object_t *)pObj)->status_word_low
)
...>
}


@pObj_w_13_0_address_13@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0xd)
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_low
|
- &*(char *)((byte *)pObj + 0xd)
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_low
|
- &((char *)pObj)[0xd]
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_low
|
- &*(char *)(pObj + 0xd)
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_low
|
- &pObj[0xd]
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_low
)
...>
}


@pObj_w_13_0_store_13@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0xd) = E;
+ ((uw_mobile_object_t *)pObj)->status_word_low = (byte)E;
|
- *(char *)((byte *)pObj + 0xd) = E;
+ ((uw_mobile_object_t *)pObj)->status_word_low = (byte)E;
|
- ((char *)pObj)[0xd] = E;
+ ((uw_mobile_object_t *)pObj)->status_word_low = (byte)E;
|
- *(char *)(pObj + 0xd) = E;
+ ((uw_mobile_object_t *)pObj)->status_word_low = (byte)E;
|
- pObj[0xd] = E;
+ ((uw_mobile_object_t *)pObj)->status_word_low = (byte)E;
)
...>
}


@pObj_w_13_0_byte_13_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0xd)
+ (char)((uw_mobile_object_t *)pObj)->status_word_low
|
- *(char *)((byte *)pObj + 0xd)
+ (char)((uw_mobile_object_t *)pObj)->status_word_low
|
- ((char *)pObj)[0xd]
+ (char)((uw_mobile_object_t *)pObj)->status_word_low
|
- *(char *)(pObj + 0xd)
+ (char)((uw_mobile_object_t *)pObj)->status_word_low
|
- pObj[0xd]
+ (char)((uw_mobile_object_t *)pObj)->status_word_low
)
...>
}


@pObj_w_13_0_byte_14_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0xe)
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- *(byte *)((byte *)pObj + 0xe)
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- ((byte *)pObj)[0xe]
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- *(byte *)((ushort *)pObj + 0x7)
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- (byte)((ushort *)pObj)[0x7]
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- *(byte *)(pObj + 0xe)
+ ((uw_mobile_object_t *)pObj)->status_word_high
)
...>
}


@pObj_w_13_0_byte_14_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0xe)
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- *(undefined1 *)((byte *)pObj + 0xe)
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- ((undefined1 *)pObj)[0xe]
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- *(undefined1 *)((ushort *)pObj + 0x7)
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- (undefined1)((ushort *)pObj)[0x7]
+ ((uw_mobile_object_t *)pObj)->status_word_high
|
- *(undefined1 *)(pObj + 0xe)
+ ((uw_mobile_object_t *)pObj)->status_word_high
)
...>
}


@pObj_w_13_0_address_14@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0xe)
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_high
|
- &*(char *)((byte *)pObj + 0xe)
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_high
|
- &((char *)pObj)[0xe]
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_high
|
- &*(char *)((ushort *)pObj + 0x7)
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_high
|
- &*(char *)(pObj + 0xe)
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_high
|
- &pObj[0xe]
+ (char *)&((uw_mobile_object_t *)pObj)->status_word_high
)
...>
}


@pObj_w_13_0_store_14@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0xe) = E;
+ ((uw_mobile_object_t *)pObj)->status_word_high = (byte)E;
|
- *(char *)((byte *)pObj + 0xe) = E;
+ ((uw_mobile_object_t *)pObj)->status_word_high = (byte)E;
|
- ((char *)pObj)[0xe] = E;
+ ((uw_mobile_object_t *)pObj)->status_word_high = (byte)E;
|
- *(char *)((ushort *)pObj + 0x7) = E;
+ ((uw_mobile_object_t *)pObj)->status_word_high = (byte)E;
|
- *(char *)(pObj + 0xe) = E;
+ ((uw_mobile_object_t *)pObj)->status_word_high = (byte)E;
|
- pObj[0xe] = E;
+ ((uw_mobile_object_t *)pObj)->status_word_high = (byte)E;
)
...>
}


@pObj_w_13_0_byte_14_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0xe)
+ (char)((uw_mobile_object_t *)pObj)->status_word_high
|
- *(char *)((byte *)pObj + 0xe)
+ (char)((uw_mobile_object_t *)pObj)->status_word_high
|
- ((char *)pObj)[0xe]
+ (char)((uw_mobile_object_t *)pObj)->status_word_high
|
- *(char *)((ushort *)pObj + 0x7)
+ (char)((uw_mobile_object_t *)pObj)->status_word_high
|
- (char)((ushort *)pObj)[0x7]
+ (char)((uw_mobile_object_t *)pObj)->status_word_high
|
- *(char *)(pObj + 0xe)
+ (char)((uw_mobile_object_t *)pObj)->status_word_high
|
- pObj[0xe]
+ (char)((uw_mobile_object_t *)pObj)->status_word_high
)
...>
}


@pObj_w_15_17_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0xf) = (char)V;
- *(char *)((char *)pObj + 0x10) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->target_word = (ushort)V;

...>
}

@pObj_w_15_17_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0xf) = (char)V;
- *(byte *)((char *)pObj + 0x10) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->target_word = (ushort)V;

...>
}

@pObj_w_15_17_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0xf) = (byte)V;
- *(char *)((char *)pObj + 0x10) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->target_word = (ushort)V;

...>
}

@pObj_w_15_17_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0xf) = (byte)V;
- *(byte *)((char *)pObj + 0x10) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->target_word = (ushort)V;

...>
}

@pObj_w_15_17_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word
|
- *(ushort *)((byte *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word
|
- *(ushort *)(pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word
)
...>
}


@pObj_w_15_17_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word
|
- *(undefined2 *)((byte *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word
|
- *(undefined2 *)(pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word
)
...>
}


@pObj_w_15_17_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_signed
|
- *(short *)((byte *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_signed
|
- *(short *)(pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_signed
)
...>
}


@pObj_w_15_17_byte_15_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_low
|
- *(byte *)((byte *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_low
|
- ((byte *)pObj)[0xf]
+ ((uw_mobile_object_t *)pObj)->target_word_low
|
- *(byte *)(pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_low
)
...>
}


@pObj_w_15_17_byte_15_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_low
|
- *(undefined1 *)((byte *)pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_low
|
- ((undefined1 *)pObj)[0xf]
+ ((uw_mobile_object_t *)pObj)->target_word_low
|
- *(undefined1 *)(pObj + 0xf)
+ ((uw_mobile_object_t *)pObj)->target_word_low
)
...>
}


@pObj_w_15_17_address_15@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0xf)
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_low
|
- &*(char *)((byte *)pObj + 0xf)
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_low
|
- &((char *)pObj)[0xf]
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_low
|
- &*(char *)(pObj + 0xf)
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_low
|
- &pObj[0xf]
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_low
)
...>
}


@pObj_w_15_17_store_15@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0xf) = E;
+ ((uw_mobile_object_t *)pObj)->target_word_low = (byte)E;
|
- *(char *)((byte *)pObj + 0xf) = E;
+ ((uw_mobile_object_t *)pObj)->target_word_low = (byte)E;
|
- ((char *)pObj)[0xf] = E;
+ ((uw_mobile_object_t *)pObj)->target_word_low = (byte)E;
|
- *(char *)(pObj + 0xf) = E;
+ ((uw_mobile_object_t *)pObj)->target_word_low = (byte)E;
|
- pObj[0xf] = E;
+ ((uw_mobile_object_t *)pObj)->target_word_low = (byte)E;
)
...>
}


@pObj_w_15_17_byte_15_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0xf)
+ (char)((uw_mobile_object_t *)pObj)->target_word_low
|
- *(char *)((byte *)pObj + 0xf)
+ (char)((uw_mobile_object_t *)pObj)->target_word_low
|
- ((char *)pObj)[0xf]
+ (char)((uw_mobile_object_t *)pObj)->target_word_low
|
- *(char *)(pObj + 0xf)
+ (char)((uw_mobile_object_t *)pObj)->target_word_low
|
- pObj[0xf]
+ (char)((uw_mobile_object_t *)pObj)->target_word_low
)
...>
}


@pObj_w_15_17_byte_16_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x10)
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- *(byte *)((byte *)pObj + 0x10)
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- ((byte *)pObj)[0x10]
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- *(byte *)((ushort *)pObj + 0x8)
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- (byte)((ushort *)pObj)[0x8]
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- *(byte *)(pObj + 0x10)
+ ((uw_mobile_object_t *)pObj)->target_word_high
)
...>
}


@pObj_w_15_17_byte_16_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x10)
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- *(undefined1 *)((byte *)pObj + 0x10)
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- ((undefined1 *)pObj)[0x10]
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- *(undefined1 *)((ushort *)pObj + 0x8)
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- (undefined1)((ushort *)pObj)[0x8]
+ ((uw_mobile_object_t *)pObj)->target_word_high
|
- *(undefined1 *)(pObj + 0x10)
+ ((uw_mobile_object_t *)pObj)->target_word_high
)
...>
}


@pObj_w_15_17_address_16@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x10)
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_high
|
- &*(char *)((byte *)pObj + 0x10)
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_high
|
- &((char *)pObj)[0x10]
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_high
|
- &*(char *)((ushort *)pObj + 0x8)
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_high
|
- &*(char *)(pObj + 0x10)
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_high
|
- &pObj[0x10]
+ (char *)&((uw_mobile_object_t *)pObj)->target_word_high
)
...>
}


@pObj_w_15_17_store_16@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x10) = E;
+ ((uw_mobile_object_t *)pObj)->target_word_high = (byte)E;
|
- *(char *)((byte *)pObj + 0x10) = E;
+ ((uw_mobile_object_t *)pObj)->target_word_high = (byte)E;
|
- ((char *)pObj)[0x10] = E;
+ ((uw_mobile_object_t *)pObj)->target_word_high = (byte)E;
|
- *(char *)((ushort *)pObj + 0x8) = E;
+ ((uw_mobile_object_t *)pObj)->target_word_high = (byte)E;
|
- *(char *)(pObj + 0x10) = E;
+ ((uw_mobile_object_t *)pObj)->target_word_high = (byte)E;
|
- pObj[0x10] = E;
+ ((uw_mobile_object_t *)pObj)->target_word_high = (byte)E;
)
...>
}


@pObj_w_15_17_byte_16_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x10)
+ (char)((uw_mobile_object_t *)pObj)->target_word_high
|
- *(char *)((byte *)pObj + 0x10)
+ (char)((uw_mobile_object_t *)pObj)->target_word_high
|
- ((char *)pObj)[0x10]
+ (char)((uw_mobile_object_t *)pObj)->target_word_high
|
- *(char *)((ushort *)pObj + 0x8)
+ (char)((uw_mobile_object_t *)pObj)->target_word_high
|
- (char)((ushort *)pObj)[0x8]
+ (char)((uw_mobile_object_t *)pObj)->target_word_high
|
- *(char *)(pObj + 0x10)
+ (char)((uw_mobile_object_t *)pObj)->target_word_high
|
- pObj[0x10]
+ (char)((uw_mobile_object_t *)pObj)->target_word_high
)
...>
}


@pObj_w_22_34_pair_char_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x16) = (char)V;
- *(char *)((char *)pObj + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->tile_position = (ushort)V;

...>
}

@pObj_w_22_34_pair_char_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x16) = (char)V;
- *(byte *)((char *)pObj + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->tile_position = (ushort)V;

...>
}

@pObj_w_22_34_pair_byte_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x16) = (byte)V;
- *(char *)((char *)pObj + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->tile_position = (ushort)V;

...>
}

@pObj_w_22_34_pair_byte_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x16) = (byte)V;
- *(byte *)((char *)pObj + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pObj)->tile_position = (ushort)V;

...>
}

@pObj_w_22_34_word_ushort@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position
|
- *(ushort *)((byte *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position
|
- ((ushort *)pObj)[0xb]
+ ((uw_mobile_object_t *)pObj)->tile_position
|
- *(ushort *)((ushort *)pObj + 0xb)
+ ((uw_mobile_object_t *)pObj)->tile_position
|
- *(ushort *)(pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position
)
...>
}


@pObj_w_22_34_word_undefined2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position
|
- *(undefined2 *)((byte *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position
|
- ((undefined2 *)pObj)[0xb]
+ ((uw_mobile_object_t *)pObj)->tile_position
|
- *(undefined2 *)((undefined2 *)pObj + 0xb)
+ ((uw_mobile_object_t *)pObj)->tile_position
|
- *(undefined2 *)(pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position
)
...>
}


@pObj_w_22_34_word_short@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_signed
|
- *(short *)((byte *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_signed
|
- ((short *)pObj)[0xb]
+ ((uw_mobile_object_t *)pObj)->tile_position_signed
|
- *(short *)((short *)pObj + 0xb)
+ ((uw_mobile_object_t *)pObj)->tile_position_signed
|
- *(short *)(pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_signed
)
...>
}


@pObj_w_22_34_byte_22_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(byte *)((byte *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- ((byte *)pObj)[0x16]
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(byte *)((ushort *)pObj + 0xb)
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- (byte)((ushort *)pObj)[0xb]
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(byte *)(pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_low
)
...>
}


@pObj_w_22_34_byte_22_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(undefined1 *)((byte *)pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- ((undefined1 *)pObj)[0x16]
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(undefined1 *)((ushort *)pObj + 0xb)
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- (undefined1)((ushort *)pObj)[0xb]
+ ((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(undefined1 *)(pObj + 0x16)
+ ((uw_mobile_object_t *)pObj)->tile_position_low
)
...>
}


@pObj_w_22_34_address_22@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x16)
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_low
|
- &*(char *)((byte *)pObj + 0x16)
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_low
|
- &((char *)pObj)[0x16]
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_low
|
- &*(char *)((ushort *)pObj + 0xb)
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_low
|
- &*(char *)(pObj + 0x16)
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_low
|
- &pObj[0x16]
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_low
)
...>
}


@pObj_w_22_34_store_22@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x16) = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_low = (byte)E;
|
- *(char *)((byte *)pObj + 0x16) = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_low = (byte)E;
|
- ((char *)pObj)[0x16] = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)pObj + 0xb) = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_low = (byte)E;
|
- *(char *)(pObj + 0x16) = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_low = (byte)E;
|
- pObj[0x16] = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_low = (byte)E;
)
...>
}


@pObj_w_22_34_byte_22_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x16)
+ (char)((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(char *)((byte *)pObj + 0x16)
+ (char)((uw_mobile_object_t *)pObj)->tile_position_low
|
- ((char *)pObj)[0x16]
+ (char)((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(char *)((ushort *)pObj + 0xb)
+ (char)((uw_mobile_object_t *)pObj)->tile_position_low
|
- (char)((ushort *)pObj)[0xb]
+ (char)((uw_mobile_object_t *)pObj)->tile_position_low
|
- *(char *)(pObj + 0x16)
+ (char)((uw_mobile_object_t *)pObj)->tile_position_low
|
- pObj[0x16]
+ (char)((uw_mobile_object_t *)pObj)->tile_position_low
)
...>
}


@pObj_w_22_34_byte_23_byte@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x17)
+ ((uw_mobile_object_t *)pObj)->tile_position_high
|
- *(byte *)((byte *)pObj + 0x17)
+ ((uw_mobile_object_t *)pObj)->tile_position_high
|
- ((byte *)pObj)[0x17]
+ ((uw_mobile_object_t *)pObj)->tile_position_high
|
- *(byte *)(pObj + 0x17)
+ ((uw_mobile_object_t *)pObj)->tile_position_high
)
...>
}


@pObj_w_22_34_byte_23_undefined1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x17)
+ ((uw_mobile_object_t *)pObj)->tile_position_high
|
- *(undefined1 *)((byte *)pObj + 0x17)
+ ((uw_mobile_object_t *)pObj)->tile_position_high
|
- ((undefined1 *)pObj)[0x17]
+ ((uw_mobile_object_t *)pObj)->tile_position_high
|
- *(undefined1 *)(pObj + 0x17)
+ ((uw_mobile_object_t *)pObj)->tile_position_high
)
...>
}


@pObj_w_22_34_address_23@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pObj + 0x17)
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_high
|
- &*(char *)((byte *)pObj + 0x17)
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_high
|
- &((char *)pObj)[0x17]
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_high
|
- &*(char *)(pObj + 0x17)
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_high
|
- &pObj[0x17]
+ (char *)&((uw_mobile_object_t *)pObj)->tile_position_high
)
...>
}


@pObj_w_22_34_store_23@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x17) = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_high = (byte)E;
|
- *(char *)((byte *)pObj + 0x17) = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_high = (byte)E;
|
- ((char *)pObj)[0x17] = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_high = (byte)E;
|
- *(char *)(pObj + 0x17) = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_high = (byte)E;
|
- pObj[0x17] = E;
+ ((uw_mobile_object_t *)pObj)->tile_position_high = (byte)E;
)
...>
}


@pObj_w_22_34_byte_23_char@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x17)
+ (char)((uw_mobile_object_t *)pObj)->tile_position_high
|
- *(char *)((byte *)pObj + 0x17)
+ (char)((uw_mobile_object_t *)pObj)->tile_position_high
|
- ((char *)pObj)[0x17]
+ (char)((uw_mobile_object_t *)pObj)->tile_position_high
|
- *(char *)(pObj + 0x17)
+ (char)((uw_mobile_object_t *)pObj)->tile_position_high
|
- pObj[0x17]
+ (char)((uw_mobile_object_t *)pObj)->tile_position_high
)
...>
}


@cast_summon_or_spawn_effect_pObj_ai_flags@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(pObj + 0x19)
+ ((uw_mobile_object_t *)pObj)->npc_ai_flags
)
...>
}

@site_0_movement_flags_tick_phase_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)caster)->movement_flags & 0xf) >> 0
+ ((uw_mobile_object_t *)caster)->tick_phase
|
- (((uw_mobile_object_t *)caster)->movement_flags >> 0) & 0xf
+ ((uw_mobile_object_t *)caster)->tick_phase
|
- ((uw_mobile_object_t *)caster)->movement_flags & 0xf
+ ((uw_mobile_object_t *)caster)->tick_phase
)

...>
}

@site_0_movement_flags_movement_mode_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)caster)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)caster)->movement_mode
|
- (((uw_mobile_object_t *)caster)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)caster)->movement_mode
|
- (((uw_mobile_object_t *)caster)->movement_flags & 0x70) >> 4
+ ((uw_mobile_object_t *)caster)->movement_mode
|
- ((uw_mobile_object_t *)caster)->movement_flags & 0x70
+ (((uw_mobile_object_t *)caster)->movement_mode << 4)
)

...>
}

@site_0_motion_flags_speed_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)caster)->motion_flags & 0x7f) >> 0
+ ((uw_mobile_object_t *)caster)->speed
|
- (((uw_mobile_object_t *)caster)->motion_flags >> 0) & 0x7f
+ ((uw_mobile_object_t *)caster)->speed
|
- ((uw_mobile_object_t *)caster)->motion_flags & 0x7f
+ ((uw_mobile_object_t *)caster)->speed
)

...>
}

@site_0_motion_flags_gravity_flag_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)caster)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)caster)->gravity_flag
|
- (((uw_mobile_object_t *)caster)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)caster)->gravity_flag
|
- (((uw_mobile_object_t *)caster)->motion_flags & 0x80) >> 7
+ ((uw_mobile_object_t *)caster)->gravity_flag
|
- ((uw_mobile_object_t *)caster)->motion_flags >> 7
+ ((uw_mobile_object_t *)caster)->gravity_flag
|
- ((uw_mobile_object_t *)caster)->motion_flags & 0x80
+ (((uw_mobile_object_t *)caster)->gravity_flag << 7)
)

...>
}

@site_0_attack_pitch_pitch_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)caster)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)caster)->pitch
|
- (((uw_mobile_object_t *)caster)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)caster)->pitch
|
- (((uw_mobile_object_t *)caster)->attack_pitch & 0xf8) >> 3
+ ((uw_mobile_object_t *)caster)->pitch
|
- ((uw_mobile_object_t *)caster)->attack_pitch >> 3
+ ((uw_mobile_object_t *)caster)->pitch
|
- ((uw_mobile_object_t *)caster)->attack_pitch & 0xf8
+ (((uw_mobile_object_t *)caster)->pitch << 3)
)

...>
}

@site_0_heading_flags_fine_heading_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)caster)->heading_flags & 0x1f) >> 0
+ ((uw_mobile_object_t *)caster)->fine_heading
|
- (((uw_mobile_object_t *)caster)->heading_flags >> 0) & 0x1f
+ ((uw_mobile_object_t *)caster)->fine_heading
|
- ((uw_mobile_object_t *)caster)->heading_flags & 0x1f
+ ((uw_mobile_object_t *)caster)->fine_heading
)

...>
}

@cast_summon_or_spawn_effect_caster_tile_x_scaled@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)caster)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)caster)->tile_x << 3)
|
- (((uw_mobile_object_t *)caster)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)caster)->tile_x << 3)
|
- (((uw_mobile_object_t *)caster)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)caster)->tile_x << 3)
|
- ((((uw_mobile_object_t *)caster)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)caster)->tile_x << 3)
)
...>
}

@cast_summon_or_spawn_effect_caster_tile_y_scaled@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)caster)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)caster)->tile_y << 3)
|
- (((uw_mobile_object_t *)caster)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)caster)->tile_y << 3)
|
- (((uw_mobile_object_t *)caster)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)caster)->tile_y << 3)
|
- ((((uw_mobile_object_t *)caster)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)caster)->tile_y << 3)
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
