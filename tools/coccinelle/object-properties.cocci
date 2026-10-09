@byte_0@
expression id;
typedef byte;
@@
- (&DAT_00202c90)[id * 0xd]
+ g_object_type_props[id].height

@byte_1@
expression id;
typedef byte;
@@
- (&DAT_00202c91)[id * 0xd]
+ ((byte)g_object_type_props[id].size_weight)

@word_1@
expression id;
typedef ushort;
@@
- *(ushort *)(&DAT_00202c91 + id * 0xd)
+ g_object_type_props[id].size_weight

@signed_word_1@
expression id;
@@
- *(short *)(&DAT_00202c91 + id * 0xd)
+ (short)g_object_type_props[id].size_weight

@byte_3@
expression id;
typedef byte;
@@
- (&DAT_00202c93)[id * 0xd]
+ g_object_type_props[id].flags

@byte_5@
expression id;
typedef byte;
@@
- (&DAT_00202c95)[id * 0xd]
+ g_object_type_props[id].monetary_value

@word_5@
expression id;
typedef ushort;
@@
- *(ushort *)(&DAT_00202c95 + id * 0xd)
+ g_object_type_props[id].monetary_value

@signed_word_5@
expression id;
@@
- *(short *)(&DAT_00202c95 + id * 0xd)
+ (short)g_object_type_props[id].monetary_value

@byte_7@
expression id;
typedef byte;
@@
- (&DAT_00202c97)[id * 0xd]
+ g_object_type_props[id].quality_flags

@byte_8@
expression id;
typedef byte;
@@
- (&DAT_00202c98)[id * 0xd]
+ g_object_type_props[id].owner_flags

@byte_9@
expression id;
typedef byte;
@@
- (&DAT_00202c99)[id * 0xd]
+ g_object_type_props[id].scale_flags

@byte_10@
expression id;
typedef byte;
@@
- (&DAT_00202c9a)[id * 0xd]
+ g_object_type_props[id].class_flags

@byte_11@
expression id;
typedef byte;
@@
- (&DAT_00202c9b)[id * 0xd]
+ g_object_type_props[id].description_flags

@saved_byte_0@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c90)[stride]
+ g_object_type_props[stride / 0xd].height

@saved_byte_1@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c91)[stride]
+ ((byte)g_object_type_props[stride / 0xd].size_weight)

@saved_word_1@
identifier stride =~ "iVar";
typedef ushort;
@@
- *(ushort *)(&DAT_00202c91 + stride)
+ g_object_type_props[stride / 0xd].size_weight

@saved_byte_3@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c93)[stride]
+ g_object_type_props[stride / 0xd].flags

@saved_byte_5@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c95)[stride]
+ g_object_type_props[stride / 0xd].monetary_value

@saved_word_5@
identifier stride =~ "iVar";
typedef ushort;
@@
- *(ushort *)(&DAT_00202c95 + stride)
+ g_object_type_props[stride / 0xd].monetary_value

@saved_byte_7@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c97)[stride]
+ g_object_type_props[stride / 0xd].quality_flags

@saved_byte_8@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c98)[stride]
+ g_object_type_props[stride / 0xd].owner_flags

@saved_byte_9@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c99)[stride]
+ g_object_type_props[stride / 0xd].scale_flags

@saved_byte_10@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c9a)[stride]
+ g_object_type_props[stride / 0xd].class_flags

@saved_byte_11@
identifier stride =~ "iVar";
typedef byte;
@@
- (&DAT_00202c9b)[stride]
+ g_object_type_props[stride / 0xd].description_flags

@quality_owner_word@
expression stride;
typedef ushort;
@@
- *(ushort *)(&DAT_00202c97 + stride)
+ g_object_type_props[stride / 0xd].quality_owner_flags

@saved_render_byte_0@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c90)[stride]
+ g_object_type_props[stride / 0xd].height

@saved_render_byte_1@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c91)[stride]
+ ((byte)g_object_type_props[stride / 0xd].size_weight)

@saved_render_word_1@
identifier stride =~ "_iv";
typedef ushort;
@@
- *(ushort *)(&DAT_00202c91 + stride)
+ g_object_type_props[stride / 0xd].size_weight

@saved_render_byte_3@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c93)[stride]
+ g_object_type_props[stride / 0xd].flags

@saved_render_byte_5@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c95)[stride]
+ g_object_type_props[stride / 0xd].monetary_value

@saved_render_word_5@
identifier stride =~ "_iv";
typedef ushort;
@@
- *(ushort *)(&DAT_00202c95 + stride)
+ g_object_type_props[stride / 0xd].monetary_value

@saved_render_byte_7@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c97)[stride]
+ g_object_type_props[stride / 0xd].quality_flags

@saved_render_byte_8@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c98)[stride]
+ g_object_type_props[stride / 0xd].owner_flags

@saved_render_byte_9@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c99)[stride]
+ g_object_type_props[stride / 0xd].scale_flags

@saved_render_byte_10@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c9a)[stride]
+ g_object_type_props[stride / 0xd].class_flags

@saved_render_byte_11@
identifier stride =~ "_iv";
typedef byte;
@@
- (&DAT_00202c9b)[stride]
+ g_object_type_props[stride / 0xd].description_flags
