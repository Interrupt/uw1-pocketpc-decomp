@damage_row@
expression E;
@@
- (&DAT_002027d0)[E * 3]
+ g_ranged_type_props[E].damage

@damage_byte_index@
expression E;
@@
- (&DAT_002027d0)[E]
+ g_ranged_type_props[(E) / 3].damage

@projectile_speed_row@
expression E;
@@
- (&DAT_002027d1)[E * 3]
+ g_ranged_type_props[E].projectile_speed

@projectile_speed_byte_index@
expression E;
@@
- (&DAT_002027d1)[E]
+ g_ranged_type_props[(E) / 3].projectile_speed

@ammo_damage_selector_row@
expression E;
@@
- (&DAT_002027d2)[E * 3]
+ g_ranged_type_props[E].ammo_damage_selector

@ammo_damage_selector_byte_index@
expression E;
@@
- (&DAT_002027d2)[E]
+ g_ranged_type_props[(E) / 3].ammo_damage_selector

@row_pointer@
expression E;
@@
- &DAT_002027d0 + E * 3
+ (char *)&g_ranged_type_props[E]

@byte_pointer@
expression E;
@@
- &DAT_002027d0 + E
+ (char *)&g_ranged_type_props[(E) / 3]

@loader@
expression F;
@@
- read_file_handle(F, &DAT_002027d0, 0x30)
+ read_file_handle(F, g_ranged_type_props, sizeof g_ranged_type_props)
