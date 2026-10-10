@site_0_movement_flags_tick_phase_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar3)->movement_flags & 0xf) >> 0
+ ((uw_mobile_object_t *)puVar3)->tick_phase
|
- (((uw_mobile_object_t *)puVar3)->movement_flags >> 0) & 0xf
+ ((uw_mobile_object_t *)puVar3)->tick_phase
|
- ((uw_mobile_object_t *)puVar3)->movement_flags & 0xf
+ ((uw_mobile_object_t *)puVar3)->tick_phase
)

...>
}

@site_0_movement_flags_movement_mode_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar3)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)puVar3)->movement_mode
|
- (((uw_mobile_object_t *)puVar3)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)puVar3)->movement_mode
|
- (((uw_mobile_object_t *)puVar3)->movement_flags & 0x70) >> 4
+ ((uw_mobile_object_t *)puVar3)->movement_mode
|
- ((uw_mobile_object_t *)puVar3)->movement_flags & 0x70
+ (((uw_mobile_object_t *)puVar3)->movement_mode << 4)
)

...>
}

@site_0_motion_flags_speed_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar3)->motion_flags & 0x7f) >> 0
+ ((uw_mobile_object_t *)puVar3)->speed
|
- (((uw_mobile_object_t *)puVar3)->motion_flags >> 0) & 0x7f
+ ((uw_mobile_object_t *)puVar3)->speed
|
- ((uw_mobile_object_t *)puVar3)->motion_flags & 0x7f
+ ((uw_mobile_object_t *)puVar3)->speed
)

...>
}

@site_0_motion_flags_gravity_flag_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar3)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)puVar3)->gravity_flag
|
- (((uw_mobile_object_t *)puVar3)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)puVar3)->gravity_flag
|
- (((uw_mobile_object_t *)puVar3)->motion_flags & 0x80) >> 7
+ ((uw_mobile_object_t *)puVar3)->gravity_flag
|
- ((uw_mobile_object_t *)puVar3)->motion_flags >> 7
+ ((uw_mobile_object_t *)puVar3)->gravity_flag
|
- ((uw_mobile_object_t *)puVar3)->motion_flags & 0x80
+ (((uw_mobile_object_t *)puVar3)->gravity_flag << 7)
)

...>
}

@site_0_attack_pitch_pitch_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar3)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)puVar3)->pitch
|
- (((uw_mobile_object_t *)puVar3)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)puVar3)->pitch
|
- (((uw_mobile_object_t *)puVar3)->attack_pitch & 0xf8) >> 3
+ ((uw_mobile_object_t *)puVar3)->pitch
|
- ((uw_mobile_object_t *)puVar3)->attack_pitch >> 3
+ ((uw_mobile_object_t *)puVar3)->pitch
|
- ((uw_mobile_object_t *)puVar3)->attack_pitch & 0xf8
+ (((uw_mobile_object_t *)puVar3)->pitch << 3)
)

...>
}

@site_0_heading_flags_fine_heading_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar3)->heading_flags & 0x1f) >> 0
+ ((uw_mobile_object_t *)puVar3)->fine_heading
|
- (((uw_mobile_object_t *)puVar3)->heading_flags >> 0) & 0x1f
+ ((uw_mobile_object_t *)puVar3)->fine_heading
|
- ((uw_mobile_object_t *)puVar3)->heading_flags & 0x1f
+ ((uw_mobile_object_t *)puVar3)->fine_heading
)

...>
}
