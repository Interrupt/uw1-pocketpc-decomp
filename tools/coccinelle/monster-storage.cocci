@multi_definition@
typedef undefined1, uw_monster_type_props_t;
@@
- undefined1 DAT_00202c38_backing[1536], DAT_001007d0_backing[3072];
+ undefined1 DAT_00202c38_backing[1536];
+ uw_monster_type_props_t g_monster_type_props[64];

@table_definition@
typedef undefined1, uw_monster_type_props_t;
@@
- undefined1 DAT_001007d0_backing[3072];
+ uw_monster_type_props_t g_monster_type_props[64];

@table_declaration@
typedef undefined1, uw_monster_type_props_t;
@@
- extern undefined1 DAT_001007d0_backing[3072];
+ extern uw_monster_type_props_t g_monster_type_props[64];

@table_size@
@@
- sizeof DAT_001007d0_backing
+ sizeof g_monster_type_props

@parenthesized_table_size@
@@
- sizeof(DAT_001007d0_backing)
+ sizeof g_monster_type_props

@table_byte_view@
typedef byte;
@@
- DAT_001007d0_backing
+ ((byte *)g_monster_type_props)

/* Also repairs storage sweeps already applied before the parenthesized
 * sizeof form was included. A byte view must not determine buffer size. */
@byte_view_size@
typedef byte;
@@
- sizeof((byte *)g_monster_type_props)
+ sizeof g_monster_type_props

@parenthesized_byte_view_size@
typedef byte;
@@
- sizeof(((byte *)g_monster_type_props))
+ sizeof g_monster_type_props
