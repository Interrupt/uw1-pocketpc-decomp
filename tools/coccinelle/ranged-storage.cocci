@definition@
typedef undefined1, uw_ranged_type_props_t;
@@
- undefined1 DAT_002027d0_backing[48];
+ uw_ranged_type_props_t g_ranged_type_props[16];

@table_declaration@
typedef undefined1, uw_ranged_type_props_t;
@@
- extern undefined1 DAT_002027d0_backing[48];
+ extern uw_ranged_type_props_t g_ranged_type_props[16];

@size@
@@
- sizeof DAT_002027d0_backing
+ sizeof g_ranged_type_props

@paren_size@
@@
- sizeof(DAT_002027d0_backing)
+ sizeof g_ranged_type_props

@byte_view@
typedef byte;
@@
- DAT_002027d0_backing
+ ((byte *)g_ranged_type_props)

@repair_size@
typedef byte;
@@
- sizeof((byte *)g_ranged_type_props)
+ sizeof g_ranged_type_props

@repair_paren_size@
typedef byte;
@@
- sizeof(((byte *)g_ranged_type_props))
+ sizeof g_ranged_type_props
