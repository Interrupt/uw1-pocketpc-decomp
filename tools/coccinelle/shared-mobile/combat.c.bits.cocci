@site_0_movement_flags_tick_phase_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar6)->movement_flags & 0xf) >> 0
+ ((uw_mobile_object_t *)puVar6)->tick_phase
|
- (((uw_mobile_object_t *)puVar6)->movement_flags >> 0) & 0xf
+ ((uw_mobile_object_t *)puVar6)->tick_phase
|
- ((uw_mobile_object_t *)puVar6)->movement_flags & 0xf
+ ((uw_mobile_object_t *)puVar6)->tick_phase
)

...>
}

@site_0_movement_flags_movement_mode_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar6)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)puVar6)->movement_mode
|
- (((uw_mobile_object_t *)puVar6)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)puVar6)->movement_mode
|
- (((uw_mobile_object_t *)puVar6)->movement_flags & 0x70) >> 4
+ ((uw_mobile_object_t *)puVar6)->movement_mode
|
- ((uw_mobile_object_t *)puVar6)->movement_flags & 0x70
+ (((uw_mobile_object_t *)puVar6)->movement_mode << 4)
)

...>
}

@site_0_motion_flags_speed_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar6)->motion_flags & 0x7f) >> 0
+ ((uw_mobile_object_t *)puVar6)->speed
|
- (((uw_mobile_object_t *)puVar6)->motion_flags >> 0) & 0x7f
+ ((uw_mobile_object_t *)puVar6)->speed
|
- ((uw_mobile_object_t *)puVar6)->motion_flags & 0x7f
+ ((uw_mobile_object_t *)puVar6)->speed
)

...>
}

@site_0_motion_flags_gravity_flag_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar6)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)puVar6)->gravity_flag
|
- (((uw_mobile_object_t *)puVar6)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)puVar6)->gravity_flag
|
- (((uw_mobile_object_t *)puVar6)->motion_flags & 0x80) >> 7
+ ((uw_mobile_object_t *)puVar6)->gravity_flag
|
- ((uw_mobile_object_t *)puVar6)->motion_flags >> 7
+ ((uw_mobile_object_t *)puVar6)->gravity_flag
|
- ((uw_mobile_object_t *)puVar6)->motion_flags & 0x80
+ (((uw_mobile_object_t *)puVar6)->gravity_flag << 7)
)

...>
}

@site_0_attack_pitch_pitch_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar6)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)puVar6)->pitch
|
- (((uw_mobile_object_t *)puVar6)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)puVar6)->pitch
|
- (((uw_mobile_object_t *)puVar6)->attack_pitch & 0xf8) >> 3
+ ((uw_mobile_object_t *)puVar6)->pitch
|
- ((uw_mobile_object_t *)puVar6)->attack_pitch >> 3
+ ((uw_mobile_object_t *)puVar6)->pitch
|
- ((uw_mobile_object_t *)puVar6)->attack_pitch & 0xf8
+ (((uw_mobile_object_t *)puVar6)->pitch << 3)
)

...>
}

@site_0_heading_flags_fine_heading_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar6)->heading_flags & 0x1f) >> 0
+ ((uw_mobile_object_t *)puVar6)->fine_heading
|
- (((uw_mobile_object_t *)puVar6)->heading_flags >> 0) & 0x1f
+ ((uw_mobile_object_t *)puVar6)->fine_heading
|
- ((uw_mobile_object_t *)puVar6)->heading_flags & 0x1f
+ ((uw_mobile_object_t *)puVar6)->fine_heading
)

...>
}

@site_1_movement_flags_tick_phase_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->movement_flags & 0xf) >> 0
+ ((uw_mobile_object_t *)object)->tick_phase
|
- (((uw_mobile_object_t *)object)->movement_flags >> 0) & 0xf
+ ((uw_mobile_object_t *)object)->tick_phase
|
- ((uw_mobile_object_t *)object)->movement_flags & 0xf
+ ((uw_mobile_object_t *)object)->tick_phase
)

...>
}

@site_1_movement_flags_movement_mode_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)object)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)object)->movement_mode
|
- (((uw_mobile_object_t *)object)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)object)->movement_mode
|
- (((uw_mobile_object_t *)object)->movement_flags & 0x70) >> 4
+ ((uw_mobile_object_t *)object)->movement_mode
|
- ((uw_mobile_object_t *)object)->movement_flags & 0x70
+ (((uw_mobile_object_t *)object)->movement_mode << 4)
)

...>
}

@site_1_motion_flags_speed_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->motion_flags & 0x7f) >> 0
+ ((uw_mobile_object_t *)object)->speed
|
- (((uw_mobile_object_t *)object)->motion_flags >> 0) & 0x7f
+ ((uw_mobile_object_t *)object)->speed
|
- ((uw_mobile_object_t *)object)->motion_flags & 0x7f
+ ((uw_mobile_object_t *)object)->speed
)

...>
}

@site_1_motion_flags_gravity_flag_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)object)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)object)->gravity_flag
|
- (((uw_mobile_object_t *)object)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)object)->gravity_flag
|
- (((uw_mobile_object_t *)object)->motion_flags & 0x80) >> 7
+ ((uw_mobile_object_t *)object)->gravity_flag
|
- ((uw_mobile_object_t *)object)->motion_flags >> 7
+ ((uw_mobile_object_t *)object)->gravity_flag
|
- ((uw_mobile_object_t *)object)->motion_flags & 0x80
+ (((uw_mobile_object_t *)object)->gravity_flag << 7)
)

...>
}

@site_1_attack_pitch_pitch_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)object)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)object)->pitch
|
- (((uw_mobile_object_t *)object)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)object)->pitch
|
- (((uw_mobile_object_t *)object)->attack_pitch & 0xf8) >> 3
+ ((uw_mobile_object_t *)object)->pitch
|
- ((uw_mobile_object_t *)object)->attack_pitch >> 3
+ ((uw_mobile_object_t *)object)->pitch
|
- ((uw_mobile_object_t *)object)->attack_pitch & 0xf8
+ (((uw_mobile_object_t *)object)->pitch << 3)
)

...>
}

@site_1_heading_flags_fine_heading_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->heading_flags & 0x1f) >> 0
+ ((uw_mobile_object_t *)object)->fine_heading
|
- (((uw_mobile_object_t *)object)->heading_flags >> 0) & 0x1f
+ ((uw_mobile_object_t *)object)->fine_heading
|
- ((uw_mobile_object_t *)object)->heading_flags & 0x1f
+ ((uw_mobile_object_t *)object)->fine_heading
)

...>
}

@site_2_movement_flags_tick_phase_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar4)->movement_flags & 0xf) >> 0
+ ((uw_mobile_object_t *)puVar4)->tick_phase
|
- (((uw_mobile_object_t *)puVar4)->movement_flags >> 0) & 0xf
+ ((uw_mobile_object_t *)puVar4)->tick_phase
|
- ((uw_mobile_object_t *)puVar4)->movement_flags & 0xf
+ ((uw_mobile_object_t *)puVar4)->tick_phase
)

...>
}

@site_2_movement_flags_movement_mode_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar4)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)puVar4)->movement_mode
|
- (((uw_mobile_object_t *)puVar4)->movement_flags >> 4) & 0x7
+ ((uw_mobile_object_t *)puVar4)->movement_mode
|
- (((uw_mobile_object_t *)puVar4)->movement_flags & 0x70) >> 4
+ ((uw_mobile_object_t *)puVar4)->movement_mode
|
- ((uw_mobile_object_t *)puVar4)->movement_flags & 0x70
+ (((uw_mobile_object_t *)puVar4)->movement_mode << 4)
)

...>
}

@site_2_motion_flags_speed_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar4)->motion_flags & 0x7f) >> 0
+ ((uw_mobile_object_t *)puVar4)->speed
|
- (((uw_mobile_object_t *)puVar4)->motion_flags >> 0) & 0x7f
+ ((uw_mobile_object_t *)puVar4)->speed
|
- ((uw_mobile_object_t *)puVar4)->motion_flags & 0x7f
+ ((uw_mobile_object_t *)puVar4)->speed
)

...>
}

@site_2_motion_flags_gravity_flag_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar4)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)puVar4)->gravity_flag
|
- (((uw_mobile_object_t *)puVar4)->motion_flags >> 7) & 0x1
+ ((uw_mobile_object_t *)puVar4)->gravity_flag
|
- (((uw_mobile_object_t *)puVar4)->motion_flags & 0x80) >> 7
+ ((uw_mobile_object_t *)puVar4)->gravity_flag
|
- ((uw_mobile_object_t *)puVar4)->motion_flags >> 7
+ ((uw_mobile_object_t *)puVar4)->gravity_flag
|
- ((uw_mobile_object_t *)puVar4)->motion_flags & 0x80
+ (((uw_mobile_object_t *)puVar4)->gravity_flag << 7)
)

...>
}

@site_2_attack_pitch_pitch_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(((uw_mobile_object_t *)puVar4)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)puVar4)->pitch
|
- (((uw_mobile_object_t *)puVar4)->attack_pitch >> 3) & 0x1f
+ ((uw_mobile_object_t *)puVar4)->pitch
|
- (((uw_mobile_object_t *)puVar4)->attack_pitch & 0xf8) >> 3
+ ((uw_mobile_object_t *)puVar4)->pitch
|
- ((uw_mobile_object_t *)puVar4)->attack_pitch >> 3
+ ((uw_mobile_object_t *)puVar4)->pitch
|
- ((uw_mobile_object_t *)puVar4)->attack_pitch & 0xf8
+ (((uw_mobile_object_t *)puVar4)->pitch << 3)
)

...>
}

@site_2_heading_flags_fine_heading_ptr disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar4)->heading_flags & 0x1f) >> 0
+ ((uw_mobile_object_t *)puVar4)->fine_heading
|
- (((uw_mobile_object_t *)puVar4)->heading_flags >> 0) & 0x1f
+ ((uw_mobile_object_t *)puVar4)->fine_heading
|
- ((uw_mobile_object_t *)puVar4)->heading_flags & 0x1f
+ ((uw_mobile_object_t *)puVar4)->fine_heading
)

...>
}
