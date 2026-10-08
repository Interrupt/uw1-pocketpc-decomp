@copy_type_flags_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->type_flags_low = Q->type_flags_low;
- P->type_flags_high = Q->type_flags_high;
+ P->type_flags = Q->type_flags;
|
- P->type_flags_low = (byte)(Q->type_flags);
- P->type_flags_high = Q->type_flags_high;
+ P->type_flags = Q->type_flags;
|
- P->type_flags_low = (char)(Q->type_flags);
- P->type_flags_high = Q->type_flags_high;
+ P->type_flags = Q->type_flags;
|
- P->type_flags_low = (byte)(char)(Q->type_flags);
- P->type_flags_high = Q->type_flags_high;
+ P->type_flags = Q->type_flags;
)

@copy_type_flags_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->type_flags_low = Q.type_flags_low;
- P->type_flags_high = Q.type_flags_high;
+ P->type_flags = Q.type_flags;
|
- P->type_flags_low = (byte)(Q.type_flags);
- P->type_flags_high = Q.type_flags_high;
+ P->type_flags = Q.type_flags;
|
- P->type_flags_low = (char)(Q.type_flags);
- P->type_flags_high = Q.type_flags_high;
+ P->type_flags = Q.type_flags;
|
- P->type_flags_low = (byte)(char)(Q.type_flags);
- P->type_flags_high = Q.type_flags_high;
+ P->type_flags = Q.type_flags;
)

@copy_type_flags_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->type_flags_low = Q->hdr.type_flags_low;
- P->type_flags_high = Q->hdr.type_flags_high;
+ P->type_flags = Q->hdr.type_flags;
|
- P->type_flags_low = (byte)(Q->hdr.type_flags);
- P->type_flags_high = Q->hdr.type_flags_high;
+ P->type_flags = Q->hdr.type_flags;
|
- P->type_flags_low = (char)(Q->hdr.type_flags);
- P->type_flags_high = Q->hdr.type_flags_high;
+ P->type_flags = Q->hdr.type_flags;
|
- P->type_flags_low = (byte)(char)(Q->hdr.type_flags);
- P->type_flags_high = Q->hdr.type_flags_high;
+ P->type_flags = Q->hdr.type_flags;
)

@copy_type_flags_0_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->type_flags_low = Q.hdr.type_flags_low;
- P->type_flags_high = Q.hdr.type_flags_high;
+ P->type_flags = Q.hdr.type_flags;
|
- P->type_flags_low = (byte)(Q.hdr.type_flags);
- P->type_flags_high = Q.hdr.type_flags_high;
+ P->type_flags = Q.hdr.type_flags;
|
- P->type_flags_low = (char)(Q.hdr.type_flags);
- P->type_flags_high = Q.hdr.type_flags_high;
+ P->type_flags = Q.hdr.type_flags;
|
- P->type_flags_low = (byte)(char)(Q.hdr.type_flags);
- P->type_flags_high = Q.hdr.type_flags_high;
+ P->type_flags = Q.hdr.type_flags;
)

@copy_type_flags_0_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->type_flags_low = ((uw_object_hdr_t *)Q)->type_flags_low;
- P->type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P->type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P->type_flags_low = (byte)(((uw_object_hdr_t *)Q)->type_flags);
- P->type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P->type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P->type_flags_low = (char)(((uw_object_hdr_t *)Q)->type_flags);
- P->type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P->type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P->type_flags_low = (byte)(char)(((uw_object_hdr_t *)Q)->type_flags);
- P->type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P->type_flags = ((uw_object_hdr_t *)Q)->type_flags;
)

@copy_type_flags_0_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->type_flags_low = ((uw_mobile_object_t *)Q)->hdr.type_flags_low;
- P->type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P->type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P->type_flags_low = (byte)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P->type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P->type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P->type_flags_low = (char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P->type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P->type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P->type_flags_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P->type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P->type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
)

@copy_type_flags_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.type_flags_low = Q->type_flags_low;
- P.type_flags_high = Q->type_flags_high;
+ P.type_flags = Q->type_flags;
|
- P.type_flags_low = (byte)(Q->type_flags);
- P.type_flags_high = Q->type_flags_high;
+ P.type_flags = Q->type_flags;
|
- P.type_flags_low = (char)(Q->type_flags);
- P.type_flags_high = Q->type_flags_high;
+ P.type_flags = Q->type_flags;
|
- P.type_flags_low = (byte)(char)(Q->type_flags);
- P.type_flags_high = Q->type_flags_high;
+ P.type_flags = Q->type_flags;
)

@copy_type_flags_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.type_flags_low = Q.type_flags_low;
- P.type_flags_high = Q.type_flags_high;
+ P.type_flags = Q.type_flags;
|
- P.type_flags_low = (byte)(Q.type_flags);
- P.type_flags_high = Q.type_flags_high;
+ P.type_flags = Q.type_flags;
|
- P.type_flags_low = (char)(Q.type_flags);
- P.type_flags_high = Q.type_flags_high;
+ P.type_flags = Q.type_flags;
|
- P.type_flags_low = (byte)(char)(Q.type_flags);
- P.type_flags_high = Q.type_flags_high;
+ P.type_flags = Q.type_flags;
)

@copy_type_flags_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.type_flags_low = Q->hdr.type_flags_low;
- P.type_flags_high = Q->hdr.type_flags_high;
+ P.type_flags = Q->hdr.type_flags;
|
- P.type_flags_low = (byte)(Q->hdr.type_flags);
- P.type_flags_high = Q->hdr.type_flags_high;
+ P.type_flags = Q->hdr.type_flags;
|
- P.type_flags_low = (char)(Q->hdr.type_flags);
- P.type_flags_high = Q->hdr.type_flags_high;
+ P.type_flags = Q->hdr.type_flags;
|
- P.type_flags_low = (byte)(char)(Q->hdr.type_flags);
- P.type_flags_high = Q->hdr.type_flags_high;
+ P.type_flags = Q->hdr.type_flags;
)

@copy_type_flags_1_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.type_flags_low = Q.hdr.type_flags_low;
- P.type_flags_high = Q.hdr.type_flags_high;
+ P.type_flags = Q.hdr.type_flags;
|
- P.type_flags_low = (byte)(Q.hdr.type_flags);
- P.type_flags_high = Q.hdr.type_flags_high;
+ P.type_flags = Q.hdr.type_flags;
|
- P.type_flags_low = (char)(Q.hdr.type_flags);
- P.type_flags_high = Q.hdr.type_flags_high;
+ P.type_flags = Q.hdr.type_flags;
|
- P.type_flags_low = (byte)(char)(Q.hdr.type_flags);
- P.type_flags_high = Q.hdr.type_flags_high;
+ P.type_flags = Q.hdr.type_flags;
)

@copy_type_flags_1_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.type_flags_low = ((uw_object_hdr_t *)Q)->type_flags_low;
- P.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P.type_flags_low = (byte)(((uw_object_hdr_t *)Q)->type_flags);
- P.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P.type_flags_low = (char)(((uw_object_hdr_t *)Q)->type_flags);
- P.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P.type_flags_low = (byte)(char)(((uw_object_hdr_t *)Q)->type_flags);
- P.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
)

@copy_type_flags_1_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.type_flags_low = ((uw_mobile_object_t *)Q)->hdr.type_flags_low;
- P.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P.type_flags_low = (byte)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P.type_flags_low = (char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P.type_flags_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
)

@copy_type_flags_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.type_flags_low = Q->type_flags_low;
- P->hdr.type_flags_high = Q->type_flags_high;
+ P->hdr.type_flags = Q->type_flags;
|
- P->hdr.type_flags_low = (byte)(Q->type_flags);
- P->hdr.type_flags_high = Q->type_flags_high;
+ P->hdr.type_flags = Q->type_flags;
|
- P->hdr.type_flags_low = (char)(Q->type_flags);
- P->hdr.type_flags_high = Q->type_flags_high;
+ P->hdr.type_flags = Q->type_flags;
|
- P->hdr.type_flags_low = (byte)(char)(Q->type_flags);
- P->hdr.type_flags_high = Q->type_flags_high;
+ P->hdr.type_flags = Q->type_flags;
)

@copy_type_flags_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.type_flags_low = Q.type_flags_low;
- P->hdr.type_flags_high = Q.type_flags_high;
+ P->hdr.type_flags = Q.type_flags;
|
- P->hdr.type_flags_low = (byte)(Q.type_flags);
- P->hdr.type_flags_high = Q.type_flags_high;
+ P->hdr.type_flags = Q.type_flags;
|
- P->hdr.type_flags_low = (char)(Q.type_flags);
- P->hdr.type_flags_high = Q.type_flags_high;
+ P->hdr.type_flags = Q.type_flags;
|
- P->hdr.type_flags_low = (byte)(char)(Q.type_flags);
- P->hdr.type_flags_high = Q.type_flags_high;
+ P->hdr.type_flags = Q.type_flags;
)

@copy_type_flags_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.type_flags_low = Q->hdr.type_flags_low;
- P->hdr.type_flags_high = Q->hdr.type_flags_high;
+ P->hdr.type_flags = Q->hdr.type_flags;
|
- P->hdr.type_flags_low = (byte)(Q->hdr.type_flags);
- P->hdr.type_flags_high = Q->hdr.type_flags_high;
+ P->hdr.type_flags = Q->hdr.type_flags;
|
- P->hdr.type_flags_low = (char)(Q->hdr.type_flags);
- P->hdr.type_flags_high = Q->hdr.type_flags_high;
+ P->hdr.type_flags = Q->hdr.type_flags;
|
- P->hdr.type_flags_low = (byte)(char)(Q->hdr.type_flags);
- P->hdr.type_flags_high = Q->hdr.type_flags_high;
+ P->hdr.type_flags = Q->hdr.type_flags;
)

@copy_type_flags_2_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.type_flags_low = Q.hdr.type_flags_low;
- P->hdr.type_flags_high = Q.hdr.type_flags_high;
+ P->hdr.type_flags = Q.hdr.type_flags;
|
- P->hdr.type_flags_low = (byte)(Q.hdr.type_flags);
- P->hdr.type_flags_high = Q.hdr.type_flags_high;
+ P->hdr.type_flags = Q.hdr.type_flags;
|
- P->hdr.type_flags_low = (char)(Q.hdr.type_flags);
- P->hdr.type_flags_high = Q.hdr.type_flags_high;
+ P->hdr.type_flags = Q.hdr.type_flags;
|
- P->hdr.type_flags_low = (byte)(char)(Q.hdr.type_flags);
- P->hdr.type_flags_high = Q.hdr.type_flags_high;
+ P->hdr.type_flags = Q.hdr.type_flags;
)

@copy_type_flags_2_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.type_flags_low = ((uw_object_hdr_t *)Q)->type_flags_low;
- P->hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P->hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P->hdr.type_flags_low = (byte)(((uw_object_hdr_t *)Q)->type_flags);
- P->hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P->hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P->hdr.type_flags_low = (char)(((uw_object_hdr_t *)Q)->type_flags);
- P->hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P->hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P->hdr.type_flags_low = (byte)(char)(((uw_object_hdr_t *)Q)->type_flags);
- P->hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P->hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
)

@copy_type_flags_2_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.type_flags_low = ((uw_mobile_object_t *)Q)->hdr.type_flags_low;
- P->hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P->hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P->hdr.type_flags_low = (byte)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P->hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P->hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P->hdr.type_flags_low = (char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P->hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P->hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P->hdr.type_flags_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P->hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P->hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
)

@copy_type_flags_3_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.type_flags_low = Q->type_flags_low;
- P.hdr.type_flags_high = Q->type_flags_high;
+ P.hdr.type_flags = Q->type_flags;
|
- P.hdr.type_flags_low = (byte)(Q->type_flags);
- P.hdr.type_flags_high = Q->type_flags_high;
+ P.hdr.type_flags = Q->type_flags;
|
- P.hdr.type_flags_low = (char)(Q->type_flags);
- P.hdr.type_flags_high = Q->type_flags_high;
+ P.hdr.type_flags = Q->type_flags;
|
- P.hdr.type_flags_low = (byte)(char)(Q->type_flags);
- P.hdr.type_flags_high = Q->type_flags_high;
+ P.hdr.type_flags = Q->type_flags;
)

@copy_type_flags_3_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.type_flags_low = Q.type_flags_low;
- P.hdr.type_flags_high = Q.type_flags_high;
+ P.hdr.type_flags = Q.type_flags;
|
- P.hdr.type_flags_low = (byte)(Q.type_flags);
- P.hdr.type_flags_high = Q.type_flags_high;
+ P.hdr.type_flags = Q.type_flags;
|
- P.hdr.type_flags_low = (char)(Q.type_flags);
- P.hdr.type_flags_high = Q.type_flags_high;
+ P.hdr.type_flags = Q.type_flags;
|
- P.hdr.type_flags_low = (byte)(char)(Q.type_flags);
- P.hdr.type_flags_high = Q.type_flags_high;
+ P.hdr.type_flags = Q.type_flags;
)

@copy_type_flags_3_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.type_flags_low = Q->hdr.type_flags_low;
- P.hdr.type_flags_high = Q->hdr.type_flags_high;
+ P.hdr.type_flags = Q->hdr.type_flags;
|
- P.hdr.type_flags_low = (byte)(Q->hdr.type_flags);
- P.hdr.type_flags_high = Q->hdr.type_flags_high;
+ P.hdr.type_flags = Q->hdr.type_flags;
|
- P.hdr.type_flags_low = (char)(Q->hdr.type_flags);
- P.hdr.type_flags_high = Q->hdr.type_flags_high;
+ P.hdr.type_flags = Q->hdr.type_flags;
|
- P.hdr.type_flags_low = (byte)(char)(Q->hdr.type_flags);
- P.hdr.type_flags_high = Q->hdr.type_flags_high;
+ P.hdr.type_flags = Q->hdr.type_flags;
)

@copy_type_flags_3_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.type_flags_low = Q.hdr.type_flags_low;
- P.hdr.type_flags_high = Q.hdr.type_flags_high;
+ P.hdr.type_flags = Q.hdr.type_flags;
|
- P.hdr.type_flags_low = (byte)(Q.hdr.type_flags);
- P.hdr.type_flags_high = Q.hdr.type_flags_high;
+ P.hdr.type_flags = Q.hdr.type_flags;
|
- P.hdr.type_flags_low = (char)(Q.hdr.type_flags);
- P.hdr.type_flags_high = Q.hdr.type_flags_high;
+ P.hdr.type_flags = Q.hdr.type_flags;
|
- P.hdr.type_flags_low = (byte)(char)(Q.hdr.type_flags);
- P.hdr.type_flags_high = Q.hdr.type_flags_high;
+ P.hdr.type_flags = Q.hdr.type_flags;
)

@copy_type_flags_3_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.type_flags_low = ((uw_object_hdr_t *)Q)->type_flags_low;
- P.hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P.hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P.hdr.type_flags_low = (byte)(((uw_object_hdr_t *)Q)->type_flags);
- P.hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P.hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P.hdr.type_flags_low = (char)(((uw_object_hdr_t *)Q)->type_flags);
- P.hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P.hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- P.hdr.type_flags_low = (byte)(char)(((uw_object_hdr_t *)Q)->type_flags);
- P.hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ P.hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
)

@copy_type_flags_3_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.type_flags_low = ((uw_mobile_object_t *)Q)->hdr.type_flags_low;
- P.hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P.hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P.hdr.type_flags_low = (byte)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P.hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P.hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P.hdr.type_flags_low = (char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P.hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P.hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- P.hdr.type_flags_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- P.hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ P.hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
)

@copy_type_flags_4_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->type_flags_low = Q->type_flags_low;
- ((uw_object_hdr_t *)P)->type_flags_high = Q->type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q->type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(Q->type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q->type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q->type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(Q->type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q->type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q->type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(Q->type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q->type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q->type_flags;
)

@copy_type_flags_4_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->type_flags_low = Q.type_flags_low;
- ((uw_object_hdr_t *)P)->type_flags_high = Q.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(Q.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(Q.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(Q.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q.type_flags;
)

@copy_type_flags_4_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->type_flags_low = Q->hdr.type_flags_low;
- ((uw_object_hdr_t *)P)->type_flags_high = Q->hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q->hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(Q->hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q->hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q->hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(Q->hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q->hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q->hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(Q->hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q->hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q->hdr.type_flags;
)

@copy_type_flags_4_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->type_flags_low = Q.hdr.type_flags_low;
- ((uw_object_hdr_t *)P)->type_flags_high = Q.hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q.hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(Q.hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q.hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q.hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(Q.hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q.hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q.hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(Q.hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = Q.hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = Q.hdr.type_flags;
)

@copy_type_flags_4_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->type_flags_low = ((uw_object_hdr_t *)Q)->type_flags_low;
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(((uw_object_hdr_t *)Q)->type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(((uw_object_hdr_t *)Q)->type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(((uw_object_hdr_t *)Q)->type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)Q)->type_flags;
)

@copy_type_flags_4_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->type_flags_low = ((uw_mobile_object_t *)Q)->hdr.type_flags_low;
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ ((uw_object_hdr_t *)P)->type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
)

@copy_type_flags_5_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = Q->type_flags_low;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q->type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q->type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(Q->type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q->type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q->type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(Q->type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q->type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q->type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(Q->type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q->type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q->type_flags;
)

@copy_type_flags_5_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = Q.type_flags_low;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(Q.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(Q.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(Q.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q.type_flags;
)

@copy_type_flags_5_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = Q->hdr.type_flags_low;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q->hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(Q->hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q->hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(Q->hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q->hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(Q->hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q->hdr.type_flags;
)

@copy_type_flags_5_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = Q.hdr.type_flags_low;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q.hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q.hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(Q.hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q.hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q.hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(Q.hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q.hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q.hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(Q.hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = Q.hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = Q.hdr.type_flags;
)

@copy_type_flags_5_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = ((uw_object_hdr_t *)Q)->type_flags_low;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(((uw_object_hdr_t *)Q)->type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(((uw_object_hdr_t *)Q)->type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(((uw_object_hdr_t *)Q)->type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_object_hdr_t *)Q)->type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_object_hdr_t *)Q)->type_flags;
)

@copy_type_flags_5_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = ((uw_mobile_object_t *)Q)->hdr.type_flags_low;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.type_flags);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)Q)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)Q)->hdr.type_flags;
)

@copy_position_word_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->position_word_low = Q->position_word_low;
- P->position_word_high = Q->position_word_high;
+ P->position_word = Q->position_word;
|
- P->position_word_low = (byte)(Q->position_word);
- P->position_word_high = Q->position_word_high;
+ P->position_word = Q->position_word;
|
- P->position_word_low = (char)(Q->position_word);
- P->position_word_high = Q->position_word_high;
+ P->position_word = Q->position_word;
|
- P->position_word_low = (byte)(char)(Q->position_word);
- P->position_word_high = Q->position_word_high;
+ P->position_word = Q->position_word;
)

@copy_position_word_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->position_word_low = Q.position_word_low;
- P->position_word_high = Q.position_word_high;
+ P->position_word = Q.position_word;
|
- P->position_word_low = (byte)(Q.position_word);
- P->position_word_high = Q.position_word_high;
+ P->position_word = Q.position_word;
|
- P->position_word_low = (char)(Q.position_word);
- P->position_word_high = Q.position_word_high;
+ P->position_word = Q.position_word;
|
- P->position_word_low = (byte)(char)(Q.position_word);
- P->position_word_high = Q.position_word_high;
+ P->position_word = Q.position_word;
)

@copy_position_word_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->position_word_low = Q->hdr.position_word_low;
- P->position_word_high = Q->hdr.position_word_high;
+ P->position_word = Q->hdr.position_word;
|
- P->position_word_low = (byte)(Q->hdr.position_word);
- P->position_word_high = Q->hdr.position_word_high;
+ P->position_word = Q->hdr.position_word;
|
- P->position_word_low = (char)(Q->hdr.position_word);
- P->position_word_high = Q->hdr.position_word_high;
+ P->position_word = Q->hdr.position_word;
|
- P->position_word_low = (byte)(char)(Q->hdr.position_word);
- P->position_word_high = Q->hdr.position_word_high;
+ P->position_word = Q->hdr.position_word;
)

@copy_position_word_0_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->position_word_low = Q.hdr.position_word_low;
- P->position_word_high = Q.hdr.position_word_high;
+ P->position_word = Q.hdr.position_word;
|
- P->position_word_low = (byte)(Q.hdr.position_word);
- P->position_word_high = Q.hdr.position_word_high;
+ P->position_word = Q.hdr.position_word;
|
- P->position_word_low = (char)(Q.hdr.position_word);
- P->position_word_high = Q.hdr.position_word_high;
+ P->position_word = Q.hdr.position_word;
|
- P->position_word_low = (byte)(char)(Q.hdr.position_word);
- P->position_word_high = Q.hdr.position_word_high;
+ P->position_word = Q.hdr.position_word;
)

@copy_position_word_0_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->position_word_low = ((uw_object_hdr_t *)Q)->position_word_low;
- P->position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P->position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P->position_word_low = (byte)(((uw_object_hdr_t *)Q)->position_word);
- P->position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P->position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P->position_word_low = (char)(((uw_object_hdr_t *)Q)->position_word);
- P->position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P->position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P->position_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->position_word);
- P->position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P->position_word = ((uw_object_hdr_t *)Q)->position_word;
)

@copy_position_word_0_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->position_word_low = ((uw_mobile_object_t *)Q)->hdr.position_word_low;
- P->position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P->position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P->position_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P->position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P->position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P->position_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P->position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P->position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P->position_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P->position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P->position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
)

@copy_position_word_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.position_word_low = Q->position_word_low;
- P.position_word_high = Q->position_word_high;
+ P.position_word = Q->position_word;
|
- P.position_word_low = (byte)(Q->position_word);
- P.position_word_high = Q->position_word_high;
+ P.position_word = Q->position_word;
|
- P.position_word_low = (char)(Q->position_word);
- P.position_word_high = Q->position_word_high;
+ P.position_word = Q->position_word;
|
- P.position_word_low = (byte)(char)(Q->position_word);
- P.position_word_high = Q->position_word_high;
+ P.position_word = Q->position_word;
)

@copy_position_word_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.position_word_low = Q.position_word_low;
- P.position_word_high = Q.position_word_high;
+ P.position_word = Q.position_word;
|
- P.position_word_low = (byte)(Q.position_word);
- P.position_word_high = Q.position_word_high;
+ P.position_word = Q.position_word;
|
- P.position_word_low = (char)(Q.position_word);
- P.position_word_high = Q.position_word_high;
+ P.position_word = Q.position_word;
|
- P.position_word_low = (byte)(char)(Q.position_word);
- P.position_word_high = Q.position_word_high;
+ P.position_word = Q.position_word;
)

@copy_position_word_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.position_word_low = Q->hdr.position_word_low;
- P.position_word_high = Q->hdr.position_word_high;
+ P.position_word = Q->hdr.position_word;
|
- P.position_word_low = (byte)(Q->hdr.position_word);
- P.position_word_high = Q->hdr.position_word_high;
+ P.position_word = Q->hdr.position_word;
|
- P.position_word_low = (char)(Q->hdr.position_word);
- P.position_word_high = Q->hdr.position_word_high;
+ P.position_word = Q->hdr.position_word;
|
- P.position_word_low = (byte)(char)(Q->hdr.position_word);
- P.position_word_high = Q->hdr.position_word_high;
+ P.position_word = Q->hdr.position_word;
)

@copy_position_word_1_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.position_word_low = Q.hdr.position_word_low;
- P.position_word_high = Q.hdr.position_word_high;
+ P.position_word = Q.hdr.position_word;
|
- P.position_word_low = (byte)(Q.hdr.position_word);
- P.position_word_high = Q.hdr.position_word_high;
+ P.position_word = Q.hdr.position_word;
|
- P.position_word_low = (char)(Q.hdr.position_word);
- P.position_word_high = Q.hdr.position_word_high;
+ P.position_word = Q.hdr.position_word;
|
- P.position_word_low = (byte)(char)(Q.hdr.position_word);
- P.position_word_high = Q.hdr.position_word_high;
+ P.position_word = Q.hdr.position_word;
)

@copy_position_word_1_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.position_word_low = ((uw_object_hdr_t *)Q)->position_word_low;
- P.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P.position_word_low = (byte)(((uw_object_hdr_t *)Q)->position_word);
- P.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P.position_word_low = (char)(((uw_object_hdr_t *)Q)->position_word);
- P.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P.position_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->position_word);
- P.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P.position_word = ((uw_object_hdr_t *)Q)->position_word;
)

@copy_position_word_1_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.position_word_low = ((uw_mobile_object_t *)Q)->hdr.position_word_low;
- P.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P.position_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P.position_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P.position_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
)

@copy_position_word_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.position_word_low = Q->position_word_low;
- P->hdr.position_word_high = Q->position_word_high;
+ P->hdr.position_word = Q->position_word;
|
- P->hdr.position_word_low = (byte)(Q->position_word);
- P->hdr.position_word_high = Q->position_word_high;
+ P->hdr.position_word = Q->position_word;
|
- P->hdr.position_word_low = (char)(Q->position_word);
- P->hdr.position_word_high = Q->position_word_high;
+ P->hdr.position_word = Q->position_word;
|
- P->hdr.position_word_low = (byte)(char)(Q->position_word);
- P->hdr.position_word_high = Q->position_word_high;
+ P->hdr.position_word = Q->position_word;
)

@copy_position_word_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.position_word_low = Q.position_word_low;
- P->hdr.position_word_high = Q.position_word_high;
+ P->hdr.position_word = Q.position_word;
|
- P->hdr.position_word_low = (byte)(Q.position_word);
- P->hdr.position_word_high = Q.position_word_high;
+ P->hdr.position_word = Q.position_word;
|
- P->hdr.position_word_low = (char)(Q.position_word);
- P->hdr.position_word_high = Q.position_word_high;
+ P->hdr.position_word = Q.position_word;
|
- P->hdr.position_word_low = (byte)(char)(Q.position_word);
- P->hdr.position_word_high = Q.position_word_high;
+ P->hdr.position_word = Q.position_word;
)

@copy_position_word_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.position_word_low = Q->hdr.position_word_low;
- P->hdr.position_word_high = Q->hdr.position_word_high;
+ P->hdr.position_word = Q->hdr.position_word;
|
- P->hdr.position_word_low = (byte)(Q->hdr.position_word);
- P->hdr.position_word_high = Q->hdr.position_word_high;
+ P->hdr.position_word = Q->hdr.position_word;
|
- P->hdr.position_word_low = (char)(Q->hdr.position_word);
- P->hdr.position_word_high = Q->hdr.position_word_high;
+ P->hdr.position_word = Q->hdr.position_word;
|
- P->hdr.position_word_low = (byte)(char)(Q->hdr.position_word);
- P->hdr.position_word_high = Q->hdr.position_word_high;
+ P->hdr.position_word = Q->hdr.position_word;
)

@copy_position_word_2_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.position_word_low = Q.hdr.position_word_low;
- P->hdr.position_word_high = Q.hdr.position_word_high;
+ P->hdr.position_word = Q.hdr.position_word;
|
- P->hdr.position_word_low = (byte)(Q.hdr.position_word);
- P->hdr.position_word_high = Q.hdr.position_word_high;
+ P->hdr.position_word = Q.hdr.position_word;
|
- P->hdr.position_word_low = (char)(Q.hdr.position_word);
- P->hdr.position_word_high = Q.hdr.position_word_high;
+ P->hdr.position_word = Q.hdr.position_word;
|
- P->hdr.position_word_low = (byte)(char)(Q.hdr.position_word);
- P->hdr.position_word_high = Q.hdr.position_word_high;
+ P->hdr.position_word = Q.hdr.position_word;
)

@copy_position_word_2_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.position_word_low = ((uw_object_hdr_t *)Q)->position_word_low;
- P->hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P->hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P->hdr.position_word_low = (byte)(((uw_object_hdr_t *)Q)->position_word);
- P->hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P->hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P->hdr.position_word_low = (char)(((uw_object_hdr_t *)Q)->position_word);
- P->hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P->hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P->hdr.position_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->position_word);
- P->hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P->hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
)

@copy_position_word_2_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.position_word_low = ((uw_mobile_object_t *)Q)->hdr.position_word_low;
- P->hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P->hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P->hdr.position_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P->hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P->hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P->hdr.position_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P->hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P->hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P->hdr.position_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P->hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P->hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
)

@copy_position_word_3_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.position_word_low = Q->position_word_low;
- P.hdr.position_word_high = Q->position_word_high;
+ P.hdr.position_word = Q->position_word;
|
- P.hdr.position_word_low = (byte)(Q->position_word);
- P.hdr.position_word_high = Q->position_word_high;
+ P.hdr.position_word = Q->position_word;
|
- P.hdr.position_word_low = (char)(Q->position_word);
- P.hdr.position_word_high = Q->position_word_high;
+ P.hdr.position_word = Q->position_word;
|
- P.hdr.position_word_low = (byte)(char)(Q->position_word);
- P.hdr.position_word_high = Q->position_word_high;
+ P.hdr.position_word = Q->position_word;
)

@copy_position_word_3_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.position_word_low = Q.position_word_low;
- P.hdr.position_word_high = Q.position_word_high;
+ P.hdr.position_word = Q.position_word;
|
- P.hdr.position_word_low = (byte)(Q.position_word);
- P.hdr.position_word_high = Q.position_word_high;
+ P.hdr.position_word = Q.position_word;
|
- P.hdr.position_word_low = (char)(Q.position_word);
- P.hdr.position_word_high = Q.position_word_high;
+ P.hdr.position_word = Q.position_word;
|
- P.hdr.position_word_low = (byte)(char)(Q.position_word);
- P.hdr.position_word_high = Q.position_word_high;
+ P.hdr.position_word = Q.position_word;
)

@copy_position_word_3_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.position_word_low = Q->hdr.position_word_low;
- P.hdr.position_word_high = Q->hdr.position_word_high;
+ P.hdr.position_word = Q->hdr.position_word;
|
- P.hdr.position_word_low = (byte)(Q->hdr.position_word);
- P.hdr.position_word_high = Q->hdr.position_word_high;
+ P.hdr.position_word = Q->hdr.position_word;
|
- P.hdr.position_word_low = (char)(Q->hdr.position_word);
- P.hdr.position_word_high = Q->hdr.position_word_high;
+ P.hdr.position_word = Q->hdr.position_word;
|
- P.hdr.position_word_low = (byte)(char)(Q->hdr.position_word);
- P.hdr.position_word_high = Q->hdr.position_word_high;
+ P.hdr.position_word = Q->hdr.position_word;
)

@copy_position_word_3_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.position_word_low = Q.hdr.position_word_low;
- P.hdr.position_word_high = Q.hdr.position_word_high;
+ P.hdr.position_word = Q.hdr.position_word;
|
- P.hdr.position_word_low = (byte)(Q.hdr.position_word);
- P.hdr.position_word_high = Q.hdr.position_word_high;
+ P.hdr.position_word = Q.hdr.position_word;
|
- P.hdr.position_word_low = (char)(Q.hdr.position_word);
- P.hdr.position_word_high = Q.hdr.position_word_high;
+ P.hdr.position_word = Q.hdr.position_word;
|
- P.hdr.position_word_low = (byte)(char)(Q.hdr.position_word);
- P.hdr.position_word_high = Q.hdr.position_word_high;
+ P.hdr.position_word = Q.hdr.position_word;
)

@copy_position_word_3_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.position_word_low = ((uw_object_hdr_t *)Q)->position_word_low;
- P.hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P.hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P.hdr.position_word_low = (byte)(((uw_object_hdr_t *)Q)->position_word);
- P.hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P.hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P.hdr.position_word_low = (char)(((uw_object_hdr_t *)Q)->position_word);
- P.hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P.hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- P.hdr.position_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->position_word);
- P.hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ P.hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
)

@copy_position_word_3_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.position_word_low = ((uw_mobile_object_t *)Q)->hdr.position_word_low;
- P.hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P.hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P.hdr.position_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P.hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P.hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P.hdr.position_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P.hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P.hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- P.hdr.position_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- P.hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ P.hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
)

@copy_position_word_4_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->position_word_low = Q->position_word_low;
- ((uw_object_hdr_t *)P)->position_word_high = Q->position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q->position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(Q->position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q->position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q->position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(Q->position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q->position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q->position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(Q->position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q->position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q->position_word;
)

@copy_position_word_4_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->position_word_low = Q.position_word_low;
- ((uw_object_hdr_t *)P)->position_word_high = Q.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(Q.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(Q.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(Q.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q.position_word;
)

@copy_position_word_4_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->position_word_low = Q->hdr.position_word_low;
- ((uw_object_hdr_t *)P)->position_word_high = Q->hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q->hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(Q->hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q->hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q->hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(Q->hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q->hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q->hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(Q->hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q->hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q->hdr.position_word;
)

@copy_position_word_4_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->position_word_low = Q.hdr.position_word_low;
- ((uw_object_hdr_t *)P)->position_word_high = Q.hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q.hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(Q.hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q.hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q.hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(Q.hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q.hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q.hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(Q.hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = Q.hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = Q.hdr.position_word;
)

@copy_position_word_4_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->position_word_low = ((uw_object_hdr_t *)Q)->position_word_low;
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(((uw_object_hdr_t *)Q)->position_word);
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(((uw_object_hdr_t *)Q)->position_word);
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->position_word);
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)Q)->position_word;
)

@copy_position_word_4_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->position_word_low = ((uw_mobile_object_t *)Q)->hdr.position_word_low;
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ ((uw_object_hdr_t *)P)->position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
)

@copy_position_word_5_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.position_word_low = Q->position_word_low;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q->position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q->position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(Q->position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q->position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q->position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(Q->position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q->position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q->position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(Q->position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q->position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q->position_word;
)

@copy_position_word_5_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.position_word_low = Q.position_word_low;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(Q.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(Q.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(Q.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q.position_word;
)

@copy_position_word_5_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.position_word_low = Q->hdr.position_word_low;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q->hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(Q->hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q->hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(Q->hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q->hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(Q->hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q->hdr.position_word;
)

@copy_position_word_5_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.position_word_low = Q.hdr.position_word_low;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q.hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q.hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(Q.hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q.hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q.hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(Q.hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q.hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q.hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(Q.hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = Q.hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = Q.hdr.position_word;
)

@copy_position_word_5_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.position_word_low = ((uw_object_hdr_t *)Q)->position_word_low;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(((uw_object_hdr_t *)Q)->position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(((uw_object_hdr_t *)Q)->position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_object_hdr_t *)Q)->position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_object_hdr_t *)Q)->position_word;
)

@copy_position_word_5_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.position_word_low = ((uw_mobile_object_t *)Q)->hdr.position_word_low;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.position_word);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)Q)->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)Q)->hdr.position_word;
)

@copy_chain_word_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->chain_word_low = Q->chain_word_low;
- P->chain_word_high = Q->chain_word_high;
+ P->chain_word = Q->chain_word;
|
- P->chain_word_low = (byte)(Q->chain_word);
- P->chain_word_high = Q->chain_word_high;
+ P->chain_word = Q->chain_word;
|
- P->chain_word_low = (char)(Q->chain_word);
- P->chain_word_high = Q->chain_word_high;
+ P->chain_word = Q->chain_word;
|
- P->chain_word_low = (byte)(char)(Q->chain_word);
- P->chain_word_high = Q->chain_word_high;
+ P->chain_word = Q->chain_word;
)

@copy_chain_word_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->chain_word_low = Q.chain_word_low;
- P->chain_word_high = Q.chain_word_high;
+ P->chain_word = Q.chain_word;
|
- P->chain_word_low = (byte)(Q.chain_word);
- P->chain_word_high = Q.chain_word_high;
+ P->chain_word = Q.chain_word;
|
- P->chain_word_low = (char)(Q.chain_word);
- P->chain_word_high = Q.chain_word_high;
+ P->chain_word = Q.chain_word;
|
- P->chain_word_low = (byte)(char)(Q.chain_word);
- P->chain_word_high = Q.chain_word_high;
+ P->chain_word = Q.chain_word;
)

@copy_chain_word_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->chain_word_low = Q->hdr.chain_word_low;
- P->chain_word_high = Q->hdr.chain_word_high;
+ P->chain_word = Q->hdr.chain_word;
|
- P->chain_word_low = (byte)(Q->hdr.chain_word);
- P->chain_word_high = Q->hdr.chain_word_high;
+ P->chain_word = Q->hdr.chain_word;
|
- P->chain_word_low = (char)(Q->hdr.chain_word);
- P->chain_word_high = Q->hdr.chain_word_high;
+ P->chain_word = Q->hdr.chain_word;
|
- P->chain_word_low = (byte)(char)(Q->hdr.chain_word);
- P->chain_word_high = Q->hdr.chain_word_high;
+ P->chain_word = Q->hdr.chain_word;
)

@copy_chain_word_0_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->chain_word_low = Q.hdr.chain_word_low;
- P->chain_word_high = Q.hdr.chain_word_high;
+ P->chain_word = Q.hdr.chain_word;
|
- P->chain_word_low = (byte)(Q.hdr.chain_word);
- P->chain_word_high = Q.hdr.chain_word_high;
+ P->chain_word = Q.hdr.chain_word;
|
- P->chain_word_low = (char)(Q.hdr.chain_word);
- P->chain_word_high = Q.hdr.chain_word_high;
+ P->chain_word = Q.hdr.chain_word;
|
- P->chain_word_low = (byte)(char)(Q.hdr.chain_word);
- P->chain_word_high = Q.hdr.chain_word_high;
+ P->chain_word = Q.hdr.chain_word;
)

@copy_chain_word_0_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->chain_word_low = ((uw_object_hdr_t *)Q)->chain_word_low;
- P->chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P->chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P->chain_word_low = (byte)(((uw_object_hdr_t *)Q)->chain_word);
- P->chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P->chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P->chain_word_low = (char)(((uw_object_hdr_t *)Q)->chain_word);
- P->chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P->chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P->chain_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->chain_word);
- P->chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P->chain_word = ((uw_object_hdr_t *)Q)->chain_word;
)

@copy_chain_word_0_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->chain_word_low = ((uw_mobile_object_t *)Q)->hdr.chain_word_low;
- P->chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P->chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P->chain_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P->chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P->chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P->chain_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P->chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P->chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P->chain_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P->chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P->chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
)

@copy_chain_word_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.chain_word_low = Q->chain_word_low;
- P.chain_word_high = Q->chain_word_high;
+ P.chain_word = Q->chain_word;
|
- P.chain_word_low = (byte)(Q->chain_word);
- P.chain_word_high = Q->chain_word_high;
+ P.chain_word = Q->chain_word;
|
- P.chain_word_low = (char)(Q->chain_word);
- P.chain_word_high = Q->chain_word_high;
+ P.chain_word = Q->chain_word;
|
- P.chain_word_low = (byte)(char)(Q->chain_word);
- P.chain_word_high = Q->chain_word_high;
+ P.chain_word = Q->chain_word;
)

@copy_chain_word_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.chain_word_low = Q.chain_word_low;
- P.chain_word_high = Q.chain_word_high;
+ P.chain_word = Q.chain_word;
|
- P.chain_word_low = (byte)(Q.chain_word);
- P.chain_word_high = Q.chain_word_high;
+ P.chain_word = Q.chain_word;
|
- P.chain_word_low = (char)(Q.chain_word);
- P.chain_word_high = Q.chain_word_high;
+ P.chain_word = Q.chain_word;
|
- P.chain_word_low = (byte)(char)(Q.chain_word);
- P.chain_word_high = Q.chain_word_high;
+ P.chain_word = Q.chain_word;
)

@copy_chain_word_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.chain_word_low = Q->hdr.chain_word_low;
- P.chain_word_high = Q->hdr.chain_word_high;
+ P.chain_word = Q->hdr.chain_word;
|
- P.chain_word_low = (byte)(Q->hdr.chain_word);
- P.chain_word_high = Q->hdr.chain_word_high;
+ P.chain_word = Q->hdr.chain_word;
|
- P.chain_word_low = (char)(Q->hdr.chain_word);
- P.chain_word_high = Q->hdr.chain_word_high;
+ P.chain_word = Q->hdr.chain_word;
|
- P.chain_word_low = (byte)(char)(Q->hdr.chain_word);
- P.chain_word_high = Q->hdr.chain_word_high;
+ P.chain_word = Q->hdr.chain_word;
)

@copy_chain_word_1_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.chain_word_low = Q.hdr.chain_word_low;
- P.chain_word_high = Q.hdr.chain_word_high;
+ P.chain_word = Q.hdr.chain_word;
|
- P.chain_word_low = (byte)(Q.hdr.chain_word);
- P.chain_word_high = Q.hdr.chain_word_high;
+ P.chain_word = Q.hdr.chain_word;
|
- P.chain_word_low = (char)(Q.hdr.chain_word);
- P.chain_word_high = Q.hdr.chain_word_high;
+ P.chain_word = Q.hdr.chain_word;
|
- P.chain_word_low = (byte)(char)(Q.hdr.chain_word);
- P.chain_word_high = Q.hdr.chain_word_high;
+ P.chain_word = Q.hdr.chain_word;
)

@copy_chain_word_1_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.chain_word_low = ((uw_object_hdr_t *)Q)->chain_word_low;
- P.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P.chain_word_low = (byte)(((uw_object_hdr_t *)Q)->chain_word);
- P.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P.chain_word_low = (char)(((uw_object_hdr_t *)Q)->chain_word);
- P.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P.chain_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->chain_word);
- P.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
)

@copy_chain_word_1_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.chain_word_low = ((uw_mobile_object_t *)Q)->hdr.chain_word_low;
- P.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P.chain_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P.chain_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P.chain_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
)

@copy_chain_word_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.chain_word_low = Q->chain_word_low;
- P->hdr.chain_word_high = Q->chain_word_high;
+ P->hdr.chain_word = Q->chain_word;
|
- P->hdr.chain_word_low = (byte)(Q->chain_word);
- P->hdr.chain_word_high = Q->chain_word_high;
+ P->hdr.chain_word = Q->chain_word;
|
- P->hdr.chain_word_low = (char)(Q->chain_word);
- P->hdr.chain_word_high = Q->chain_word_high;
+ P->hdr.chain_word = Q->chain_word;
|
- P->hdr.chain_word_low = (byte)(char)(Q->chain_word);
- P->hdr.chain_word_high = Q->chain_word_high;
+ P->hdr.chain_word = Q->chain_word;
)

@copy_chain_word_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.chain_word_low = Q.chain_word_low;
- P->hdr.chain_word_high = Q.chain_word_high;
+ P->hdr.chain_word = Q.chain_word;
|
- P->hdr.chain_word_low = (byte)(Q.chain_word);
- P->hdr.chain_word_high = Q.chain_word_high;
+ P->hdr.chain_word = Q.chain_word;
|
- P->hdr.chain_word_low = (char)(Q.chain_word);
- P->hdr.chain_word_high = Q.chain_word_high;
+ P->hdr.chain_word = Q.chain_word;
|
- P->hdr.chain_word_low = (byte)(char)(Q.chain_word);
- P->hdr.chain_word_high = Q.chain_word_high;
+ P->hdr.chain_word = Q.chain_word;
)

@copy_chain_word_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.chain_word_low = Q->hdr.chain_word_low;
- P->hdr.chain_word_high = Q->hdr.chain_word_high;
+ P->hdr.chain_word = Q->hdr.chain_word;
|
- P->hdr.chain_word_low = (byte)(Q->hdr.chain_word);
- P->hdr.chain_word_high = Q->hdr.chain_word_high;
+ P->hdr.chain_word = Q->hdr.chain_word;
|
- P->hdr.chain_word_low = (char)(Q->hdr.chain_word);
- P->hdr.chain_word_high = Q->hdr.chain_word_high;
+ P->hdr.chain_word = Q->hdr.chain_word;
|
- P->hdr.chain_word_low = (byte)(char)(Q->hdr.chain_word);
- P->hdr.chain_word_high = Q->hdr.chain_word_high;
+ P->hdr.chain_word = Q->hdr.chain_word;
)

@copy_chain_word_2_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.chain_word_low = Q.hdr.chain_word_low;
- P->hdr.chain_word_high = Q.hdr.chain_word_high;
+ P->hdr.chain_word = Q.hdr.chain_word;
|
- P->hdr.chain_word_low = (byte)(Q.hdr.chain_word);
- P->hdr.chain_word_high = Q.hdr.chain_word_high;
+ P->hdr.chain_word = Q.hdr.chain_word;
|
- P->hdr.chain_word_low = (char)(Q.hdr.chain_word);
- P->hdr.chain_word_high = Q.hdr.chain_word_high;
+ P->hdr.chain_word = Q.hdr.chain_word;
|
- P->hdr.chain_word_low = (byte)(char)(Q.hdr.chain_word);
- P->hdr.chain_word_high = Q.hdr.chain_word_high;
+ P->hdr.chain_word = Q.hdr.chain_word;
)

@copy_chain_word_2_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.chain_word_low = ((uw_object_hdr_t *)Q)->chain_word_low;
- P->hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P->hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P->hdr.chain_word_low = (byte)(((uw_object_hdr_t *)Q)->chain_word);
- P->hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P->hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P->hdr.chain_word_low = (char)(((uw_object_hdr_t *)Q)->chain_word);
- P->hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P->hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P->hdr.chain_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->chain_word);
- P->hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P->hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
)

@copy_chain_word_2_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.chain_word_low = ((uw_mobile_object_t *)Q)->hdr.chain_word_low;
- P->hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P->hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P->hdr.chain_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P->hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P->hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P->hdr.chain_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P->hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P->hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P->hdr.chain_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P->hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P->hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
)

@copy_chain_word_3_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.chain_word_low = Q->chain_word_low;
- P.hdr.chain_word_high = Q->chain_word_high;
+ P.hdr.chain_word = Q->chain_word;
|
- P.hdr.chain_word_low = (byte)(Q->chain_word);
- P.hdr.chain_word_high = Q->chain_word_high;
+ P.hdr.chain_word = Q->chain_word;
|
- P.hdr.chain_word_low = (char)(Q->chain_word);
- P.hdr.chain_word_high = Q->chain_word_high;
+ P.hdr.chain_word = Q->chain_word;
|
- P.hdr.chain_word_low = (byte)(char)(Q->chain_word);
- P.hdr.chain_word_high = Q->chain_word_high;
+ P.hdr.chain_word = Q->chain_word;
)

@copy_chain_word_3_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.chain_word_low = Q.chain_word_low;
- P.hdr.chain_word_high = Q.chain_word_high;
+ P.hdr.chain_word = Q.chain_word;
|
- P.hdr.chain_word_low = (byte)(Q.chain_word);
- P.hdr.chain_word_high = Q.chain_word_high;
+ P.hdr.chain_word = Q.chain_word;
|
- P.hdr.chain_word_low = (char)(Q.chain_word);
- P.hdr.chain_word_high = Q.chain_word_high;
+ P.hdr.chain_word = Q.chain_word;
|
- P.hdr.chain_word_low = (byte)(char)(Q.chain_word);
- P.hdr.chain_word_high = Q.chain_word_high;
+ P.hdr.chain_word = Q.chain_word;
)

@copy_chain_word_3_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.chain_word_low = Q->hdr.chain_word_low;
- P.hdr.chain_word_high = Q->hdr.chain_word_high;
+ P.hdr.chain_word = Q->hdr.chain_word;
|
- P.hdr.chain_word_low = (byte)(Q->hdr.chain_word);
- P.hdr.chain_word_high = Q->hdr.chain_word_high;
+ P.hdr.chain_word = Q->hdr.chain_word;
|
- P.hdr.chain_word_low = (char)(Q->hdr.chain_word);
- P.hdr.chain_word_high = Q->hdr.chain_word_high;
+ P.hdr.chain_word = Q->hdr.chain_word;
|
- P.hdr.chain_word_low = (byte)(char)(Q->hdr.chain_word);
- P.hdr.chain_word_high = Q->hdr.chain_word_high;
+ P.hdr.chain_word = Q->hdr.chain_word;
)

@copy_chain_word_3_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.chain_word_low = Q.hdr.chain_word_low;
- P.hdr.chain_word_high = Q.hdr.chain_word_high;
+ P.hdr.chain_word = Q.hdr.chain_word;
|
- P.hdr.chain_word_low = (byte)(Q.hdr.chain_word);
- P.hdr.chain_word_high = Q.hdr.chain_word_high;
+ P.hdr.chain_word = Q.hdr.chain_word;
|
- P.hdr.chain_word_low = (char)(Q.hdr.chain_word);
- P.hdr.chain_word_high = Q.hdr.chain_word_high;
+ P.hdr.chain_word = Q.hdr.chain_word;
|
- P.hdr.chain_word_low = (byte)(char)(Q.hdr.chain_word);
- P.hdr.chain_word_high = Q.hdr.chain_word_high;
+ P.hdr.chain_word = Q.hdr.chain_word;
)

@copy_chain_word_3_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.chain_word_low = ((uw_object_hdr_t *)Q)->chain_word_low;
- P.hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P.hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P.hdr.chain_word_low = (byte)(((uw_object_hdr_t *)Q)->chain_word);
- P.hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P.hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P.hdr.chain_word_low = (char)(((uw_object_hdr_t *)Q)->chain_word);
- P.hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P.hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- P.hdr.chain_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->chain_word);
- P.hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ P.hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
)

@copy_chain_word_3_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.chain_word_low = ((uw_mobile_object_t *)Q)->hdr.chain_word_low;
- P.hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P.hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P.hdr.chain_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P.hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P.hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P.hdr.chain_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P.hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P.hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- P.hdr.chain_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- P.hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ P.hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
)

@copy_chain_word_4_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->chain_word_low = Q->chain_word_low;
- ((uw_object_hdr_t *)P)->chain_word_high = Q->chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q->chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(Q->chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q->chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q->chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(Q->chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q->chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q->chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(Q->chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q->chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q->chain_word;
)

@copy_chain_word_4_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->chain_word_low = Q.chain_word_low;
- ((uw_object_hdr_t *)P)->chain_word_high = Q.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(Q.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(Q.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(Q.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q.chain_word;
)

@copy_chain_word_4_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->chain_word_low = Q->hdr.chain_word_low;
- ((uw_object_hdr_t *)P)->chain_word_high = Q->hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q->hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(Q->hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q->hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q->hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(Q->hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q->hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q->hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(Q->hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q->hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q->hdr.chain_word;
)

@copy_chain_word_4_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->chain_word_low = Q.hdr.chain_word_low;
- ((uw_object_hdr_t *)P)->chain_word_high = Q.hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q.hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(Q.hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q.hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q.hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(Q.hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q.hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q.hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(Q.hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = Q.hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = Q.hdr.chain_word;
)

@copy_chain_word_4_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->chain_word_low = ((uw_object_hdr_t *)Q)->chain_word_low;
- ((uw_object_hdr_t *)P)->chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(((uw_object_hdr_t *)Q)->chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(((uw_object_hdr_t *)Q)->chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)Q)->chain_word;
)

@copy_chain_word_4_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->chain_word_low = ((uw_mobile_object_t *)Q)->hdr.chain_word_low;
- ((uw_object_hdr_t *)P)->chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- ((uw_object_hdr_t *)P)->chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ ((uw_object_hdr_t *)P)->chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
)

@copy_chain_word_5_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = Q->chain_word_low;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q->chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q->chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(Q->chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q->chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q->chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(Q->chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q->chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q->chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(Q->chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q->chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q->chain_word;
)

@copy_chain_word_5_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = Q.chain_word_low;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(Q.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(Q.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(Q.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q.chain_word;
)

@copy_chain_word_5_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = Q->hdr.chain_word_low;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q->hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q->hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(Q->hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q->hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q->hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(Q->hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q->hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q->hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(Q->hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q->hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q->hdr.chain_word;
)

@copy_chain_word_5_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = Q.hdr.chain_word_low;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q.hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q.hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(Q.hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q.hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q.hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(Q.hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q.hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q.hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(Q.hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = Q.hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = Q.hdr.chain_word;
)

@copy_chain_word_5_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = ((uw_object_hdr_t *)Q)->chain_word_low;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(((uw_object_hdr_t *)Q)->chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(((uw_object_hdr_t *)Q)->chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = ((uw_object_hdr_t *)Q)->chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_object_hdr_t *)Q)->chain_word;
)

@copy_chain_word_5_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = ((uw_mobile_object_t *)Q)->hdr.chain_word_low;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.chain_word);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = ((uw_mobile_object_t *)Q)->hdr.chain_word_high;
+ ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)Q)->hdr.chain_word;
)

@copy_link_word_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->link_word_low = Q->link_word_low;
- P->link_word_high = Q->link_word_high;
+ P->link_word = Q->link_word;
|
- P->link_word_low = (byte)(Q->link_word);
- P->link_word_high = Q->link_word_high;
+ P->link_word = Q->link_word;
|
- P->link_word_low = (char)(Q->link_word);
- P->link_word_high = Q->link_word_high;
+ P->link_word = Q->link_word;
|
- P->link_word_low = (byte)(char)(Q->link_word);
- P->link_word_high = Q->link_word_high;
+ P->link_word = Q->link_word;
)

@copy_link_word_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->link_word_low = Q.link_word_low;
- P->link_word_high = Q.link_word_high;
+ P->link_word = Q.link_word;
|
- P->link_word_low = (byte)(Q.link_word);
- P->link_word_high = Q.link_word_high;
+ P->link_word = Q.link_word;
|
- P->link_word_low = (char)(Q.link_word);
- P->link_word_high = Q.link_word_high;
+ P->link_word = Q.link_word;
|
- P->link_word_low = (byte)(char)(Q.link_word);
- P->link_word_high = Q.link_word_high;
+ P->link_word = Q.link_word;
)

@copy_link_word_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->link_word_low = Q->hdr.link_word_low;
- P->link_word_high = Q->hdr.link_word_high;
+ P->link_word = Q->hdr.link_word;
|
- P->link_word_low = (byte)(Q->hdr.link_word);
- P->link_word_high = Q->hdr.link_word_high;
+ P->link_word = Q->hdr.link_word;
|
- P->link_word_low = (char)(Q->hdr.link_word);
- P->link_word_high = Q->hdr.link_word_high;
+ P->link_word = Q->hdr.link_word;
|
- P->link_word_low = (byte)(char)(Q->hdr.link_word);
- P->link_word_high = Q->hdr.link_word_high;
+ P->link_word = Q->hdr.link_word;
)

@copy_link_word_0_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->link_word_low = Q.hdr.link_word_low;
- P->link_word_high = Q.hdr.link_word_high;
+ P->link_word = Q.hdr.link_word;
|
- P->link_word_low = (byte)(Q.hdr.link_word);
- P->link_word_high = Q.hdr.link_word_high;
+ P->link_word = Q.hdr.link_word;
|
- P->link_word_low = (char)(Q.hdr.link_word);
- P->link_word_high = Q.hdr.link_word_high;
+ P->link_word = Q.hdr.link_word;
|
- P->link_word_low = (byte)(char)(Q.hdr.link_word);
- P->link_word_high = Q.hdr.link_word_high;
+ P->link_word = Q.hdr.link_word;
)

@copy_link_word_0_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->link_word_low = ((uw_object_hdr_t *)Q)->link_word_low;
- P->link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P->link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P->link_word_low = (byte)(((uw_object_hdr_t *)Q)->link_word);
- P->link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P->link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P->link_word_low = (char)(((uw_object_hdr_t *)Q)->link_word);
- P->link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P->link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P->link_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->link_word);
- P->link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P->link_word = ((uw_object_hdr_t *)Q)->link_word;
)

@copy_link_word_0_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->link_word_low = ((uw_mobile_object_t *)Q)->hdr.link_word_low;
- P->link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P->link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P->link_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P->link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P->link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P->link_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P->link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P->link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P->link_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P->link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P->link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
)

@copy_link_word_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.link_word_low = Q->link_word_low;
- P.link_word_high = Q->link_word_high;
+ P.link_word = Q->link_word;
|
- P.link_word_low = (byte)(Q->link_word);
- P.link_word_high = Q->link_word_high;
+ P.link_word = Q->link_word;
|
- P.link_word_low = (char)(Q->link_word);
- P.link_word_high = Q->link_word_high;
+ P.link_word = Q->link_word;
|
- P.link_word_low = (byte)(char)(Q->link_word);
- P.link_word_high = Q->link_word_high;
+ P.link_word = Q->link_word;
)

@copy_link_word_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.link_word_low = Q.link_word_low;
- P.link_word_high = Q.link_word_high;
+ P.link_word = Q.link_word;
|
- P.link_word_low = (byte)(Q.link_word);
- P.link_word_high = Q.link_word_high;
+ P.link_word = Q.link_word;
|
- P.link_word_low = (char)(Q.link_word);
- P.link_word_high = Q.link_word_high;
+ P.link_word = Q.link_word;
|
- P.link_word_low = (byte)(char)(Q.link_word);
- P.link_word_high = Q.link_word_high;
+ P.link_word = Q.link_word;
)

@copy_link_word_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.link_word_low = Q->hdr.link_word_low;
- P.link_word_high = Q->hdr.link_word_high;
+ P.link_word = Q->hdr.link_word;
|
- P.link_word_low = (byte)(Q->hdr.link_word);
- P.link_word_high = Q->hdr.link_word_high;
+ P.link_word = Q->hdr.link_word;
|
- P.link_word_low = (char)(Q->hdr.link_word);
- P.link_word_high = Q->hdr.link_word_high;
+ P.link_word = Q->hdr.link_word;
|
- P.link_word_low = (byte)(char)(Q->hdr.link_word);
- P.link_word_high = Q->hdr.link_word_high;
+ P.link_word = Q->hdr.link_word;
)

@copy_link_word_1_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.link_word_low = Q.hdr.link_word_low;
- P.link_word_high = Q.hdr.link_word_high;
+ P.link_word = Q.hdr.link_word;
|
- P.link_word_low = (byte)(Q.hdr.link_word);
- P.link_word_high = Q.hdr.link_word_high;
+ P.link_word = Q.hdr.link_word;
|
- P.link_word_low = (char)(Q.hdr.link_word);
- P.link_word_high = Q.hdr.link_word_high;
+ P.link_word = Q.hdr.link_word;
|
- P.link_word_low = (byte)(char)(Q.hdr.link_word);
- P.link_word_high = Q.hdr.link_word_high;
+ P.link_word = Q.hdr.link_word;
)

@copy_link_word_1_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.link_word_low = ((uw_object_hdr_t *)Q)->link_word_low;
- P.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P.link_word_low = (byte)(((uw_object_hdr_t *)Q)->link_word);
- P.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P.link_word_low = (char)(((uw_object_hdr_t *)Q)->link_word);
- P.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P.link_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->link_word);
- P.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P.link_word = ((uw_object_hdr_t *)Q)->link_word;
)

@copy_link_word_1_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.link_word_low = ((uw_mobile_object_t *)Q)->hdr.link_word_low;
- P.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P.link_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P.link_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P.link_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
)

@copy_link_word_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.link_word_low = Q->link_word_low;
- P->hdr.link_word_high = Q->link_word_high;
+ P->hdr.link_word = Q->link_word;
|
- P->hdr.link_word_low = (byte)(Q->link_word);
- P->hdr.link_word_high = Q->link_word_high;
+ P->hdr.link_word = Q->link_word;
|
- P->hdr.link_word_low = (char)(Q->link_word);
- P->hdr.link_word_high = Q->link_word_high;
+ P->hdr.link_word = Q->link_word;
|
- P->hdr.link_word_low = (byte)(char)(Q->link_word);
- P->hdr.link_word_high = Q->link_word_high;
+ P->hdr.link_word = Q->link_word;
)

@copy_link_word_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.link_word_low = Q.link_word_low;
- P->hdr.link_word_high = Q.link_word_high;
+ P->hdr.link_word = Q.link_word;
|
- P->hdr.link_word_low = (byte)(Q.link_word);
- P->hdr.link_word_high = Q.link_word_high;
+ P->hdr.link_word = Q.link_word;
|
- P->hdr.link_word_low = (char)(Q.link_word);
- P->hdr.link_word_high = Q.link_word_high;
+ P->hdr.link_word = Q.link_word;
|
- P->hdr.link_word_low = (byte)(char)(Q.link_word);
- P->hdr.link_word_high = Q.link_word_high;
+ P->hdr.link_word = Q.link_word;
)

@copy_link_word_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.link_word_low = Q->hdr.link_word_low;
- P->hdr.link_word_high = Q->hdr.link_word_high;
+ P->hdr.link_word = Q->hdr.link_word;
|
- P->hdr.link_word_low = (byte)(Q->hdr.link_word);
- P->hdr.link_word_high = Q->hdr.link_word_high;
+ P->hdr.link_word = Q->hdr.link_word;
|
- P->hdr.link_word_low = (char)(Q->hdr.link_word);
- P->hdr.link_word_high = Q->hdr.link_word_high;
+ P->hdr.link_word = Q->hdr.link_word;
|
- P->hdr.link_word_low = (byte)(char)(Q->hdr.link_word);
- P->hdr.link_word_high = Q->hdr.link_word_high;
+ P->hdr.link_word = Q->hdr.link_word;
)

@copy_link_word_2_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.link_word_low = Q.hdr.link_word_low;
- P->hdr.link_word_high = Q.hdr.link_word_high;
+ P->hdr.link_word = Q.hdr.link_word;
|
- P->hdr.link_word_low = (byte)(Q.hdr.link_word);
- P->hdr.link_word_high = Q.hdr.link_word_high;
+ P->hdr.link_word = Q.hdr.link_word;
|
- P->hdr.link_word_low = (char)(Q.hdr.link_word);
- P->hdr.link_word_high = Q.hdr.link_word_high;
+ P->hdr.link_word = Q.hdr.link_word;
|
- P->hdr.link_word_low = (byte)(char)(Q.hdr.link_word);
- P->hdr.link_word_high = Q.hdr.link_word_high;
+ P->hdr.link_word = Q.hdr.link_word;
)

@copy_link_word_2_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.link_word_low = ((uw_object_hdr_t *)Q)->link_word_low;
- P->hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P->hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P->hdr.link_word_low = (byte)(((uw_object_hdr_t *)Q)->link_word);
- P->hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P->hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P->hdr.link_word_low = (char)(((uw_object_hdr_t *)Q)->link_word);
- P->hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P->hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P->hdr.link_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->link_word);
- P->hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P->hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
)

@copy_link_word_2_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.link_word_low = ((uw_mobile_object_t *)Q)->hdr.link_word_low;
- P->hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P->hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P->hdr.link_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P->hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P->hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P->hdr.link_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P->hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P->hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P->hdr.link_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P->hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P->hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
)

@copy_link_word_3_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.link_word_low = Q->link_word_low;
- P.hdr.link_word_high = Q->link_word_high;
+ P.hdr.link_word = Q->link_word;
|
- P.hdr.link_word_low = (byte)(Q->link_word);
- P.hdr.link_word_high = Q->link_word_high;
+ P.hdr.link_word = Q->link_word;
|
- P.hdr.link_word_low = (char)(Q->link_word);
- P.hdr.link_word_high = Q->link_word_high;
+ P.hdr.link_word = Q->link_word;
|
- P.hdr.link_word_low = (byte)(char)(Q->link_word);
- P.hdr.link_word_high = Q->link_word_high;
+ P.hdr.link_word = Q->link_word;
)

@copy_link_word_3_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.link_word_low = Q.link_word_low;
- P.hdr.link_word_high = Q.link_word_high;
+ P.hdr.link_word = Q.link_word;
|
- P.hdr.link_word_low = (byte)(Q.link_word);
- P.hdr.link_word_high = Q.link_word_high;
+ P.hdr.link_word = Q.link_word;
|
- P.hdr.link_word_low = (char)(Q.link_word);
- P.hdr.link_word_high = Q.link_word_high;
+ P.hdr.link_word = Q.link_word;
|
- P.hdr.link_word_low = (byte)(char)(Q.link_word);
- P.hdr.link_word_high = Q.link_word_high;
+ P.hdr.link_word = Q.link_word;
)

@copy_link_word_3_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.link_word_low = Q->hdr.link_word_low;
- P.hdr.link_word_high = Q->hdr.link_word_high;
+ P.hdr.link_word = Q->hdr.link_word;
|
- P.hdr.link_word_low = (byte)(Q->hdr.link_word);
- P.hdr.link_word_high = Q->hdr.link_word_high;
+ P.hdr.link_word = Q->hdr.link_word;
|
- P.hdr.link_word_low = (char)(Q->hdr.link_word);
- P.hdr.link_word_high = Q->hdr.link_word_high;
+ P.hdr.link_word = Q->hdr.link_word;
|
- P.hdr.link_word_low = (byte)(char)(Q->hdr.link_word);
- P.hdr.link_word_high = Q->hdr.link_word_high;
+ P.hdr.link_word = Q->hdr.link_word;
)

@copy_link_word_3_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.link_word_low = Q.hdr.link_word_low;
- P.hdr.link_word_high = Q.hdr.link_word_high;
+ P.hdr.link_word = Q.hdr.link_word;
|
- P.hdr.link_word_low = (byte)(Q.hdr.link_word);
- P.hdr.link_word_high = Q.hdr.link_word_high;
+ P.hdr.link_word = Q.hdr.link_word;
|
- P.hdr.link_word_low = (char)(Q.hdr.link_word);
- P.hdr.link_word_high = Q.hdr.link_word_high;
+ P.hdr.link_word = Q.hdr.link_word;
|
- P.hdr.link_word_low = (byte)(char)(Q.hdr.link_word);
- P.hdr.link_word_high = Q.hdr.link_word_high;
+ P.hdr.link_word = Q.hdr.link_word;
)

@copy_link_word_3_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.link_word_low = ((uw_object_hdr_t *)Q)->link_word_low;
- P.hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P.hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P.hdr.link_word_low = (byte)(((uw_object_hdr_t *)Q)->link_word);
- P.hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P.hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P.hdr.link_word_low = (char)(((uw_object_hdr_t *)Q)->link_word);
- P.hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P.hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- P.hdr.link_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->link_word);
- P.hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ P.hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
)

@copy_link_word_3_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.link_word_low = ((uw_mobile_object_t *)Q)->hdr.link_word_low;
- P.hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P.hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P.hdr.link_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P.hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P.hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P.hdr.link_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P.hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P.hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- P.hdr.link_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- P.hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ P.hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
)

@copy_link_word_4_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->link_word_low = Q->link_word_low;
- ((uw_object_hdr_t *)P)->link_word_high = Q->link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q->link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(Q->link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q->link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q->link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(Q->link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q->link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q->link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(Q->link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q->link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q->link_word;
)

@copy_link_word_4_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->link_word_low = Q.link_word_low;
- ((uw_object_hdr_t *)P)->link_word_high = Q.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(Q.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(Q.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(Q.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q.link_word;
)

@copy_link_word_4_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->link_word_low = Q->hdr.link_word_low;
- ((uw_object_hdr_t *)P)->link_word_high = Q->hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q->hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(Q->hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q->hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q->hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(Q->hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q->hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q->hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(Q->hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q->hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q->hdr.link_word;
)

@copy_link_word_4_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->link_word_low = Q.hdr.link_word_low;
- ((uw_object_hdr_t *)P)->link_word_high = Q.hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q.hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(Q.hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q.hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q.hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(Q.hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q.hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q.hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(Q.hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = Q.hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = Q.hdr.link_word;
)

@copy_link_word_4_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->link_word_low = ((uw_object_hdr_t *)Q)->link_word_low;
- ((uw_object_hdr_t *)P)->link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(((uw_object_hdr_t *)Q)->link_word);
- ((uw_object_hdr_t *)P)->link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(((uw_object_hdr_t *)Q)->link_word);
- ((uw_object_hdr_t *)P)->link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->link_word);
- ((uw_object_hdr_t *)P)->link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)Q)->link_word;
)

@copy_link_word_4_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->link_word_low = ((uw_mobile_object_t *)Q)->hdr.link_word_low;
- ((uw_object_hdr_t *)P)->link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- ((uw_object_hdr_t *)P)->link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ ((uw_object_hdr_t *)P)->link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
)

@copy_link_word_5_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.link_word_low = Q->link_word_low;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q->link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q->link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(Q->link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q->link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q->link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(Q->link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q->link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q->link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(Q->link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q->link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q->link_word;
)

@copy_link_word_5_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.link_word_low = Q.link_word_low;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(Q.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(Q.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(Q.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q.link_word;
)

@copy_link_word_5_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.link_word_low = Q->hdr.link_word_low;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q->hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q->hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(Q->hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q->hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q->hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(Q->hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q->hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q->hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(Q->hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q->hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q->hdr.link_word;
)

@copy_link_word_5_3 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.link_word_low = Q.hdr.link_word_low;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q.hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q.hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(Q.hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q.hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q.hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(Q.hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q.hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q.hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(Q.hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = Q.hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = Q.hdr.link_word;
)

@copy_link_word_5_4 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.link_word_low = ((uw_object_hdr_t *)Q)->link_word_low;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(((uw_object_hdr_t *)Q)->link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(((uw_object_hdr_t *)Q)->link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(((uw_object_hdr_t *)Q)->link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = ((uw_object_hdr_t *)Q)->link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_object_hdr_t *)Q)->link_word;
)

@copy_link_word_5_5 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.link_word_low = ((uw_mobile_object_t *)Q)->hdr.link_word_low;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(((uw_mobile_object_t *)Q)->hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->hdr.link_word);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = ((uw_mobile_object_t *)Q)->hdr.link_word_high;
+ ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)Q)->hdr.link_word;
)

@copy_goal_word_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->goal_word_low = Q->goal_word_low;
- P->goal_word_high = Q->goal_word_high;
+ P->goal_word = Q->goal_word;
|
- P->goal_word_low = (byte)(Q->goal_word);
- P->goal_word_high = Q->goal_word_high;
+ P->goal_word = Q->goal_word;
|
- P->goal_word_low = (char)(Q->goal_word);
- P->goal_word_high = Q->goal_word_high;
+ P->goal_word = Q->goal_word;
|
- P->goal_word_low = (byte)(char)(Q->goal_word);
- P->goal_word_high = Q->goal_word_high;
+ P->goal_word = Q->goal_word;
)

@copy_goal_word_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->goal_word_low = Q.goal_word_low;
- P->goal_word_high = Q.goal_word_high;
+ P->goal_word = Q.goal_word;
|
- P->goal_word_low = (byte)(Q.goal_word);
- P->goal_word_high = Q.goal_word_high;
+ P->goal_word = Q.goal_word;
|
- P->goal_word_low = (char)(Q.goal_word);
- P->goal_word_high = Q.goal_word_high;
+ P->goal_word = Q.goal_word;
|
- P->goal_word_low = (byte)(char)(Q.goal_word);
- P->goal_word_high = Q.goal_word_high;
+ P->goal_word = Q.goal_word;
)

@copy_goal_word_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->goal_word_low = ((uw_mobile_object_t *)Q)->goal_word_low;
- P->goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ P->goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- P->goal_word_low = (byte)(((uw_mobile_object_t *)Q)->goal_word);
- P->goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ P->goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- P->goal_word_low = (char)(((uw_mobile_object_t *)Q)->goal_word);
- P->goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ P->goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- P->goal_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->goal_word);
- P->goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ P->goal_word = ((uw_mobile_object_t *)Q)->goal_word;
)

@copy_goal_word_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.goal_word_low = Q->goal_word_low;
- P.goal_word_high = Q->goal_word_high;
+ P.goal_word = Q->goal_word;
|
- P.goal_word_low = (byte)(Q->goal_word);
- P.goal_word_high = Q->goal_word_high;
+ P.goal_word = Q->goal_word;
|
- P.goal_word_low = (char)(Q->goal_word);
- P.goal_word_high = Q->goal_word_high;
+ P.goal_word = Q->goal_word;
|
- P.goal_word_low = (byte)(char)(Q->goal_word);
- P.goal_word_high = Q->goal_word_high;
+ P.goal_word = Q->goal_word;
)

@copy_goal_word_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.goal_word_low = Q.goal_word_low;
- P.goal_word_high = Q.goal_word_high;
+ P.goal_word = Q.goal_word;
|
- P.goal_word_low = (byte)(Q.goal_word);
- P.goal_word_high = Q.goal_word_high;
+ P.goal_word = Q.goal_word;
|
- P.goal_word_low = (char)(Q.goal_word);
- P.goal_word_high = Q.goal_word_high;
+ P.goal_word = Q.goal_word;
|
- P.goal_word_low = (byte)(char)(Q.goal_word);
- P.goal_word_high = Q.goal_word_high;
+ P.goal_word = Q.goal_word;
)

@copy_goal_word_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.goal_word_low = ((uw_mobile_object_t *)Q)->goal_word_low;
- P.goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ P.goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- P.goal_word_low = (byte)(((uw_mobile_object_t *)Q)->goal_word);
- P.goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ P.goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- P.goal_word_low = (char)(((uw_mobile_object_t *)Q)->goal_word);
- P.goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ P.goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- P.goal_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->goal_word);
- P.goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ P.goal_word = ((uw_mobile_object_t *)Q)->goal_word;
)

@copy_goal_word_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->goal_word_low = Q->goal_word_low;
- ((uw_mobile_object_t *)P)->goal_word_high = Q->goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = Q->goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(Q->goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = Q->goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = Q->goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(Q->goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = Q->goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = Q->goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(Q->goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = Q->goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = Q->goal_word;
)

@copy_goal_word_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->goal_word_low = Q.goal_word_low;
- ((uw_mobile_object_t *)P)->goal_word_high = Q.goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = Q.goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(Q.goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = Q.goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = Q.goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(Q.goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = Q.goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = Q.goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(Q.goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = Q.goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = Q.goal_word;
)

@copy_goal_word_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->goal_word_low = ((uw_mobile_object_t *)Q)->goal_word_low;
- ((uw_mobile_object_t *)P)->goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(((uw_mobile_object_t *)Q)->goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(((uw_mobile_object_t *)Q)->goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)Q)->goal_word;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->goal_word);
- ((uw_mobile_object_t *)P)->goal_word_high = ((uw_mobile_object_t *)Q)->goal_word_high;
+ ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)Q)->goal_word;
)

@copy_status_word_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->status_word_low = Q->status_word_low;
- P->status_word_high = Q->status_word_high;
+ P->status_word = Q->status_word;
|
- P->status_word_low = (byte)(Q->status_word);
- P->status_word_high = Q->status_word_high;
+ P->status_word = Q->status_word;
|
- P->status_word_low = (char)(Q->status_word);
- P->status_word_high = Q->status_word_high;
+ P->status_word = Q->status_word;
|
- P->status_word_low = (byte)(char)(Q->status_word);
- P->status_word_high = Q->status_word_high;
+ P->status_word = Q->status_word;
)

@copy_status_word_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->status_word_low = Q.status_word_low;
- P->status_word_high = Q.status_word_high;
+ P->status_word = Q.status_word;
|
- P->status_word_low = (byte)(Q.status_word);
- P->status_word_high = Q.status_word_high;
+ P->status_word = Q.status_word;
|
- P->status_word_low = (char)(Q.status_word);
- P->status_word_high = Q.status_word_high;
+ P->status_word = Q.status_word;
|
- P->status_word_low = (byte)(char)(Q.status_word);
- P->status_word_high = Q.status_word_high;
+ P->status_word = Q.status_word;
)

@copy_status_word_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->status_word_low = ((uw_mobile_object_t *)Q)->status_word_low;
- P->status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ P->status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- P->status_word_low = (byte)(((uw_mobile_object_t *)Q)->status_word);
- P->status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ P->status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- P->status_word_low = (char)(((uw_mobile_object_t *)Q)->status_word);
- P->status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ P->status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- P->status_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->status_word);
- P->status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ P->status_word = ((uw_mobile_object_t *)Q)->status_word;
)

@copy_status_word_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.status_word_low = Q->status_word_low;
- P.status_word_high = Q->status_word_high;
+ P.status_word = Q->status_word;
|
- P.status_word_low = (byte)(Q->status_word);
- P.status_word_high = Q->status_word_high;
+ P.status_word = Q->status_word;
|
- P.status_word_low = (char)(Q->status_word);
- P.status_word_high = Q->status_word_high;
+ P.status_word = Q->status_word;
|
- P.status_word_low = (byte)(char)(Q->status_word);
- P.status_word_high = Q->status_word_high;
+ P.status_word = Q->status_word;
)

@copy_status_word_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.status_word_low = Q.status_word_low;
- P.status_word_high = Q.status_word_high;
+ P.status_word = Q.status_word;
|
- P.status_word_low = (byte)(Q.status_word);
- P.status_word_high = Q.status_word_high;
+ P.status_word = Q.status_word;
|
- P.status_word_low = (char)(Q.status_word);
- P.status_word_high = Q.status_word_high;
+ P.status_word = Q.status_word;
|
- P.status_word_low = (byte)(char)(Q.status_word);
- P.status_word_high = Q.status_word_high;
+ P.status_word = Q.status_word;
)

@copy_status_word_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.status_word_low = ((uw_mobile_object_t *)Q)->status_word_low;
- P.status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ P.status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- P.status_word_low = (byte)(((uw_mobile_object_t *)Q)->status_word);
- P.status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ P.status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- P.status_word_low = (char)(((uw_mobile_object_t *)Q)->status_word);
- P.status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ P.status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- P.status_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->status_word);
- P.status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ P.status_word = ((uw_mobile_object_t *)Q)->status_word;
)

@copy_status_word_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->status_word_low = Q->status_word_low;
- ((uw_mobile_object_t *)P)->status_word_high = Q->status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = Q->status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(Q->status_word);
- ((uw_mobile_object_t *)P)->status_word_high = Q->status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = Q->status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(Q->status_word);
- ((uw_mobile_object_t *)P)->status_word_high = Q->status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = Q->status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(Q->status_word);
- ((uw_mobile_object_t *)P)->status_word_high = Q->status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = Q->status_word;
)

@copy_status_word_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->status_word_low = Q.status_word_low;
- ((uw_mobile_object_t *)P)->status_word_high = Q.status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = Q.status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(Q.status_word);
- ((uw_mobile_object_t *)P)->status_word_high = Q.status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = Q.status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(Q.status_word);
- ((uw_mobile_object_t *)P)->status_word_high = Q.status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = Q.status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(Q.status_word);
- ((uw_mobile_object_t *)P)->status_word_high = Q.status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = Q.status_word;
)

@copy_status_word_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->status_word_low = ((uw_mobile_object_t *)Q)->status_word_low;
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(((uw_mobile_object_t *)Q)->status_word);
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(((uw_mobile_object_t *)Q)->status_word);
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)Q)->status_word;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->status_word);
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)Q)->status_word_high;
+ ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)Q)->status_word;
)

@copy_target_word_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->target_word_low = Q->target_word_low;
- P->target_word_high = Q->target_word_high;
+ P->target_word = Q->target_word;
|
- P->target_word_low = (byte)(Q->target_word);
- P->target_word_high = Q->target_word_high;
+ P->target_word = Q->target_word;
|
- P->target_word_low = (char)(Q->target_word);
- P->target_word_high = Q->target_word_high;
+ P->target_word = Q->target_word;
|
- P->target_word_low = (byte)(char)(Q->target_word);
- P->target_word_high = Q->target_word_high;
+ P->target_word = Q->target_word;
)

@copy_target_word_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->target_word_low = Q.target_word_low;
- P->target_word_high = Q.target_word_high;
+ P->target_word = Q.target_word;
|
- P->target_word_low = (byte)(Q.target_word);
- P->target_word_high = Q.target_word_high;
+ P->target_word = Q.target_word;
|
- P->target_word_low = (char)(Q.target_word);
- P->target_word_high = Q.target_word_high;
+ P->target_word = Q.target_word;
|
- P->target_word_low = (byte)(char)(Q.target_word);
- P->target_word_high = Q.target_word_high;
+ P->target_word = Q.target_word;
)

@copy_target_word_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->target_word_low = ((uw_mobile_object_t *)Q)->target_word_low;
- P->target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ P->target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- P->target_word_low = (byte)(((uw_mobile_object_t *)Q)->target_word);
- P->target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ P->target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- P->target_word_low = (char)(((uw_mobile_object_t *)Q)->target_word);
- P->target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ P->target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- P->target_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->target_word);
- P->target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ P->target_word = ((uw_mobile_object_t *)Q)->target_word;
)

@copy_target_word_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.target_word_low = Q->target_word_low;
- P.target_word_high = Q->target_word_high;
+ P.target_word = Q->target_word;
|
- P.target_word_low = (byte)(Q->target_word);
- P.target_word_high = Q->target_word_high;
+ P.target_word = Q->target_word;
|
- P.target_word_low = (char)(Q->target_word);
- P.target_word_high = Q->target_word_high;
+ P.target_word = Q->target_word;
|
- P.target_word_low = (byte)(char)(Q->target_word);
- P.target_word_high = Q->target_word_high;
+ P.target_word = Q->target_word;
)

@copy_target_word_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.target_word_low = Q.target_word_low;
- P.target_word_high = Q.target_word_high;
+ P.target_word = Q.target_word;
|
- P.target_word_low = (byte)(Q.target_word);
- P.target_word_high = Q.target_word_high;
+ P.target_word = Q.target_word;
|
- P.target_word_low = (char)(Q.target_word);
- P.target_word_high = Q.target_word_high;
+ P.target_word = Q.target_word;
|
- P.target_word_low = (byte)(char)(Q.target_word);
- P.target_word_high = Q.target_word_high;
+ P.target_word = Q.target_word;
)

@copy_target_word_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.target_word_low = ((uw_mobile_object_t *)Q)->target_word_low;
- P.target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ P.target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- P.target_word_low = (byte)(((uw_mobile_object_t *)Q)->target_word);
- P.target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ P.target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- P.target_word_low = (char)(((uw_mobile_object_t *)Q)->target_word);
- P.target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ P.target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- P.target_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->target_word);
- P.target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ P.target_word = ((uw_mobile_object_t *)Q)->target_word;
)

@copy_target_word_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->target_word_low = Q->target_word_low;
- ((uw_mobile_object_t *)P)->target_word_high = Q->target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = Q->target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(Q->target_word);
- ((uw_mobile_object_t *)P)->target_word_high = Q->target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = Q->target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(Q->target_word);
- ((uw_mobile_object_t *)P)->target_word_high = Q->target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = Q->target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(Q->target_word);
- ((uw_mobile_object_t *)P)->target_word_high = Q->target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = Q->target_word;
)

@copy_target_word_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->target_word_low = Q.target_word_low;
- ((uw_mobile_object_t *)P)->target_word_high = Q.target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = Q.target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(Q.target_word);
- ((uw_mobile_object_t *)P)->target_word_high = Q.target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = Q.target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(Q.target_word);
- ((uw_mobile_object_t *)P)->target_word_high = Q.target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = Q.target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(Q.target_word);
- ((uw_mobile_object_t *)P)->target_word_high = Q.target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = Q.target_word;
)

@copy_target_word_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->target_word_low = ((uw_mobile_object_t *)Q)->target_word_low;
- ((uw_mobile_object_t *)P)->target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(((uw_mobile_object_t *)Q)->target_word);
- ((uw_mobile_object_t *)P)->target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(((uw_mobile_object_t *)Q)->target_word);
- ((uw_mobile_object_t *)P)->target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)Q)->target_word;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->target_word);
- ((uw_mobile_object_t *)P)->target_word_high = ((uw_mobile_object_t *)Q)->target_word_high;
+ ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)Q)->target_word;
)

@copy_tile_word_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->tile_word_low = Q->tile_word_low;
- P->tile_word_high = Q->tile_word_high;
+ P->tile_word = Q->tile_word;
|
- P->tile_word_low = (byte)(Q->tile_word);
- P->tile_word_high = Q->tile_word_high;
+ P->tile_word = Q->tile_word;
|
- P->tile_word_low = (char)(Q->tile_word);
- P->tile_word_high = Q->tile_word_high;
+ P->tile_word = Q->tile_word;
|
- P->tile_word_low = (byte)(char)(Q->tile_word);
- P->tile_word_high = Q->tile_word_high;
+ P->tile_word = Q->tile_word;
)

@copy_tile_word_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->tile_word_low = Q.tile_word_low;
- P->tile_word_high = Q.tile_word_high;
+ P->tile_word = Q.tile_word;
|
- P->tile_word_low = (byte)(Q.tile_word);
- P->tile_word_high = Q.tile_word_high;
+ P->tile_word = Q.tile_word;
|
- P->tile_word_low = (char)(Q.tile_word);
- P->tile_word_high = Q.tile_word_high;
+ P->tile_word = Q.tile_word;
|
- P->tile_word_low = (byte)(char)(Q.tile_word);
- P->tile_word_high = Q.tile_word_high;
+ P->tile_word = Q.tile_word;
)

@copy_tile_word_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->tile_word_low = ((uw_mobile_object_t *)Q)->tile_word_low;
- P->tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ P->tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- P->tile_word_low = (byte)(((uw_mobile_object_t *)Q)->tile_word);
- P->tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ P->tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- P->tile_word_low = (char)(((uw_mobile_object_t *)Q)->tile_word);
- P->tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ P->tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- P->tile_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->tile_word);
- P->tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ P->tile_word = ((uw_mobile_object_t *)Q)->tile_word;
)

@copy_tile_word_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.tile_word_low = Q->tile_word_low;
- P.tile_word_high = Q->tile_word_high;
+ P.tile_word = Q->tile_word;
|
- P.tile_word_low = (byte)(Q->tile_word);
- P.tile_word_high = Q->tile_word_high;
+ P.tile_word = Q->tile_word;
|
- P.tile_word_low = (char)(Q->tile_word);
- P.tile_word_high = Q->tile_word_high;
+ P.tile_word = Q->tile_word;
|
- P.tile_word_low = (byte)(char)(Q->tile_word);
- P.tile_word_high = Q->tile_word_high;
+ P.tile_word = Q->tile_word;
)

@copy_tile_word_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.tile_word_low = Q.tile_word_low;
- P.tile_word_high = Q.tile_word_high;
+ P.tile_word = Q.tile_word;
|
- P.tile_word_low = (byte)(Q.tile_word);
- P.tile_word_high = Q.tile_word_high;
+ P.tile_word = Q.tile_word;
|
- P.tile_word_low = (char)(Q.tile_word);
- P.tile_word_high = Q.tile_word_high;
+ P.tile_word = Q.tile_word;
|
- P.tile_word_low = (byte)(char)(Q.tile_word);
- P.tile_word_high = Q.tile_word_high;
+ P.tile_word = Q.tile_word;
)

@copy_tile_word_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.tile_word_low = ((uw_mobile_object_t *)Q)->tile_word_low;
- P.tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ P.tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- P.tile_word_low = (byte)(((uw_mobile_object_t *)Q)->tile_word);
- P.tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ P.tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- P.tile_word_low = (char)(((uw_mobile_object_t *)Q)->tile_word);
- P.tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ P.tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- P.tile_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->tile_word);
- P.tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ P.tile_word = ((uw_mobile_object_t *)Q)->tile_word;
)

@copy_tile_word_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->tile_word_low = Q->tile_word_low;
- ((uw_mobile_object_t *)P)->tile_word_high = Q->tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = Q->tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(Q->tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = Q->tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = Q->tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(Q->tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = Q->tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = Q->tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(Q->tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = Q->tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = Q->tile_word;
)

@copy_tile_word_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->tile_word_low = Q.tile_word_low;
- ((uw_mobile_object_t *)P)->tile_word_high = Q.tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = Q.tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(Q.tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = Q.tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = Q.tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(Q.tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = Q.tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = Q.tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(Q.tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = Q.tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = Q.tile_word;
)

@copy_tile_word_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->tile_word_low = ((uw_mobile_object_t *)Q)->tile_word_low;
- ((uw_mobile_object_t *)P)->tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(((uw_mobile_object_t *)Q)->tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(((uw_mobile_object_t *)Q)->tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)Q)->tile_word;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(((uw_mobile_object_t *)Q)->tile_word);
- ((uw_mobile_object_t *)P)->tile_word_high = ((uw_mobile_object_t *)Q)->tile_word_high;
+ ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)Q)->tile_word;
)

@copy_size_weight_0_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->size_weight_low = Q->size_weight_low;
- P->size_weight_high = Q->size_weight_high;
+ P->size_weight = Q->size_weight;
|
- P->size_weight_low = (byte)(Q->size_weight);
- P->size_weight_high = Q->size_weight_high;
+ P->size_weight = Q->size_weight;
|
- P->size_weight_low = (char)(Q->size_weight);
- P->size_weight_high = Q->size_weight_high;
+ P->size_weight = Q->size_weight;
|
- P->size_weight_low = (byte)(char)(Q->size_weight);
- P->size_weight_high = Q->size_weight_high;
+ P->size_weight = Q->size_weight;
)

@copy_size_weight_0_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->size_weight_low = Q.size_weight_low;
- P->size_weight_high = Q.size_weight_high;
+ P->size_weight = Q.size_weight;
|
- P->size_weight_low = (byte)(Q.size_weight);
- P->size_weight_high = Q.size_weight_high;
+ P->size_weight = Q.size_weight;
|
- P->size_weight_low = (char)(Q.size_weight);
- P->size_weight_high = Q.size_weight_high;
+ P->size_weight = Q.size_weight;
|
- P->size_weight_low = (byte)(char)(Q.size_weight);
- P->size_weight_high = Q.size_weight_high;
+ P->size_weight = Q.size_weight;
)

@copy_size_weight_0_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->size_weight_low = ((uw_object_type_props_t *)Q)->size_weight_low;
- P->size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ P->size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- P->size_weight_low = (byte)(((uw_object_type_props_t *)Q)->size_weight);
- P->size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ P->size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- P->size_weight_low = (char)(((uw_object_type_props_t *)Q)->size_weight);
- P->size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ P->size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- P->size_weight_low = (byte)(char)(((uw_object_type_props_t *)Q)->size_weight);
- P->size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ P->size_weight = ((uw_object_type_props_t *)Q)->size_weight;
)

@copy_size_weight_1_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.size_weight_low = Q->size_weight_low;
- P.size_weight_high = Q->size_weight_high;
+ P.size_weight = Q->size_weight;
|
- P.size_weight_low = (byte)(Q->size_weight);
- P.size_weight_high = Q->size_weight_high;
+ P.size_weight = Q->size_weight;
|
- P.size_weight_low = (char)(Q->size_weight);
- P.size_weight_high = Q->size_weight_high;
+ P.size_weight = Q->size_weight;
|
- P.size_weight_low = (byte)(char)(Q->size_weight);
- P.size_weight_high = Q->size_weight_high;
+ P.size_weight = Q->size_weight;
)

@copy_size_weight_1_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.size_weight_low = Q.size_weight_low;
- P.size_weight_high = Q.size_weight_high;
+ P.size_weight = Q.size_weight;
|
- P.size_weight_low = (byte)(Q.size_weight);
- P.size_weight_high = Q.size_weight_high;
+ P.size_weight = Q.size_weight;
|
- P.size_weight_low = (char)(Q.size_weight);
- P.size_weight_high = Q.size_weight_high;
+ P.size_weight = Q.size_weight;
|
- P.size_weight_low = (byte)(char)(Q.size_weight);
- P.size_weight_high = Q.size_weight_high;
+ P.size_weight = Q.size_weight;
)

@copy_size_weight_1_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.size_weight_low = ((uw_object_type_props_t *)Q)->size_weight_low;
- P.size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ P.size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- P.size_weight_low = (byte)(((uw_object_type_props_t *)Q)->size_weight);
- P.size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ P.size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- P.size_weight_low = (char)(((uw_object_type_props_t *)Q)->size_weight);
- P.size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ P.size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- P.size_weight_low = (byte)(char)(((uw_object_type_props_t *)Q)->size_weight);
- P.size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ P.size_weight = ((uw_object_type_props_t *)Q)->size_weight;
)

@copy_size_weight_2_0 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_type_props_t *)P)->size_weight_low = Q->size_weight_low;
- ((uw_object_type_props_t *)P)->size_weight_high = Q->size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = Q->size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(Q->size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = Q->size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = Q->size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(Q->size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = Q->size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = Q->size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(Q->size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = Q->size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = Q->size_weight;
)

@copy_size_weight_2_1 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_type_props_t *)P)->size_weight_low = Q.size_weight_low;
- ((uw_object_type_props_t *)P)->size_weight_high = Q.size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = Q.size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(Q.size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = Q.size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = Q.size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(Q.size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = Q.size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = Q.size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(Q.size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = Q.size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = Q.size_weight;
)

@copy_size_weight_2_2 disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_type_props_t *)P)->size_weight_low = ((uw_object_type_props_t *)Q)->size_weight_low;
- ((uw_object_type_props_t *)P)->size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(((uw_object_type_props_t *)Q)->size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(((uw_object_type_props_t *)Q)->size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = ((uw_object_type_props_t *)Q)->size_weight;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(((uw_object_type_props_t *)Q)->size_weight);
- ((uw_object_type_props_t *)P)->size_weight_high = ((uw_object_type_props_t *)Q)->size_weight_high;
+ ((uw_object_type_props_t *)P)->size_weight = ((uw_object_type_props_t *)Q)->size_weight;
)
