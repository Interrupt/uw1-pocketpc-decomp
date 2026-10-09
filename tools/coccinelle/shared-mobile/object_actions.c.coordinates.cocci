@check_object_drop_height_object_tile_x_scaled@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
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

@check_object_drop_height_object_tile_y_scaled@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
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

@spawn_random_variant_object_at_tile_iVar4_tile_x_scaled@
type R;
identifier F =~ "^\(spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)iVar4)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)iVar4)->tile_x << 3)
|
- (((uw_mobile_object_t *)iVar4)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)iVar4)->tile_x << 3)
|
- (((uw_mobile_object_t *)iVar4)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)iVar4)->tile_x << 3)
|
- ((((uw_mobile_object_t *)iVar4)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)iVar4)->tile_x << 3)
)
...>
}

@spawn_random_variant_object_at_tile_iVar4_tile_y_scaled@
type R;
identifier F =~ "^\(spawn_random_variant_object_at_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)iVar4)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)iVar4)->tile_y << 3)
|
- (((uw_mobile_object_t *)iVar4)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)iVar4)->tile_y << 3)
|
- (((uw_mobile_object_t *)iVar4)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)iVar4)->tile_y << 3)
|
- ((((uw_mobile_object_t *)iVar4)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)iVar4)->tile_y << 3)
)
...>
}
