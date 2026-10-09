@stride_pointer@
expression id;
@@
- &DAT_00202c90 + id * 0xd
+ &g_object_type_props[id]

@saved_pointer@
identifier stride =~ "iVar9";
@@
- &DAT_00202c90 + stride
+ &g_object_type_props[stride / 0xd]
