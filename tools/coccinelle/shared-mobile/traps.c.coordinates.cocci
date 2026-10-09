@apply_poison_or_damage_trap_effect_iVar2_tile_x_scaled@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)iVar2)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)iVar2)->tile_x << 3)
|
- (((uw_mobile_object_t *)iVar2)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)iVar2)->tile_x << 3)
|
- (((uw_mobile_object_t *)iVar2)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)iVar2)->tile_x << 3)
|
- ((((uw_mobile_object_t *)iVar2)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)iVar2)->tile_x << 3)
)
...>
}

@apply_poison_or_damage_trap_effect_iVar2_tile_y_scaled@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)iVar2)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)iVar2)->tile_y << 3)
|
- (((uw_mobile_object_t *)iVar2)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)iVar2)->tile_y << 3)
|
- (((uw_mobile_object_t *)iVar2)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)iVar2)->tile_y << 3)
|
- ((((uw_mobile_object_t *)iVar2)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)iVar2)->tile_y << 3)
)
...>
}
