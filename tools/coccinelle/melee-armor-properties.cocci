@melee_skill@
expression E;
@@
- (&DAT_00202806)[E * 8]
+ g_melee_type_props[E].skill

@melee_durability@
expression E;
@@
- DAT_00202807[E * 8]
+ g_melee_type_props[E].durability

@melee_pointer@
expression E;
@@
- &DAT_00202800 + E * 8
+ (char *)&g_melee_type_props[E]

@melee_loader@
expression F;
@@
- read_file_handle(F, &DAT_00202800, 0x80)
+ read_file_handle(F, g_melee_type_props, sizeof g_melee_type_props)

@armor_pointer@
expression E;
@@
- &DAT_00202750 + E * 4
+ (char *)&g_armor_type_props[E]

@armor_loader@
expression F;
@@
- read_file_handle(F, &DAT_00202750, 0x80)
+ read_file_handle(F, g_armor_type_props, sizeof g_armor_type_props)

@armor_durability@
expression E;
@@
- (&DAT_00202750)[E * 4 + 1]
+ g_armor_type_props[E].durability

@armor_unknown@
expression E;
@@
- (&DAT_00202750)[E * 4 + 2]
+ g_armor_type_props[E]._unknown02

@armor_slot@
expression E;
@@
- (&DAT_00202750)[E * 4 + 3]
+ g_armor_type_props[E].equipment_slot

@armor_protection@
expression E;
@@
- (&DAT_00202750)[E * 4]
+ g_armor_type_props[E].protection

@armor_item_id@
expression E;
@@
- (&DAT_00202750)[E * 4 - 0x80]
+ g_armor_type_props[(E) - 0x20].protection
