@capacity_row@
expression E;
@@
- (&g_carry_weight_limit_table)[E * 3]
+ g_container_type_props[E].capacity

@capacity_byte_index@
expression E;
@@
- (&g_carry_weight_limit_table)[E]
+ g_container_type_props[(E) / 3].capacity

@decay_interval_row@
expression E;
@@
- (&g_light_radius_table)[E * 2]
+ g_light_type_props[E].decay_interval

@decay_interval_byte_index@
expression E;
@@
- (&g_light_radius_table)[E]
+ g_light_type_props[(E) / 2].decay_interval

@start_frame_row@
expression E;
@@
- (&DAT_00250732)[E * 4]
+ g_animation_type_props[E].start_frame

@start_frame_byte_index@
expression E;
@@
- (&DAT_00250732)[E]
+ g_animation_type_props[(E) / 4].start_frame

@frame_count_row@
expression E;
@@
- (&DAT_00250733)[E * 4]
+ g_animation_type_props[E].frame_count

@frame_count_byte_index@
expression E;
@@
- (&DAT_00250733)[E]
+ g_animation_type_props[(E) / 4].frame_count

@g_container_type_props_pointer@
expression E;
@@
- &g_carry_weight_limit_table + E * 3
+ &g_container_type_props[E]

@g_light_type_props_pointer@
expression E;
@@
- &g_light_radius_table + E * 2
+ &g_light_type_props[E]

@g_animation_type_props_pointer@
expression E;
@@
- &DAT_00250730 + E * 4
+ &g_animation_type_props[E]

@animation_flags_ushort_row@
typedef ushort;
expression E;
@@
- *(ushort *)(&DAT_00250730 + E * 4)
+ (ushort)g_animation_type_props[E].flags

@animation_flags_ushort_index@
typedef ushort;
expression E;
@@
- *(ushort *)(&DAT_00250730 + E)
+ (ushort)g_animation_type_props[(E) / 4].flags

@animation_flags_short_row@
expression E;
@@
- *(short *)(&DAT_00250730 + E * 4)
+ (short)g_animation_type_props[E].flags

@animation_flags_short_index@
expression E;
@@
- *(short *)(&DAT_00250730 + E)
+ (short)g_animation_type_props[(E) / 4].flags

@container_acceptance_word@
expression E;
@@
- *(short *)(&DAT_002029f9 + E)
+ (short)g_container_type_props[(E) / 3].acceptance_mask

@g_container_type_props_loader@
expression F;
@@
- read_file_handle(F, &g_carry_weight_limit_table, 0x30)
+ read_file_handle(F, g_container_type_props, sizeof g_container_type_props)

@g_light_type_props_loader@
expression F;
@@
- read_file_handle(F, &g_light_radius_table, 0x20)
+ read_file_handle(F, g_light_type_props, sizeof g_light_type_props)

@g_animation_type_props_loader@
expression F;
@@
- read_file_handle(F, &DAT_00250730, 0x40)
+ read_file_handle(F, g_animation_type_props, sizeof g_animation_type_props)

@animation_flags_after_row_pointer@
typedef ushort;
expression E;
@@
- *(ushort *)(&g_animation_type_props[E])
+ g_animation_type_props[E].flags

@armor_receiver@
typedef uw_armor_type_props_t;
@@
check_object_fits_in_slot(...) {
<...
- char *effect_ptr;
+ uw_armor_type_props_t *effect_ptr;
...>
}

@armor_receiver_assignment@
typedef uw_armor_type_props_t;
@@
check_object_fits_in_slot(...) {
<...
- effect_ptr = (char *)get_scanned_object_class_effect_ptr();
+ effect_ptr = (uw_armor_type_props_t *)get_scanned_object_class_effect_ptr();
...>
}

@armor_receiver_field@
@@
check_object_fits_in_slot(...) {
<...
- *(char *)(effect_ptr + 3)
+ (char)effect_ptr->equipment_slot
...>
}

@light_receiver@
typedef byte, uw_light_type_props_t;
@@
refresh_player_equipment_effects(...) {
<...
- byte *iVar7;
+ uw_light_type_props_t *iVar7;
...>
}

@light_receiver_field@
@@
refresh_player_equipment_effects(...) {
<...
- iVar7[1]
+ iVar7->brightness
...>
}
