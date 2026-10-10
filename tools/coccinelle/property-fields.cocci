@radius@
expression id;
typedef byte;
@@
(
- ((byte)g_object_type_props[id].size_weight) & 7
+ g_object_type_props[id].collision_radius
|
- g_object_type_props[id].size_weight & 7
+ g_object_type_props[id].collision_radius
)

@weight@
expression id;
@@
- g_object_type_props[id].size_weight >> 4
+ g_object_type_props[id].unit_weight

@description_quality@
expression id;
typedef byte;
@@
(
- (byte)g_object_type_props[id].description_flags & 0xf
+ g_object_type_props[id].quality_type
|
- g_object_type_props[id].description_flags & 0xf
+ g_object_type_props[id].quality_type
)
