@w_22_0_pair_char_char@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x16) = (char)V;
- *(char *)((char *)object + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@w_22_0_pair_char_byte@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x16) = (char)V;
- *(byte *)((char *)object + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@w_22_0_pair_byte_char@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x16) = (byte)V;
- *(char *)((char *)object + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@w_22_0_pair_byte_byte@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x16) = (byte)V;
- *(byte *)((char *)object + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@w_22_0_word_ushort@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- ((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
)
...>
}


@w_22_0_word_undefined2@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- ((undefined2 *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)((undefined2 *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
)
...>
}


@w_22_0_word_short@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- ((short *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)((short *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_signed
)
...>
}


@w_22_0_byte_22_byte@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- ((byte *)object)[0x16]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (byte)((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (byte)object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- ((undefined1 *)object)[0x16]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (undefined1)((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (undefined1)object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@w_22_0_address_22@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x16)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)((byte *)object + 0x16)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &((char *)object)[0x16]
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)((ushort *)object + 0xb)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)(object + 0xb)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@w_22_0_store_22@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x16) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)((byte *)object + 0x16) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- ((char *)object)[0x16] = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)object + 0xb) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)(object + 0xb) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
)
...>
}


@w_22_0_byte_22_char@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x16)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)((byte *)object + 0x16)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- ((char *)object)[0x16]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)((ushort *)object + 0xb)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- (char)((ushort *)object)[0xb]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)(object + 0xb)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- (char)object[0xb]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@w_22_0_byte_23_byte@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- *(byte *)((byte *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- ((byte *)object)[0x17]
+ ((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- *(undefined1 *)((byte *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- ((undefined1 *)object)[0x17]
+ ((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@w_22_0_address_23@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x17)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
|
- &*(char *)((byte *)object + 0x17)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
|
- &((char *)object)[0x17]
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@w_22_0_store_23@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x17) = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
|
- *(char *)((byte *)object + 0x17) = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
|
- ((char *)object)[0x17] = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
)
...>
}


@w_22_0_byte_23_char@
type R;
identifier F =~ "^sync_object_tile_position$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x17)
+ (char)((uw_mobile_object_t *)object)->tile_position_high
|
- *(char *)((byte *)object + 0x17)
+ (char)((uw_mobile_object_t *)object)->tile_position_high
|
- ((char *)object)[0x17]
+ (char)((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@sync_object_tile_position_object_hit_points_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x8)
+ ((uw_mobile_object_t *)object)->hit_points
|
- *(byte *)(object + 0x4)
+ ((uw_mobile_object_t *)object)->hit_points
|
- (byte)object[0x4]
+ ((uw_mobile_object_t *)object)->hit_points
)
...>
}

@sync_object_tile_position_object_hit_points_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x8)
+ ((uw_mobile_object_t *)object)->hit_points
|
- *(undefined1 *)(object + 0x4)
+ ((uw_mobile_object_t *)object)->hit_points
|
- (undefined1)object[0x4]
+ ((uw_mobile_object_t *)object)->hit_points
)
...>
}

@sync_object_tile_position_object_hit_points_address@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x8)
+ (char *)&((uw_mobile_object_t *)object)->hit_points
|
- &*(char *)(object + 0x4)
+ (char *)&((uw_mobile_object_t *)object)->hit_points
)
...>
}

@sync_object_tile_position_object_hit_points_store@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x8) = E;
+ ((uw_mobile_object_t *)object)->hit_points = (byte)E;
|
- *(char *)(object + 0x4) = E;
+ ((uw_mobile_object_t *)object)->hit_points = (byte)E;
)
...>
}

@sync_object_tile_position_object_hit_points_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x8)
+ (char)((uw_mobile_object_t *)object)->hit_points
|
- *(char *)(object + 0x4)
+ (char)((uw_mobile_object_t *)object)->hit_points
|
- (char)object[0x4]
+ (char)((uw_mobile_object_t *)object)->hit_points
)
...>
}

@sync_object_tile_position_object_full_heading_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x9)
+ ((uw_mobile_object_t *)object)->full_heading
)
...>
}

@sync_object_tile_position_object_full_heading_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x9)
+ ((uw_mobile_object_t *)object)->full_heading
)
...>
}

@sync_object_tile_position_object_full_heading_address@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x9)
+ (char *)&((uw_mobile_object_t *)object)->full_heading
)
...>
}

@sync_object_tile_position_object_full_heading_store@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x9) = E;
+ ((uw_mobile_object_t *)object)->full_heading = (byte)E;
)
...>
}

@sync_object_tile_position_object_full_heading_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x9)
+ (char)((uw_mobile_object_t *)object)->full_heading
)
...>
}

@sync_object_tile_position_object_movement_flags_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0xa)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- *(byte *)(object + 0x5)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- (byte)object[0x5]
+ ((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@sync_object_tile_position_object_movement_flags_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0xa)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- *(undefined1 *)(object + 0x5)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- (undefined1)object[0x5]
+ ((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@sync_object_tile_position_object_movement_flags_address@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0xa)
+ (char *)&((uw_mobile_object_t *)object)->movement_flags
|
- &*(char *)(object + 0x5)
+ (char *)&((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@sync_object_tile_position_object_movement_flags_store@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0xa) = E;
+ ((uw_mobile_object_t *)object)->movement_flags = (byte)E;
|
- *(char *)(object + 0x5) = E;
+ ((uw_mobile_object_t *)object)->movement_flags = (byte)E;
)
...>
}

@sync_object_tile_position_object_movement_flags_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0xa)
+ (char)((uw_mobile_object_t *)object)->movement_flags
|
- *(char *)(object + 0x5)
+ (char)((uw_mobile_object_t *)object)->movement_flags
|
- (char)object[0x5]
+ (char)((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@sync_object_tile_position_object_motion_flags_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x13)
+ ((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@sync_object_tile_position_object_motion_flags_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x13)
+ ((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@sync_object_tile_position_object_motion_flags_address@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x13)
+ (char *)&((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@sync_object_tile_position_object_motion_flags_store@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x13) = E;
+ ((uw_mobile_object_t *)object)->motion_flags = (byte)E;
)
...>
}

@sync_object_tile_position_object_motion_flags_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x13)
+ (char)((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@sync_object_tile_position_object_attack_pitch_byte@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x14)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- *(byte *)(object + 0xa)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- (byte)object[0xa]
+ ((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@sync_object_tile_position_object_attack_pitch_undefined1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x14)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- *(undefined1 *)(object + 0xa)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- (undefined1)object[0xa]
+ ((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@sync_object_tile_position_object_attack_pitch_address@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x14)
+ (char *)&((uw_mobile_object_t *)object)->attack_pitch
|
- &*(char *)(object + 0xa)
+ (char *)&((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@sync_object_tile_position_object_attack_pitch_store@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x14) = E;
+ ((uw_mobile_object_t *)object)->attack_pitch = (byte)E;
|
- *(char *)(object + 0xa) = E;
+ ((uw_mobile_object_t *)object)->attack_pitch = (byte)E;
)
...>
}

@sync_object_tile_position_object_attack_pitch_char@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x14)
+ (char)((uw_mobile_object_t *)object)->attack_pitch
|
- *(char *)(object + 0xa)
+ (char)((uw_mobile_object_t *)object)->attack_pitch
|
- (char)object[0xa]
+ (char)((uw_mobile_object_t *)object)->attack_pitch
)
...>
}
