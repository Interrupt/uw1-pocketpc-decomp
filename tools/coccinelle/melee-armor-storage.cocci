@g_melee_type_props_definition@
typedef undefined1, uw_melee_type_props_t;
@@
- undefined1 DAT_00202800_backing[256];
+ uw_melee_type_props_t g_melee_type_props[16];

@g_melee_type_props_declaration@
typedef undefined1, uw_melee_type_props_t;
@@
- extern undefined1 DAT_00202800_backing[256];
+ extern uw_melee_type_props_t g_melee_type_props[16];

@g_melee_type_props_size_2@
@@
- sizeof DAT_00202800_backing
+ sizeof g_melee_type_props

@g_melee_type_props_size_3@
@@
- sizeof(DAT_00202800_backing)
+ sizeof g_melee_type_props

@g_melee_type_props_byte_view@
typedef byte;
@@
- DAT_00202800_backing
+ ((byte *)g_melee_type_props)

@g_melee_type_props_repair_5@
typedef byte;
@@
- sizeof((byte *)g_melee_type_props)
+ sizeof g_melee_type_props

@g_melee_type_props_repair_6@
typedef byte;
@@
- sizeof(((byte *)g_melee_type_props))
+ sizeof g_melee_type_props

@g_armor_type_props_definition@
typedef undefined1, uw_armor_type_props_t;
@@
- undefined1 DAT_00202750_backing[128];
+ uw_armor_type_props_t g_armor_type_props[32];

@g_armor_type_props_declaration@
typedef undefined1, uw_armor_type_props_t;
@@
- extern undefined1 DAT_00202750_backing[128];
+ extern uw_armor_type_props_t g_armor_type_props[32];

@g_armor_type_props_size_9@
@@
- sizeof DAT_00202750_backing
+ sizeof g_armor_type_props

@g_armor_type_props_size_10@
@@
- sizeof(DAT_00202750_backing)
+ sizeof g_armor_type_props

@g_armor_type_props_byte_view@
typedef byte;
@@
- DAT_00202750_backing
+ ((byte *)g_armor_type_props)

@g_armor_type_props_repair_12@
typedef byte;
@@
- sizeof((byte *)g_armor_type_props)
+ sizeof g_armor_type_props

@g_armor_type_props_repair_13@
typedef byte;
@@
- sizeof(((byte *)g_armor_type_props))
+ sizeof g_armor_type_props
