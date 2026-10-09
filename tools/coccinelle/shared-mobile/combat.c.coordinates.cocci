@apply_melee_damage_puVar6_tile_x_scaled@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar6)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)puVar6)->tile_x << 3)
|
- (((uw_mobile_object_t *)puVar6)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)puVar6)->tile_x << 3)
|
- (((uw_mobile_object_t *)puVar6)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)puVar6)->tile_x << 3)
|
- ((((uw_mobile_object_t *)puVar6)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)puVar6)->tile_x << 3)
)
...>
}

@apply_melee_damage_puVar6_tile_y_scaled@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar6)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)puVar6)->tile_y << 3)
|
- (((uw_mobile_object_t *)puVar6)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)puVar6)->tile_y << 3)
|
- (((uw_mobile_object_t *)puVar6)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)puVar6)->tile_y << 3)
|
- ((((uw_mobile_object_t *)puVar6)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)puVar6)->tile_y << 3)
)
...>
}

@apply_object_durability_damage_object_tile_x_scaled@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- (((uw_mobile_object_t *)object)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- (((uw_mobile_object_t *)object)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
|
- ((((uw_mobile_object_t *)object)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)object)->tile_x << 3)
)
...>
}

@apply_object_durability_damage_object_tile_y_scaled@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)object)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- (((uw_mobile_object_t *)object)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- (((uw_mobile_object_t *)object)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
|
- ((((uw_mobile_object_t *)object)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)object)->tile_y << 3)
)
...>
}

@resolve_collision_candidate_interaction_puVar4_tile_x_scaled@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar4)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)puVar4)->tile_x << 3)
|
- (((uw_mobile_object_t *)puVar4)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)puVar4)->tile_x << 3)
|
- (((uw_mobile_object_t *)puVar4)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)puVar4)->tile_x << 3)
|
- ((((uw_mobile_object_t *)puVar4)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)puVar4)->tile_x << 3)
)
...>
}

@resolve_collision_candidate_interaction_puVar4_tile_y_scaled@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar4)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)puVar4)->tile_y << 3)
|
- (((uw_mobile_object_t *)puVar4)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)puVar4)->tile_y << 3)
|
- (((uw_mobile_object_t *)puVar4)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)puVar4)->tile_y << 3)
|
- ((((uw_mobile_object_t *)puVar4)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)puVar4)->tile_y << 3)
)
...>
}
