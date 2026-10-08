@partial_ptr_0_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- (B->type_flags & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((byte)(B->type_flags) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((byte)(B->type_flags) & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((char)(B->type_flags) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((char)(B->type_flags) & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((byte)(byte)(B->type_flags) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((byte)(byte)(B->type_flags) & 0x7) != 0
+ (B->item_id & 0x7) != 0
)

@partial_ptr_0_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x7
+ B->item_id & 0x7
|
- (byte)(B->type_flags) & 0x7
+ B->item_id & 0x7
|
- (char)(B->type_flags) & 0x7
+ B->item_id & 0x7
|
- (byte)(byte)(B->type_flags) & 0x7
+ B->item_id & 0x7
)

@partial_ptr_1_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- (B->type_flags_signed & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((byte)(B->type_flags_signed) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((byte)(B->type_flags_signed) & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((char)(B->type_flags_signed) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((char)(B->type_flags_signed) & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((byte)(byte)(B->type_flags_signed) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((byte)(byte)(B->type_flags_signed) & 0x7) != 0
+ (B->item_id & 0x7) != 0
)

@partial_ptr_1_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x7
+ B->item_id & 0x7
|
- (byte)(B->type_flags_signed) & 0x7
+ B->item_id & 0x7
|
- (char)(B->type_flags_signed) & 0x7
+ B->item_id & 0x7
|
- (byte)(byte)(B->type_flags_signed) & 0x7
+ B->item_id & 0x7
)

@partial_ptr_2_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_low & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- (B->type_flags_low & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((byte)(B->type_flags_low) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((byte)(B->type_flags_low) & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((char)(B->type_flags_low) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((char)(B->type_flags_low) & 0x7) != 0
+ (B->item_id & 0x7) != 0
|
- ((byte)(byte)(B->type_flags_low) & 0x7) == 0
+ (B->item_id & 0x7) == 0
|
- ((byte)(byte)(B->type_flags_low) & 0x7) != 0
+ (B->item_id & 0x7) != 0
)

@partial_ptr_2_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_low & 0x7
+ B->item_id & 0x7
|
- (byte)(B->type_flags_low) & 0x7
+ B->item_id & 0x7
|
- (char)(B->type_flags_low) & 0x7
+ B->item_id & 0x7
|
- (byte)(byte)(B->type_flags_low) & 0x7
+ B->item_id & 0x7
)

@partial_ptr_3_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- (B->type_flags & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((byte)(B->type_flags) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((byte)(B->type_flags) & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((char)(B->type_flags) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((char)(B->type_flags) & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((byte)(byte)(B->type_flags) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((byte)(byte)(B->type_flags) & 0xf) != 0
+ (B->item_id & 0xf) != 0
)

@partial_ptr_3_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0xf
+ B->item_id & 0xf
|
- (byte)(B->type_flags) & 0xf
+ B->item_id & 0xf
|
- (char)(B->type_flags) & 0xf
+ B->item_id & 0xf
|
- (byte)(byte)(B->type_flags) & 0xf
+ B->item_id & 0xf
)

@partial_ptr_4_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- (B->type_flags_signed & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((byte)(B->type_flags_signed) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((byte)(B->type_flags_signed) & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((char)(B->type_flags_signed) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((char)(B->type_flags_signed) & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((byte)(byte)(B->type_flags_signed) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((byte)(byte)(B->type_flags_signed) & 0xf) != 0
+ (B->item_id & 0xf) != 0
)

@partial_ptr_4_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0xf
+ B->item_id & 0xf
|
- (byte)(B->type_flags_signed) & 0xf
+ B->item_id & 0xf
|
- (char)(B->type_flags_signed) & 0xf
+ B->item_id & 0xf
|
- (byte)(byte)(B->type_flags_signed) & 0xf
+ B->item_id & 0xf
)

@partial_ptr_5_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_low & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- (B->type_flags_low & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((byte)(B->type_flags_low) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((byte)(B->type_flags_low) & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((char)(B->type_flags_low) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((char)(B->type_flags_low) & 0xf) != 0
+ (B->item_id & 0xf) != 0
|
- ((byte)(byte)(B->type_flags_low) & 0xf) == 0
+ (B->item_id & 0xf) == 0
|
- ((byte)(byte)(B->type_flags_low) & 0xf) != 0
+ (B->item_id & 0xf) != 0
)

@partial_ptr_5_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_low & 0xf
+ B->item_id & 0xf
|
- (byte)(B->type_flags_low) & 0xf
+ B->item_id & 0xf
|
- (char)(B->type_flags_low) & 0xf
+ B->item_id & 0xf
|
- (byte)(byte)(B->type_flags_low) & 0xf
+ B->item_id & 0xf
)

@partial_ptr_6_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- (B->type_flags & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((byte)(B->type_flags) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((byte)(B->type_flags) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((char)(B->type_flags) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((char)(B->type_flags) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((byte)(byte)(B->type_flags) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((byte)(byte)(B->type_flags) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
)

@partial_ptr_6_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x1f
+ B->item_id & 0x1f
|
- (byte)(B->type_flags) & 0x1f
+ B->item_id & 0x1f
|
- (char)(B->type_flags) & 0x1f
+ B->item_id & 0x1f
|
- (byte)(byte)(B->type_flags) & 0x1f
+ B->item_id & 0x1f
)

@partial_ptr_7_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- (B->type_flags_signed & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((byte)(B->type_flags_signed) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((byte)(B->type_flags_signed) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((char)(B->type_flags_signed) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((char)(B->type_flags_signed) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((byte)(byte)(B->type_flags_signed) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((byte)(byte)(B->type_flags_signed) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
)

@partial_ptr_7_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x1f
+ B->item_id & 0x1f
|
- (byte)(B->type_flags_signed) & 0x1f
+ B->item_id & 0x1f
|
- (char)(B->type_flags_signed) & 0x1f
+ B->item_id & 0x1f
|
- (byte)(byte)(B->type_flags_signed) & 0x1f
+ B->item_id & 0x1f
)

@partial_ptr_8_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_low & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- (B->type_flags_low & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((byte)(B->type_flags_low) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((byte)(B->type_flags_low) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((char)(B->type_flags_low) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((char)(B->type_flags_low) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
|
- ((byte)(byte)(B->type_flags_low) & 0x1f) == 0
+ (B->item_id & 0x1f) == 0
|
- ((byte)(byte)(B->type_flags_low) & 0x1f) != 0
+ (B->item_id & 0x1f) != 0
)

@partial_ptr_8_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_low & 0x1f
+ B->item_id & 0x1f
|
- (byte)(B->type_flags_low) & 0x1f
+ B->item_id & 0x1f
|
- (char)(B->type_flags_low) & 0x1f
+ B->item_id & 0x1f
|
- (byte)(byte)(B->type_flags_low) & 0x1f
+ B->item_id & 0x1f
)

@partial_ptr_9_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- (B->type_flags & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((byte)(B->type_flags) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((byte)(B->type_flags) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((char)(B->type_flags) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((char)(B->type_flags) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((byte)(byte)(B->type_flags) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((byte)(byte)(B->type_flags) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((B->type_flags >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- ((B->type_flags >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- ((B->type_flags & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- ((B->type_flags & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(B->type_flags) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(B->type_flags) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(B->type_flags) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(B->type_flags) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((char)(B->type_flags) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((char)(B->type_flags) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((char)(B->type_flags) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((char)(B->type_flags) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(byte)(B->type_flags) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(byte)(B->type_flags) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(byte)(B->type_flags) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(byte)(B->type_flags) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
)

@partial_ptr_9_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x30
+ B->item_id & 0x30
|
- (byte)(B->type_flags) & 0x30
+ B->item_id & 0x30
|
- (char)(B->type_flags) & 0x30
+ B->item_id & 0x30
|
- (byte)(byte)(B->type_flags) & 0x30
+ B->item_id & 0x30
|
- (B->type_flags >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- (B->type_flags & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((byte)(B->type_flags) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((byte)(B->type_flags) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((char)(B->type_flags) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((char)(B->type_flags) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((byte)(byte)(B->type_flags) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((byte)(byte)(B->type_flags) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
)

@partial_ptr_10_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- (B->type_flags_signed & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((byte)(B->type_flags_signed) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((byte)(B->type_flags_signed) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((char)(B->type_flags_signed) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((char)(B->type_flags_signed) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((byte)(byte)(B->type_flags_signed) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((byte)(byte)(B->type_flags_signed) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((B->type_flags_signed >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- ((B->type_flags_signed >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- ((B->type_flags_signed & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- ((B->type_flags_signed & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(B->type_flags_signed) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(B->type_flags_signed) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(B->type_flags_signed) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(B->type_flags_signed) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((char)(B->type_flags_signed) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((char)(B->type_flags_signed) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((char)(B->type_flags_signed) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((char)(B->type_flags_signed) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(byte)(B->type_flags_signed) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(byte)(B->type_flags_signed) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(byte)(B->type_flags_signed) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(byte)(B->type_flags_signed) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
)

@partial_ptr_10_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x30
+ B->item_id & 0x30
|
- (byte)(B->type_flags_signed) & 0x30
+ B->item_id & 0x30
|
- (char)(B->type_flags_signed) & 0x30
+ B->item_id & 0x30
|
- (byte)(byte)(B->type_flags_signed) & 0x30
+ B->item_id & 0x30
|
- (B->type_flags_signed >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- (B->type_flags_signed & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((byte)(B->type_flags_signed) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((byte)(B->type_flags_signed) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((char)(B->type_flags_signed) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((char)(B->type_flags_signed) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((byte)(byte)(B->type_flags_signed) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((byte)(byte)(B->type_flags_signed) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
)

@partial_ptr_11_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_low & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- (B->type_flags_low & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((byte)(B->type_flags_low) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((byte)(B->type_flags_low) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((char)(B->type_flags_low) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((char)(B->type_flags_low) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((byte)(byte)(B->type_flags_low) & 0x30) == 0
+ (B->item_id & 0x30) == 0
|
- ((byte)(byte)(B->type_flags_low) & 0x30) != 0
+ (B->item_id & 0x30) != 0
|
- ((B->type_flags_low >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- ((B->type_flags_low >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- ((B->type_flags_low & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- ((B->type_flags_low & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(B->type_flags_low) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(B->type_flags_low) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(B->type_flags_low) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(B->type_flags_low) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((char)(B->type_flags_low) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((char)(B->type_flags_low) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((char)(B->type_flags_low) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((char)(B->type_flags_low) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(byte)(B->type_flags_low) >> 4) & 0x3) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(byte)(B->type_flags_low) >> 4) & 0x3) != 0
+ (B->item_id & 0x30) != 0
|
- (((byte)(byte)(B->type_flags_low) & 0x30) >> 4) == 0
+ (B->item_id & 0x30) == 0
|
- (((byte)(byte)(B->type_flags_low) & 0x30) >> 4) != 0
+ (B->item_id & 0x30) != 0
)

@partial_ptr_11_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_low & 0x30
+ B->item_id & 0x30
|
- (byte)(B->type_flags_low) & 0x30
+ B->item_id & 0x30
|
- (char)(B->type_flags_low) & 0x30
+ B->item_id & 0x30
|
- (byte)(byte)(B->type_flags_low) & 0x30
+ B->item_id & 0x30
|
- (B->type_flags_low >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- (B->type_flags_low & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((byte)(B->type_flags_low) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((byte)(B->type_flags_low) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((char)(B->type_flags_low) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((char)(B->type_flags_low) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
|
- ((byte)(byte)(B->type_flags_low) >> 4) & 0x3
+ (B->item_id >> 4) & 0x3
|
- ((byte)(byte)(B->type_flags_low) & 0x30) >> 4
+ (B->item_id >> 4) & 0x3
)

@partial_ptr_12_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- (B->type_flags & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((byte)(B->type_flags) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((byte)(B->type_flags) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((char)(B->type_flags) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((char)(B->type_flags) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((byte)(byte)(B->type_flags) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((byte)(byte)(B->type_flags) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
)

@partial_ptr_12_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x3f
+ B->item_id & 0x3f
|
- (byte)(B->type_flags) & 0x3f
+ B->item_id & 0x3f
|
- (char)(B->type_flags) & 0x3f
+ B->item_id & 0x3f
|
- (byte)(byte)(B->type_flags) & 0x3f
+ B->item_id & 0x3f
)

@partial_ptr_13_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- (B->type_flags_signed & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((byte)(B->type_flags_signed) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((byte)(B->type_flags_signed) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((char)(B->type_flags_signed) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((char)(B->type_flags_signed) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((byte)(byte)(B->type_flags_signed) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((byte)(byte)(B->type_flags_signed) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
)

@partial_ptr_13_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x3f
+ B->item_id & 0x3f
|
- (byte)(B->type_flags_signed) & 0x3f
+ B->item_id & 0x3f
|
- (char)(B->type_flags_signed) & 0x3f
+ B->item_id & 0x3f
|
- (byte)(byte)(B->type_flags_signed) & 0x3f
+ B->item_id & 0x3f
)

@partial_ptr_14_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_low & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- (B->type_flags_low & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((byte)(B->type_flags_low) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((byte)(B->type_flags_low) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((char)(B->type_flags_low) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((char)(B->type_flags_low) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
|
- ((byte)(byte)(B->type_flags_low) & 0x3f) == 0
+ (B->item_id & 0x3f) == 0
|
- ((byte)(byte)(B->type_flags_low) & 0x3f) != 0
+ (B->item_id & 0x3f) != 0
)

@partial_ptr_14_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_low & 0x3f
+ B->item_id & 0x3f
|
- (byte)(B->type_flags_low) & 0x3f
+ B->item_id & 0x3f
|
- (char)(B->type_flags_low) & 0x3f
+ B->item_id & 0x3f
|
- (byte)(byte)(B->type_flags_low) & 0x3f
+ B->item_id & 0x3f
)

@partial_ptr_15_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x1c0) == 0
+ (B->item_id & 0x1c0) == 0
|
- (B->type_flags & 0x1c0) != 0
+ (B->item_id & 0x1c0) != 0
|
- ((B->type_flags >> 6) & 0x7) == 0
+ (B->item_id & 0x1c0) == 0
|
- ((B->type_flags >> 6) & 0x7) != 0
+ (B->item_id & 0x1c0) != 0
|
- ((B->type_flags & 0x1c0) >> 6) == 0
+ (B->item_id & 0x1c0) == 0
|
- ((B->type_flags & 0x1c0) >> 6) != 0
+ (B->item_id & 0x1c0) != 0
)

@partial_ptr_15_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x1c0
+ B->item_id & 0x1c0
|
- (B->type_flags >> 6) & 0x7
+ B->item_id >> 6
|
- (B->type_flags & 0x1c0) >> 6
+ B->item_id >> 6
)

@partial_ptr_16_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x1c0) == 0
+ (B->item_id & 0x1c0) == 0
|
- (B->type_flags_signed & 0x1c0) != 0
+ (B->item_id & 0x1c0) != 0
|
- ((B->type_flags_signed >> 6) & 0x7) == 0
+ (B->item_id & 0x1c0) == 0
|
- ((B->type_flags_signed >> 6) & 0x7) != 0
+ (B->item_id & 0x1c0) != 0
|
- ((B->type_flags_signed & 0x1c0) >> 6) == 0
+ (B->item_id & 0x1c0) == 0
|
- ((B->type_flags_signed & 0x1c0) >> 6) != 0
+ (B->item_id & 0x1c0) != 0
)

@partial_ptr_16_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x1c0
+ B->item_id & 0x1c0
|
- (B->type_flags_signed >> 6) & 0x7
+ B->item_id >> 6
|
- (B->type_flags_signed & 0x1c0) >> 6
+ B->item_id >> 6
)

@partial_ptr_17_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x1f0) == 0
+ (B->item_id & 0x1f0) == 0
|
- (B->type_flags & 0x1f0) != 0
+ (B->item_id & 0x1f0) != 0
|
- ((B->type_flags >> 4) & 0x1f) == 0
+ (B->item_id & 0x1f0) == 0
|
- ((B->type_flags >> 4) & 0x1f) != 0
+ (B->item_id & 0x1f0) != 0
|
- ((B->type_flags & 0x1f0) >> 4) == 0
+ (B->item_id & 0x1f0) == 0
|
- ((B->type_flags & 0x1f0) >> 4) != 0
+ (B->item_id & 0x1f0) != 0
)

@partial_ptr_17_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x1f0
+ B->item_id & 0x1f0
|
- (B->type_flags >> 4) & 0x1f
+ B->item_id >> 4
|
- (B->type_flags & 0x1f0) >> 4
+ B->item_id >> 4
)

@partial_ptr_18_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x1f0) == 0
+ (B->item_id & 0x1f0) == 0
|
- (B->type_flags_signed & 0x1f0) != 0
+ (B->item_id & 0x1f0) != 0
|
- ((B->type_flags_signed >> 4) & 0x1f) == 0
+ (B->item_id & 0x1f0) == 0
|
- ((B->type_flags_signed >> 4) & 0x1f) != 0
+ (B->item_id & 0x1f0) != 0
|
- ((B->type_flags_signed & 0x1f0) >> 4) == 0
+ (B->item_id & 0x1f0) == 0
|
- ((B->type_flags_signed & 0x1f0) >> 4) != 0
+ (B->item_id & 0x1f0) != 0
)

@partial_ptr_18_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x1f0
+ B->item_id & 0x1f0
|
- (B->type_flags_signed >> 4) & 0x1f
+ B->item_id >> 4
|
- (B->type_flags_signed & 0x1f0) >> 4
+ B->item_id >> 4
)

@partial_ptr_19_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x200) == 0
+ (B->flags_res & 0x1) == 0
|
- (B->type_flags & 0x200) != 0
+ (B->flags_res & 0x1) != 0
|
- ((B->type_flags >> 9) & 0x1) == 0
+ (B->flags_res & 0x1) == 0
|
- ((B->type_flags >> 9) & 0x1) != 0
+ (B->flags_res & 0x1) != 0
|
- ((B->type_flags & 0x200) >> 9) == 0
+ (B->flags_res & 0x1) == 0
|
- ((B->type_flags & 0x200) >> 9) != 0
+ (B->flags_res & 0x1) != 0
)

@partial_ptr_19_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x200
+ (B->flags_res & 0x1) << 9
|
- (B->type_flags >> 9) & 0x1
+ B->flags_res & 0x1
|
- (B->type_flags & 0x200) >> 9
+ B->flags_res & 0x1
)

@partial_ptr_20_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x200) == 0
+ (B->flags_res & 0x1) == 0
|
- (B->type_flags_signed & 0x200) != 0
+ (B->flags_res & 0x1) != 0
|
- ((B->type_flags_signed >> 9) & 0x1) == 0
+ (B->flags_res & 0x1) == 0
|
- ((B->type_flags_signed >> 9) & 0x1) != 0
+ (B->flags_res & 0x1) != 0
|
- ((B->type_flags_signed & 0x200) >> 9) == 0
+ (B->flags_res & 0x1) == 0
|
- ((B->type_flags_signed & 0x200) >> 9) != 0
+ (B->flags_res & 0x1) != 0
)

@partial_ptr_20_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x200
+ (B->flags_res & 0x1) << 9
|
- (B->type_flags_signed >> 9) & 0x1
+ B->flags_res & 0x1
|
- (B->type_flags_signed & 0x200) >> 9
+ B->flags_res & 0x1
)

@partial_ptr_21_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_high & 0x2) == 0
+ (B->flags_res & 0x1) == 0
|
- (B->type_flags_high & 0x2) != 0
+ (B->flags_res & 0x1) != 0
|
- ((byte)(B->type_flags_high) & 0x2) == 0
+ (B->flags_res & 0x1) == 0
|
- ((byte)(B->type_flags_high) & 0x2) != 0
+ (B->flags_res & 0x1) != 0
|
- ((char)(B->type_flags_high) & 0x2) == 0
+ (B->flags_res & 0x1) == 0
|
- ((char)(B->type_flags_high) & 0x2) != 0
+ (B->flags_res & 0x1) != 0
|
- ((byte)(byte)(B->type_flags_high) & 0x2) == 0
+ (B->flags_res & 0x1) == 0
|
- ((byte)(byte)(B->type_flags_high) & 0x2) != 0
+ (B->flags_res & 0x1) != 0
|
- ((B->type_flags_high >> 1) & 0x1) == 0
+ (B->flags_res & 0x1) == 0
|
- ((B->type_flags_high >> 1) & 0x1) != 0
+ (B->flags_res & 0x1) != 0
|
- ((B->type_flags_high & 0x2) >> 1) == 0
+ (B->flags_res & 0x1) == 0
|
- ((B->type_flags_high & 0x2) >> 1) != 0
+ (B->flags_res & 0x1) != 0
|
- (((byte)(B->type_flags_high) >> 1) & 0x1) == 0
+ (B->flags_res & 0x1) == 0
|
- (((byte)(B->type_flags_high) >> 1) & 0x1) != 0
+ (B->flags_res & 0x1) != 0
|
- (((byte)(B->type_flags_high) & 0x2) >> 1) == 0
+ (B->flags_res & 0x1) == 0
|
- (((byte)(B->type_flags_high) & 0x2) >> 1) != 0
+ (B->flags_res & 0x1) != 0
|
- (((char)(B->type_flags_high) >> 1) & 0x1) == 0
+ (B->flags_res & 0x1) == 0
|
- (((char)(B->type_flags_high) >> 1) & 0x1) != 0
+ (B->flags_res & 0x1) != 0
|
- (((char)(B->type_flags_high) & 0x2) >> 1) == 0
+ (B->flags_res & 0x1) == 0
|
- (((char)(B->type_flags_high) & 0x2) >> 1) != 0
+ (B->flags_res & 0x1) != 0
|
- (((byte)(byte)(B->type_flags_high) >> 1) & 0x1) == 0
+ (B->flags_res & 0x1) == 0
|
- (((byte)(byte)(B->type_flags_high) >> 1) & 0x1) != 0
+ (B->flags_res & 0x1) != 0
|
- (((byte)(byte)(B->type_flags_high) & 0x2) >> 1) == 0
+ (B->flags_res & 0x1) == 0
|
- (((byte)(byte)(B->type_flags_high) & 0x2) >> 1) != 0
+ (B->flags_res & 0x1) != 0
)

@partial_ptr_21_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_high & 0x2
+ (B->flags_res & 0x1) << 1
|
- (byte)(B->type_flags_high) & 0x2
+ (B->flags_res & 0x1) << 1
|
- (char)(B->type_flags_high) & 0x2
+ (B->flags_res & 0x1) << 1
|
- (byte)(byte)(B->type_flags_high) & 0x2
+ (B->flags_res & 0x1) << 1
|
- (B->type_flags_high >> 1) & 0x1
+ B->flags_res & 0x1
|
- (B->type_flags_high & 0x2) >> 1
+ B->flags_res & 0x1
|
- ((byte)(B->type_flags_high) >> 1) & 0x1
+ B->flags_res & 0x1
|
- ((byte)(B->type_flags_high) & 0x2) >> 1
+ B->flags_res & 0x1
|
- ((char)(B->type_flags_high) >> 1) & 0x1
+ B->flags_res & 0x1
|
- ((char)(B->type_flags_high) & 0x2) >> 1
+ B->flags_res & 0x1
|
- ((byte)(byte)(B->type_flags_high) >> 1) & 0x1
+ B->flags_res & 0x1
|
- ((byte)(byte)(B->type_flags_high) & 0x2) >> 1
+ B->flags_res & 0x1
)

@partial_ptr_22_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x400) == 0
+ (B->flags_res & 0x2) == 0
|
- (B->type_flags & 0x400) != 0
+ (B->flags_res & 0x2) != 0
|
- ((B->type_flags >> 10) & 0x1) == 0
+ (B->flags_res & 0x2) == 0
|
- ((B->type_flags >> 10) & 0x1) != 0
+ (B->flags_res & 0x2) != 0
|
- ((B->type_flags & 0x400) >> 10) == 0
+ (B->flags_res & 0x2) == 0
|
- ((B->type_flags & 0x400) >> 10) != 0
+ (B->flags_res & 0x2) != 0
)

@partial_ptr_22_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x400
+ (B->flags_res & 0x2) << 9
|
- (B->type_flags >> 10) & 0x1
+ (B->flags_res >> 1) & 0x1
|
- (B->type_flags & 0x400) >> 10
+ (B->flags_res >> 1) & 0x1
)

@partial_ptr_23_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x400) == 0
+ (B->flags_res & 0x2) == 0
|
- (B->type_flags_signed & 0x400) != 0
+ (B->flags_res & 0x2) != 0
|
- ((B->type_flags_signed >> 10) & 0x1) == 0
+ (B->flags_res & 0x2) == 0
|
- ((B->type_flags_signed >> 10) & 0x1) != 0
+ (B->flags_res & 0x2) != 0
|
- ((B->type_flags_signed & 0x400) >> 10) == 0
+ (B->flags_res & 0x2) == 0
|
- ((B->type_flags_signed & 0x400) >> 10) != 0
+ (B->flags_res & 0x2) != 0
)

@partial_ptr_23_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x400
+ (B->flags_res & 0x2) << 9
|
- (B->type_flags_signed >> 10) & 0x1
+ (B->flags_res >> 1) & 0x1
|
- (B->type_flags_signed & 0x400) >> 10
+ (B->flags_res >> 1) & 0x1
)

@partial_ptr_24_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_high & 0x4) == 0
+ (B->flags_res & 0x2) == 0
|
- (B->type_flags_high & 0x4) != 0
+ (B->flags_res & 0x2) != 0
|
- ((byte)(B->type_flags_high) & 0x4) == 0
+ (B->flags_res & 0x2) == 0
|
- ((byte)(B->type_flags_high) & 0x4) != 0
+ (B->flags_res & 0x2) != 0
|
- ((char)(B->type_flags_high) & 0x4) == 0
+ (B->flags_res & 0x2) == 0
|
- ((char)(B->type_flags_high) & 0x4) != 0
+ (B->flags_res & 0x2) != 0
|
- ((byte)(byte)(B->type_flags_high) & 0x4) == 0
+ (B->flags_res & 0x2) == 0
|
- ((byte)(byte)(B->type_flags_high) & 0x4) != 0
+ (B->flags_res & 0x2) != 0
|
- ((B->type_flags_high >> 2) & 0x1) == 0
+ (B->flags_res & 0x2) == 0
|
- ((B->type_flags_high >> 2) & 0x1) != 0
+ (B->flags_res & 0x2) != 0
|
- ((B->type_flags_high & 0x4) >> 2) == 0
+ (B->flags_res & 0x2) == 0
|
- ((B->type_flags_high & 0x4) >> 2) != 0
+ (B->flags_res & 0x2) != 0
|
- (((byte)(B->type_flags_high) >> 2) & 0x1) == 0
+ (B->flags_res & 0x2) == 0
|
- (((byte)(B->type_flags_high) >> 2) & 0x1) != 0
+ (B->flags_res & 0x2) != 0
|
- (((byte)(B->type_flags_high) & 0x4) >> 2) == 0
+ (B->flags_res & 0x2) == 0
|
- (((byte)(B->type_flags_high) & 0x4) >> 2) != 0
+ (B->flags_res & 0x2) != 0
|
- (((char)(B->type_flags_high) >> 2) & 0x1) == 0
+ (B->flags_res & 0x2) == 0
|
- (((char)(B->type_flags_high) >> 2) & 0x1) != 0
+ (B->flags_res & 0x2) != 0
|
- (((char)(B->type_flags_high) & 0x4) >> 2) == 0
+ (B->flags_res & 0x2) == 0
|
- (((char)(B->type_flags_high) & 0x4) >> 2) != 0
+ (B->flags_res & 0x2) != 0
|
- (((byte)(byte)(B->type_flags_high) >> 2) & 0x1) == 0
+ (B->flags_res & 0x2) == 0
|
- (((byte)(byte)(B->type_flags_high) >> 2) & 0x1) != 0
+ (B->flags_res & 0x2) != 0
|
- (((byte)(byte)(B->type_flags_high) & 0x4) >> 2) == 0
+ (B->flags_res & 0x2) == 0
|
- (((byte)(byte)(B->type_flags_high) & 0x4) >> 2) != 0
+ (B->flags_res & 0x2) != 0
)

@partial_ptr_24_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_high & 0x4
+ (B->flags_res & 0x2) << 1
|
- (byte)(B->type_flags_high) & 0x4
+ (B->flags_res & 0x2) << 1
|
- (char)(B->type_flags_high) & 0x4
+ (B->flags_res & 0x2) << 1
|
- (byte)(byte)(B->type_flags_high) & 0x4
+ (B->flags_res & 0x2) << 1
|
- (B->type_flags_high >> 2) & 0x1
+ (B->flags_res >> 1) & 0x1
|
- (B->type_flags_high & 0x4) >> 2
+ (B->flags_res >> 1) & 0x1
|
- ((byte)(B->type_flags_high) >> 2) & 0x1
+ (B->flags_res >> 1) & 0x1
|
- ((byte)(B->type_flags_high) & 0x4) >> 2
+ (B->flags_res >> 1) & 0x1
|
- ((char)(B->type_flags_high) >> 2) & 0x1
+ (B->flags_res >> 1) & 0x1
|
- ((char)(B->type_flags_high) & 0x4) >> 2
+ (B->flags_res >> 1) & 0x1
|
- ((byte)(byte)(B->type_flags_high) >> 2) & 0x1
+ (B->flags_res >> 1) & 0x1
|
- ((byte)(byte)(B->type_flags_high) & 0x4) >> 2
+ (B->flags_res >> 1) & 0x1
)

@partial_ptr_25_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags & 0x800) == 0
+ (B->flags_res & 0x4) == 0
|
- (B->type_flags & 0x800) != 0
+ (B->flags_res & 0x4) != 0
|
- ((B->type_flags >> 11) & 0x1) == 0
+ (B->flags_res & 0x4) == 0
|
- ((B->type_flags >> 11) & 0x1) != 0
+ (B->flags_res & 0x4) != 0
|
- ((B->type_flags & 0x800) >> 11) == 0
+ (B->flags_res & 0x4) == 0
|
- ((B->type_flags & 0x800) >> 11) != 0
+ (B->flags_res & 0x4) != 0
)

@partial_ptr_25_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags & 0x800
+ (B->flags_res & 0x4) << 9
|
- (B->type_flags >> 11) & 0x1
+ B->flags_res >> 2
|
- (B->type_flags & 0x800) >> 11
+ B->flags_res >> 2
)

@partial_ptr_26_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_signed & 0x800) == 0
+ (B->flags_res & 0x4) == 0
|
- (B->type_flags_signed & 0x800) != 0
+ (B->flags_res & 0x4) != 0
|
- ((B->type_flags_signed >> 11) & 0x1) == 0
+ (B->flags_res & 0x4) == 0
|
- ((B->type_flags_signed >> 11) & 0x1) != 0
+ (B->flags_res & 0x4) != 0
|
- ((B->type_flags_signed & 0x800) >> 11) == 0
+ (B->flags_res & 0x4) == 0
|
- ((B->type_flags_signed & 0x800) >> 11) != 0
+ (B->flags_res & 0x4) != 0
)

@partial_ptr_26_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_signed & 0x800
+ (B->flags_res & 0x4) << 9
|
- (B->type_flags_signed >> 11) & 0x1
+ B->flags_res >> 2
|
- (B->type_flags_signed & 0x800) >> 11
+ B->flags_res >> 2
)

@partial_ptr_27_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->type_flags_high & 0x8) == 0
+ (B->flags_res & 0x4) == 0
|
- (B->type_flags_high & 0x8) != 0
+ (B->flags_res & 0x4) != 0
|
- ((byte)(B->type_flags_high) & 0x8) == 0
+ (B->flags_res & 0x4) == 0
|
- ((byte)(B->type_flags_high) & 0x8) != 0
+ (B->flags_res & 0x4) != 0
|
- ((char)(B->type_flags_high) & 0x8) == 0
+ (B->flags_res & 0x4) == 0
|
- ((char)(B->type_flags_high) & 0x8) != 0
+ (B->flags_res & 0x4) != 0
|
- ((byte)(byte)(B->type_flags_high) & 0x8) == 0
+ (B->flags_res & 0x4) == 0
|
- ((byte)(byte)(B->type_flags_high) & 0x8) != 0
+ (B->flags_res & 0x4) != 0
|
- ((B->type_flags_high >> 3) & 0x1) == 0
+ (B->flags_res & 0x4) == 0
|
- ((B->type_flags_high >> 3) & 0x1) != 0
+ (B->flags_res & 0x4) != 0
|
- ((B->type_flags_high & 0x8) >> 3) == 0
+ (B->flags_res & 0x4) == 0
|
- ((B->type_flags_high & 0x8) >> 3) != 0
+ (B->flags_res & 0x4) != 0
|
- (((byte)(B->type_flags_high) >> 3) & 0x1) == 0
+ (B->flags_res & 0x4) == 0
|
- (((byte)(B->type_flags_high) >> 3) & 0x1) != 0
+ (B->flags_res & 0x4) != 0
|
- (((byte)(B->type_flags_high) & 0x8) >> 3) == 0
+ (B->flags_res & 0x4) == 0
|
- (((byte)(B->type_flags_high) & 0x8) >> 3) != 0
+ (B->flags_res & 0x4) != 0
|
- (((char)(B->type_flags_high) >> 3) & 0x1) == 0
+ (B->flags_res & 0x4) == 0
|
- (((char)(B->type_flags_high) >> 3) & 0x1) != 0
+ (B->flags_res & 0x4) != 0
|
- (((char)(B->type_flags_high) & 0x8) >> 3) == 0
+ (B->flags_res & 0x4) == 0
|
- (((char)(B->type_flags_high) & 0x8) >> 3) != 0
+ (B->flags_res & 0x4) != 0
|
- (((byte)(byte)(B->type_flags_high) >> 3) & 0x1) == 0
+ (B->flags_res & 0x4) == 0
|
- (((byte)(byte)(B->type_flags_high) >> 3) & 0x1) != 0
+ (B->flags_res & 0x4) != 0
|
- (((byte)(byte)(B->type_flags_high) & 0x8) >> 3) == 0
+ (B->flags_res & 0x4) == 0
|
- (((byte)(byte)(B->type_flags_high) & 0x8) >> 3) != 0
+ (B->flags_res & 0x4) != 0
)

@partial_ptr_27_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->type_flags_high & 0x8
+ (B->flags_res & 0x4) << 1
|
- (byte)(B->type_flags_high) & 0x8
+ (B->flags_res & 0x4) << 1
|
- (char)(B->type_flags_high) & 0x8
+ (B->flags_res & 0x4) << 1
|
- (byte)(byte)(B->type_flags_high) & 0x8
+ (B->flags_res & 0x4) << 1
|
- (B->type_flags_high >> 3) & 0x1
+ B->flags_res >> 2
|
- (B->type_flags_high & 0x8) >> 3
+ B->flags_res >> 2
|
- ((byte)(B->type_flags_high) >> 3) & 0x1
+ B->flags_res >> 2
|
- ((byte)(B->type_flags_high) & 0x8) >> 3
+ B->flags_res >> 2
|
- ((char)(B->type_flags_high) >> 3) & 0x1
+ B->flags_res >> 2
|
- ((char)(B->type_flags_high) & 0x8) >> 3
+ B->flags_res >> 2
|
- ((byte)(byte)(B->type_flags_high) >> 3) & 0x1
+ B->flags_res >> 2
|
- ((byte)(byte)(B->type_flags_high) & 0x8) >> 3
+ B->flags_res >> 2
)

@partial_ptr_28_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->position_word & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- (B->position_word & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((byte)(B->position_word) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((byte)(B->position_word) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((char)(B->position_word) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((char)(B->position_word) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((byte)(byte)(B->position_word) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((byte)(byte)(B->position_word) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((B->position_word >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- ((B->position_word >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- ((B->position_word & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- ((B->position_word & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(B->position_word) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(B->position_word) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(B->position_word) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(B->position_word) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((char)(B->position_word) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((char)(B->position_word) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((char)(B->position_word) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((char)(B->position_word) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(byte)(B->position_word) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(byte)(B->position_word) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(byte)(B->position_word) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(byte)(B->position_word) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
)

@partial_ptr_28_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->position_word & 0x78
+ B->zpos & 0x78
|
- (byte)(B->position_word) & 0x78
+ B->zpos & 0x78
|
- (char)(B->position_word) & 0x78
+ B->zpos & 0x78
|
- (byte)(byte)(B->position_word) & 0x78
+ B->zpos & 0x78
|
- (B->position_word >> 3) & 0xf
+ B->zpos >> 3
|
- (B->position_word & 0x78) >> 3
+ B->zpos >> 3
|
- ((byte)(B->position_word) >> 3) & 0xf
+ B->zpos >> 3
|
- ((byte)(B->position_word) & 0x78) >> 3
+ B->zpos >> 3
|
- ((char)(B->position_word) >> 3) & 0xf
+ B->zpos >> 3
|
- ((char)(B->position_word) & 0x78) >> 3
+ B->zpos >> 3
|
- ((byte)(byte)(B->position_word) >> 3) & 0xf
+ B->zpos >> 3
|
- ((byte)(byte)(B->position_word) & 0x78) >> 3
+ B->zpos >> 3
)

@partial_ptr_29_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->position_word_signed & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- (B->position_word_signed & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((byte)(B->position_word_signed) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((byte)(B->position_word_signed) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((char)(B->position_word_signed) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((char)(B->position_word_signed) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((byte)(byte)(B->position_word_signed) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((byte)(byte)(B->position_word_signed) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((B->position_word_signed >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- ((B->position_word_signed >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- ((B->position_word_signed & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- ((B->position_word_signed & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(B->position_word_signed) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(B->position_word_signed) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(B->position_word_signed) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(B->position_word_signed) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((char)(B->position_word_signed) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((char)(B->position_word_signed) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((char)(B->position_word_signed) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((char)(B->position_word_signed) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(byte)(B->position_word_signed) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(byte)(B->position_word_signed) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(byte)(B->position_word_signed) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(byte)(B->position_word_signed) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
)

@partial_ptr_29_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->position_word_signed & 0x78
+ B->zpos & 0x78
|
- (byte)(B->position_word_signed) & 0x78
+ B->zpos & 0x78
|
- (char)(B->position_word_signed) & 0x78
+ B->zpos & 0x78
|
- (byte)(byte)(B->position_word_signed) & 0x78
+ B->zpos & 0x78
|
- (B->position_word_signed >> 3) & 0xf
+ B->zpos >> 3
|
- (B->position_word_signed & 0x78) >> 3
+ B->zpos >> 3
|
- ((byte)(B->position_word_signed) >> 3) & 0xf
+ B->zpos >> 3
|
- ((byte)(B->position_word_signed) & 0x78) >> 3
+ B->zpos >> 3
|
- ((char)(B->position_word_signed) >> 3) & 0xf
+ B->zpos >> 3
|
- ((char)(B->position_word_signed) & 0x78) >> 3
+ B->zpos >> 3
|
- ((byte)(byte)(B->position_word_signed) >> 3) & 0xf
+ B->zpos >> 3
|
- ((byte)(byte)(B->position_word_signed) & 0x78) >> 3
+ B->zpos >> 3
)

@partial_ptr_30_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->position_word_low & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- (B->position_word_low & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((byte)(B->position_word_low) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((byte)(B->position_word_low) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((char)(B->position_word_low) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((char)(B->position_word_low) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((byte)(byte)(B->position_word_low) & 0x78) == 0
+ (B->zpos & 0x78) == 0
|
- ((byte)(byte)(B->position_word_low) & 0x78) != 0
+ (B->zpos & 0x78) != 0
|
- ((B->position_word_low >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- ((B->position_word_low >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- ((B->position_word_low & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- ((B->position_word_low & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(B->position_word_low) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(B->position_word_low) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(B->position_word_low) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(B->position_word_low) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((char)(B->position_word_low) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((char)(B->position_word_low) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((char)(B->position_word_low) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((char)(B->position_word_low) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(byte)(B->position_word_low) >> 3) & 0xf) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(byte)(B->position_word_low) >> 3) & 0xf) != 0
+ (B->zpos & 0x78) != 0
|
- (((byte)(byte)(B->position_word_low) & 0x78) >> 3) == 0
+ (B->zpos & 0x78) == 0
|
- (((byte)(byte)(B->position_word_low) & 0x78) >> 3) != 0
+ (B->zpos & 0x78) != 0
)

@partial_ptr_30_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->position_word_low & 0x78
+ B->zpos & 0x78
|
- (byte)(B->position_word_low) & 0x78
+ B->zpos & 0x78
|
- (char)(B->position_word_low) & 0x78
+ B->zpos & 0x78
|
- (byte)(byte)(B->position_word_low) & 0x78
+ B->zpos & 0x78
|
- (B->position_word_low >> 3) & 0xf
+ B->zpos >> 3
|
- (B->position_word_low & 0x78) >> 3
+ B->zpos >> 3
|
- ((byte)(B->position_word_low) >> 3) & 0xf
+ B->zpos >> 3
|
- ((byte)(B->position_word_low) & 0x78) >> 3
+ B->zpos >> 3
|
- ((char)(B->position_word_low) >> 3) & 0xf
+ B->zpos >> 3
|
- ((char)(B->position_word_low) & 0x78) >> 3
+ B->zpos >> 3
|
- ((byte)(byte)(B->position_word_low) >> 3) & 0xf
+ B->zpos >> 3
|
- ((byte)(byte)(B->position_word_low) & 0x78) >> 3
+ B->zpos >> 3
)

@partial_ptr_31_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->chain_word & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- (B->chain_word & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((byte)(B->chain_word) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((byte)(B->chain_word) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((char)(B->chain_word) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((char)(B->chain_word) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((byte)(byte)(B->chain_word) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((byte)(byte)(B->chain_word) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((B->chain_word >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- ((B->chain_word >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- ((B->chain_word & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- ((B->chain_word & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(B->chain_word) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(B->chain_word) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(B->chain_word) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(B->chain_word) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((char)(B->chain_word) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((char)(B->chain_word) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((char)(B->chain_word) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((char)(B->chain_word) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(byte)(B->chain_word) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(byte)(B->chain_word) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(byte)(B->chain_word) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(byte)(B->chain_word) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
)

@partial_ptr_31_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->chain_word & 0x30
+ B->quality & 0x30
|
- (byte)(B->chain_word) & 0x30
+ B->quality & 0x30
|
- (char)(B->chain_word) & 0x30
+ B->quality & 0x30
|
- (byte)(byte)(B->chain_word) & 0x30
+ B->quality & 0x30
|
- (B->chain_word >> 4) & 0x3
+ B->quality >> 4
|
- (B->chain_word & 0x30) >> 4
+ B->quality >> 4
|
- ((byte)(B->chain_word) >> 4) & 0x3
+ B->quality >> 4
|
- ((byte)(B->chain_word) & 0x30) >> 4
+ B->quality >> 4
|
- ((char)(B->chain_word) >> 4) & 0x3
+ B->quality >> 4
|
- ((char)(B->chain_word) & 0x30) >> 4
+ B->quality >> 4
|
- ((byte)(byte)(B->chain_word) >> 4) & 0x3
+ B->quality >> 4
|
- ((byte)(byte)(B->chain_word) & 0x30) >> 4
+ B->quality >> 4
)

@partial_ptr_32_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->chain_word_signed & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- (B->chain_word_signed & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((byte)(B->chain_word_signed) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((byte)(B->chain_word_signed) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((char)(B->chain_word_signed) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((char)(B->chain_word_signed) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((byte)(byte)(B->chain_word_signed) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((byte)(byte)(B->chain_word_signed) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((B->chain_word_signed >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- ((B->chain_word_signed >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- ((B->chain_word_signed & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- ((B->chain_word_signed & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(B->chain_word_signed) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(B->chain_word_signed) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(B->chain_word_signed) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(B->chain_word_signed) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((char)(B->chain_word_signed) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((char)(B->chain_word_signed) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((char)(B->chain_word_signed) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((char)(B->chain_word_signed) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(byte)(B->chain_word_signed) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(byte)(B->chain_word_signed) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(byte)(B->chain_word_signed) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(byte)(B->chain_word_signed) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
)

@partial_ptr_32_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->chain_word_signed & 0x30
+ B->quality & 0x30
|
- (byte)(B->chain_word_signed) & 0x30
+ B->quality & 0x30
|
- (char)(B->chain_word_signed) & 0x30
+ B->quality & 0x30
|
- (byte)(byte)(B->chain_word_signed) & 0x30
+ B->quality & 0x30
|
- (B->chain_word_signed >> 4) & 0x3
+ B->quality >> 4
|
- (B->chain_word_signed & 0x30) >> 4
+ B->quality >> 4
|
- ((byte)(B->chain_word_signed) >> 4) & 0x3
+ B->quality >> 4
|
- ((byte)(B->chain_word_signed) & 0x30) >> 4
+ B->quality >> 4
|
- ((char)(B->chain_word_signed) >> 4) & 0x3
+ B->quality >> 4
|
- ((char)(B->chain_word_signed) & 0x30) >> 4
+ B->quality >> 4
|
- ((byte)(byte)(B->chain_word_signed) >> 4) & 0x3
+ B->quality >> 4
|
- ((byte)(byte)(B->chain_word_signed) & 0x30) >> 4
+ B->quality >> 4
)

@partial_ptr_33_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->chain_word_low & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- (B->chain_word_low & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((byte)(B->chain_word_low) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((byte)(B->chain_word_low) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((char)(B->chain_word_low) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((char)(B->chain_word_low) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((byte)(byte)(B->chain_word_low) & 0x30) == 0
+ (B->quality & 0x30) == 0
|
- ((byte)(byte)(B->chain_word_low) & 0x30) != 0
+ (B->quality & 0x30) != 0
|
- ((B->chain_word_low >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- ((B->chain_word_low >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- ((B->chain_word_low & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- ((B->chain_word_low & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(B->chain_word_low) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(B->chain_word_low) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(B->chain_word_low) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(B->chain_word_low) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((char)(B->chain_word_low) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((char)(B->chain_word_low) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((char)(B->chain_word_low) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((char)(B->chain_word_low) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(byte)(B->chain_word_low) >> 4) & 0x3) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(byte)(B->chain_word_low) >> 4) & 0x3) != 0
+ (B->quality & 0x30) != 0
|
- (((byte)(byte)(B->chain_word_low) & 0x30) >> 4) == 0
+ (B->quality & 0x30) == 0
|
- (((byte)(byte)(B->chain_word_low) & 0x30) >> 4) != 0
+ (B->quality & 0x30) != 0
)

@partial_ptr_33_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->chain_word_low & 0x30
+ B->quality & 0x30
|
- (byte)(B->chain_word_low) & 0x30
+ B->quality & 0x30
|
- (char)(B->chain_word_low) & 0x30
+ B->quality & 0x30
|
- (byte)(byte)(B->chain_word_low) & 0x30
+ B->quality & 0x30
|
- (B->chain_word_low >> 4) & 0x3
+ B->quality >> 4
|
- (B->chain_word_low & 0x30) >> 4
+ B->quality >> 4
|
- ((byte)(B->chain_word_low) >> 4) & 0x3
+ B->quality >> 4
|
- ((byte)(B->chain_word_low) & 0x30) >> 4
+ B->quality >> 4
|
- ((char)(B->chain_word_low) >> 4) & 0x3
+ B->quality >> 4
|
- ((char)(B->chain_word_low) & 0x30) >> 4
+ B->quality >> 4
|
- ((byte)(byte)(B->chain_word_low) >> 4) & 0x3
+ B->quality >> 4
|
- ((byte)(byte)(B->chain_word_low) & 0x30) >> 4
+ B->quality >> 4
)

@partial_ptr_34_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- (B->link_word & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((byte)(B->link_word) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((byte)(B->link_word) & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((char)(B->link_word) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((char)(B->link_word) & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((byte)(byte)(B->link_word) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((byte)(byte)(B->link_word) & 0x7) != 0
+ (B->owner & 0x7) != 0
)

@partial_ptr_34_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word & 0x7
+ B->owner & 0x7
|
- (byte)(B->link_word) & 0x7
+ B->owner & 0x7
|
- (char)(B->link_word) & 0x7
+ B->owner & 0x7
|
- (byte)(byte)(B->link_word) & 0x7
+ B->owner & 0x7
)

@partial_ptr_35_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_signed & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- (B->link_word_signed & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((byte)(B->link_word_signed) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((byte)(B->link_word_signed) & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((char)(B->link_word_signed) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((char)(B->link_word_signed) & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((byte)(byte)(B->link_word_signed) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((byte)(byte)(B->link_word_signed) & 0x7) != 0
+ (B->owner & 0x7) != 0
)

@partial_ptr_35_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_signed & 0x7
+ B->owner & 0x7
|
- (byte)(B->link_word_signed) & 0x7
+ B->owner & 0x7
|
- (char)(B->link_word_signed) & 0x7
+ B->owner & 0x7
|
- (byte)(byte)(B->link_word_signed) & 0x7
+ B->owner & 0x7
)

@partial_ptr_36_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_low & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- (B->link_word_low & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((byte)(B->link_word_low) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((byte)(B->link_word_low) & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((char)(B->link_word_low) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((char)(B->link_word_low) & 0x7) != 0
+ (B->owner & 0x7) != 0
|
- ((byte)(byte)(B->link_word_low) & 0x7) == 0
+ (B->owner & 0x7) == 0
|
- ((byte)(byte)(B->link_word_low) & 0x7) != 0
+ (B->owner & 0x7) != 0
)

@partial_ptr_36_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_low & 0x7
+ B->owner & 0x7
|
- (byte)(B->link_word_low) & 0x7
+ B->owner & 0x7
|
- (char)(B->link_word_low) & 0x7
+ B->owner & 0x7
|
- (byte)(byte)(B->link_word_low) & 0x7
+ B->owner & 0x7
)

@partial_ptr_37_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- (B->link_word & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((byte)(B->link_word) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((byte)(B->link_word) & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((char)(B->link_word) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((char)(B->link_word) & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((byte)(byte)(B->link_word) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((byte)(byte)(B->link_word) & 0xf) != 0
+ (B->owner & 0xf) != 0
)

@partial_ptr_37_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word & 0xf
+ B->owner & 0xf
|
- (byte)(B->link_word) & 0xf
+ B->owner & 0xf
|
- (char)(B->link_word) & 0xf
+ B->owner & 0xf
|
- (byte)(byte)(B->link_word) & 0xf
+ B->owner & 0xf
)

@partial_ptr_38_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_signed & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- (B->link_word_signed & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((byte)(B->link_word_signed) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((byte)(B->link_word_signed) & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((char)(B->link_word_signed) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((char)(B->link_word_signed) & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((byte)(byte)(B->link_word_signed) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((byte)(byte)(B->link_word_signed) & 0xf) != 0
+ (B->owner & 0xf) != 0
)

@partial_ptr_38_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_signed & 0xf
+ B->owner & 0xf
|
- (byte)(B->link_word_signed) & 0xf
+ B->owner & 0xf
|
- (char)(B->link_word_signed) & 0xf
+ B->owner & 0xf
|
- (byte)(byte)(B->link_word_signed) & 0xf
+ B->owner & 0xf
)

@partial_ptr_39_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_low & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- (B->link_word_low & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((byte)(B->link_word_low) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((byte)(B->link_word_low) & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((char)(B->link_word_low) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((char)(B->link_word_low) & 0xf) != 0
+ (B->owner & 0xf) != 0
|
- ((byte)(byte)(B->link_word_low) & 0xf) == 0
+ (B->owner & 0xf) == 0
|
- ((byte)(byte)(B->link_word_low) & 0xf) != 0
+ (B->owner & 0xf) != 0
)

@partial_ptr_39_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_low & 0xf
+ B->owner & 0xf
|
- (byte)(B->link_word_low) & 0xf
+ B->owner & 0xf
|
- (char)(B->link_word_low) & 0xf
+ B->owner & 0xf
|
- (byte)(byte)(B->link_word_low) & 0xf
+ B->owner & 0xf
)

@partial_ptr_40_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- (B->link_word & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((byte)(B->link_word) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((byte)(B->link_word) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((char)(B->link_word) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((char)(B->link_word) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((byte)(byte)(B->link_word) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((byte)(byte)(B->link_word) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
)

@partial_ptr_40_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word & 0x1f
+ B->owner & 0x1f
|
- (byte)(B->link_word) & 0x1f
+ B->owner & 0x1f
|
- (char)(B->link_word) & 0x1f
+ B->owner & 0x1f
|
- (byte)(byte)(B->link_word) & 0x1f
+ B->owner & 0x1f
)

@partial_ptr_41_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_signed & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- (B->link_word_signed & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((byte)(B->link_word_signed) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((byte)(B->link_word_signed) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((char)(B->link_word_signed) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((char)(B->link_word_signed) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((byte)(byte)(B->link_word_signed) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((byte)(byte)(B->link_word_signed) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
)

@partial_ptr_41_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_signed & 0x1f
+ B->owner & 0x1f
|
- (byte)(B->link_word_signed) & 0x1f
+ B->owner & 0x1f
|
- (char)(B->link_word_signed) & 0x1f
+ B->owner & 0x1f
|
- (byte)(byte)(B->link_word_signed) & 0x1f
+ B->owner & 0x1f
)

@partial_ptr_42_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_low & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- (B->link_word_low & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((byte)(B->link_word_low) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((byte)(B->link_word_low) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((char)(B->link_word_low) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((char)(B->link_word_low) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
|
- ((byte)(byte)(B->link_word_low) & 0x1f) == 0
+ (B->owner & 0x1f) == 0
|
- ((byte)(byte)(B->link_word_low) & 0x1f) != 0
+ (B->owner & 0x1f) != 0
)

@partial_ptr_42_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_low & 0x1f
+ B->owner & 0x1f
|
- (byte)(B->link_word_low) & 0x1f
+ B->owner & 0x1f
|
- (char)(B->link_word_low) & 0x1f
+ B->owner & 0x1f
|
- (byte)(byte)(B->link_word_low) & 0x1f
+ B->owner & 0x1f
)

@partial_ptr_43_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- (B->link_word & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((byte)(B->link_word) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((byte)(B->link_word) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((char)(B->link_word) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((char)(B->link_word) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((byte)(byte)(B->link_word) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((byte)(byte)(B->link_word) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((B->link_word >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- ((B->link_word >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- ((B->link_word & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- ((B->link_word & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(B->link_word) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(B->link_word) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(B->link_word) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(B->link_word) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((char)(B->link_word) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((char)(B->link_word) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((char)(B->link_word) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((char)(B->link_word) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(byte)(B->link_word) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(byte)(B->link_word) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(byte)(B->link_word) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(byte)(B->link_word) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
)

@partial_ptr_43_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word & 0x30
+ B->owner & 0x30
|
- (byte)(B->link_word) & 0x30
+ B->owner & 0x30
|
- (char)(B->link_word) & 0x30
+ B->owner & 0x30
|
- (byte)(byte)(B->link_word) & 0x30
+ B->owner & 0x30
|
- (B->link_word >> 4) & 0x3
+ B->owner >> 4
|
- (B->link_word & 0x30) >> 4
+ B->owner >> 4
|
- ((byte)(B->link_word) >> 4) & 0x3
+ B->owner >> 4
|
- ((byte)(B->link_word) & 0x30) >> 4
+ B->owner >> 4
|
- ((char)(B->link_word) >> 4) & 0x3
+ B->owner >> 4
|
- ((char)(B->link_word) & 0x30) >> 4
+ B->owner >> 4
|
- ((byte)(byte)(B->link_word) >> 4) & 0x3
+ B->owner >> 4
|
- ((byte)(byte)(B->link_word) & 0x30) >> 4
+ B->owner >> 4
)

@partial_ptr_44_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_signed & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- (B->link_word_signed & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((byte)(B->link_word_signed) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((byte)(B->link_word_signed) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((char)(B->link_word_signed) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((char)(B->link_word_signed) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((byte)(byte)(B->link_word_signed) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((byte)(byte)(B->link_word_signed) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((B->link_word_signed >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- ((B->link_word_signed >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- ((B->link_word_signed & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- ((B->link_word_signed & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(B->link_word_signed) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(B->link_word_signed) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(B->link_word_signed) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(B->link_word_signed) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((char)(B->link_word_signed) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((char)(B->link_word_signed) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((char)(B->link_word_signed) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((char)(B->link_word_signed) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(byte)(B->link_word_signed) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(byte)(B->link_word_signed) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(byte)(B->link_word_signed) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(byte)(B->link_word_signed) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
)

@partial_ptr_44_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_signed & 0x30
+ B->owner & 0x30
|
- (byte)(B->link_word_signed) & 0x30
+ B->owner & 0x30
|
- (char)(B->link_word_signed) & 0x30
+ B->owner & 0x30
|
- (byte)(byte)(B->link_word_signed) & 0x30
+ B->owner & 0x30
|
- (B->link_word_signed >> 4) & 0x3
+ B->owner >> 4
|
- (B->link_word_signed & 0x30) >> 4
+ B->owner >> 4
|
- ((byte)(B->link_word_signed) >> 4) & 0x3
+ B->owner >> 4
|
- ((byte)(B->link_word_signed) & 0x30) >> 4
+ B->owner >> 4
|
- ((char)(B->link_word_signed) >> 4) & 0x3
+ B->owner >> 4
|
- ((char)(B->link_word_signed) & 0x30) >> 4
+ B->owner >> 4
|
- ((byte)(byte)(B->link_word_signed) >> 4) & 0x3
+ B->owner >> 4
|
- ((byte)(byte)(B->link_word_signed) & 0x30) >> 4
+ B->owner >> 4
)

@partial_ptr_45_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_low & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- (B->link_word_low & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((byte)(B->link_word_low) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((byte)(B->link_word_low) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((char)(B->link_word_low) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((char)(B->link_word_low) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((byte)(byte)(B->link_word_low) & 0x30) == 0
+ (B->owner & 0x30) == 0
|
- ((byte)(byte)(B->link_word_low) & 0x30) != 0
+ (B->owner & 0x30) != 0
|
- ((B->link_word_low >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- ((B->link_word_low >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- ((B->link_word_low & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- ((B->link_word_low & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(B->link_word_low) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(B->link_word_low) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(B->link_word_low) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(B->link_word_low) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((char)(B->link_word_low) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((char)(B->link_word_low) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((char)(B->link_word_low) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((char)(B->link_word_low) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(byte)(B->link_word_low) >> 4) & 0x3) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(byte)(B->link_word_low) >> 4) & 0x3) != 0
+ (B->owner & 0x30) != 0
|
- (((byte)(byte)(B->link_word_low) & 0x30) >> 4) == 0
+ (B->owner & 0x30) == 0
|
- (((byte)(byte)(B->link_word_low) & 0x30) >> 4) != 0
+ (B->owner & 0x30) != 0
)

@partial_ptr_45_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_low & 0x30
+ B->owner & 0x30
|
- (byte)(B->link_word_low) & 0x30
+ B->owner & 0x30
|
- (char)(B->link_word_low) & 0x30
+ B->owner & 0x30
|
- (byte)(byte)(B->link_word_low) & 0x30
+ B->owner & 0x30
|
- (B->link_word_low >> 4) & 0x3
+ B->owner >> 4
|
- (B->link_word_low & 0x30) >> 4
+ B->owner >> 4
|
- ((byte)(B->link_word_low) >> 4) & 0x3
+ B->owner >> 4
|
- ((byte)(B->link_word_low) & 0x30) >> 4
+ B->owner >> 4
|
- ((char)(B->link_word_low) >> 4) & 0x3
+ B->owner >> 4
|
- ((char)(B->link_word_low) & 0x30) >> 4
+ B->owner >> 4
|
- ((byte)(byte)(B->link_word_low) >> 4) & 0x3
+ B->owner >> 4
|
- ((byte)(byte)(B->link_word_low) & 0x30) >> 4
+ B->owner >> 4
)

@partial_ptr_46_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word & 0x7fc0) == 0
+ (B->link & 0x1ff) == 0
|
- (B->link_word & 0x7fc0) != 0
+ (B->link & 0x1ff) != 0
|
- ((B->link_word >> 6) & 0x1ff) == 0
+ (B->link & 0x1ff) == 0
|
- ((B->link_word >> 6) & 0x1ff) != 0
+ (B->link & 0x1ff) != 0
|
- ((B->link_word & 0x7fc0) >> 6) == 0
+ (B->link & 0x1ff) == 0
|
- ((B->link_word & 0x7fc0) >> 6) != 0
+ (B->link & 0x1ff) != 0
)

@partial_ptr_46_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word & 0x7fc0
+ (B->link & 0x1ff) << 6
|
- (B->link_word >> 6) & 0x1ff
+ B->link & 0x1ff
|
- (B->link_word & 0x7fc0) >> 6
+ B->link & 0x1ff
)

@partial_ptr_47_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_signed & 0x7fc0) == 0
+ (B->link & 0x1ff) == 0
|
- (B->link_word_signed & 0x7fc0) != 0
+ (B->link & 0x1ff) != 0
|
- ((B->link_word_signed >> 6) & 0x1ff) == 0
+ (B->link & 0x1ff) == 0
|
- ((B->link_word_signed >> 6) & 0x1ff) != 0
+ (B->link & 0x1ff) != 0
|
- ((B->link_word_signed & 0x7fc0) >> 6) == 0
+ (B->link & 0x1ff) == 0
|
- ((B->link_word_signed & 0x7fc0) >> 6) != 0
+ (B->link & 0x1ff) != 0
)

@partial_ptr_47_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_signed & 0x7fc0
+ (B->link & 0x1ff) << 6
|
- (B->link_word_signed >> 6) & 0x1ff
+ B->link & 0x1ff
|
- (B->link_word_signed & 0x7fc0) >> 6
+ B->link & 0x1ff
)

@partial_ptr_48_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word & 0x8000) == 0
+ (B->link & 0x200) == 0
|
- (B->link_word & 0x8000) != 0
+ (B->link & 0x200) != 0
|
- ((B->link_word >> 15) & 0x1) == 0
+ (B->link & 0x200) == 0
|
- ((B->link_word >> 15) & 0x1) != 0
+ (B->link & 0x200) != 0
|
- ((B->link_word & 0x8000) >> 15) == 0
+ (B->link & 0x200) == 0
|
- ((B->link_word & 0x8000) >> 15) != 0
+ (B->link & 0x200) != 0
)

@partial_ptr_48_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word & 0x8000
+ (B->link & 0x200) << 6
|
- (B->link_word >> 15) & 0x1
+ B->link >> 9
|
- (B->link_word & 0x8000) >> 15
+ B->link >> 9
)

@partial_ptr_49_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_signed & 0x8000) == 0
+ (B->link & 0x200) == 0
|
- (B->link_word_signed & 0x8000) != 0
+ (B->link & 0x200) != 0
|
- ((B->link_word_signed >> 15) & 0x1) == 0
+ (B->link & 0x200) == 0
|
- ((B->link_word_signed >> 15) & 0x1) != 0
+ (B->link & 0x200) != 0
|
- ((B->link_word_signed & 0x8000) >> 15) == 0
+ (B->link & 0x200) == 0
|
- ((B->link_word_signed & 0x8000) >> 15) != 0
+ (B->link & 0x200) != 0
)

@partial_ptr_49_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_signed & 0x8000
+ (B->link & 0x200) << 6
|
- (B->link_word_signed >> 15) & 0x1
+ B->link >> 9
|
- (B->link_word_signed & 0x8000) >> 15
+ B->link >> 9
)

@partial_ptr_50_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->link_word_high & 0x80) == 0
+ (B->link & 0x200) == 0
|
- (B->link_word_high & 0x80) != 0
+ (B->link & 0x200) != 0
|
- ((byte)(B->link_word_high) & 0x80) == 0
+ (B->link & 0x200) == 0
|
- ((byte)(B->link_word_high) & 0x80) != 0
+ (B->link & 0x200) != 0
|
- ((char)(B->link_word_high) & 0x80) == 0
+ (B->link & 0x200) == 0
|
- ((char)(B->link_word_high) & 0x80) != 0
+ (B->link & 0x200) != 0
|
- ((byte)(byte)(B->link_word_high) & 0x80) == 0
+ (B->link & 0x200) == 0
|
- ((byte)(byte)(B->link_word_high) & 0x80) != 0
+ (B->link & 0x200) != 0
|
- ((B->link_word_high >> 7) & 0x1) == 0
+ (B->link & 0x200) == 0
|
- ((B->link_word_high >> 7) & 0x1) != 0
+ (B->link & 0x200) != 0
|
- ((B->link_word_high & 0x80) >> 7) == 0
+ (B->link & 0x200) == 0
|
- ((B->link_word_high & 0x80) >> 7) != 0
+ (B->link & 0x200) != 0
|
- (((byte)(B->link_word_high) >> 7) & 0x1) == 0
+ (B->link & 0x200) == 0
|
- (((byte)(B->link_word_high) >> 7) & 0x1) != 0
+ (B->link & 0x200) != 0
|
- (((byte)(B->link_word_high) & 0x80) >> 7) == 0
+ (B->link & 0x200) == 0
|
- (((byte)(B->link_word_high) & 0x80) >> 7) != 0
+ (B->link & 0x200) != 0
|
- (((char)(B->link_word_high) >> 7) & 0x1) == 0
+ (B->link & 0x200) == 0
|
- (((char)(B->link_word_high) >> 7) & 0x1) != 0
+ (B->link & 0x200) != 0
|
- (((char)(B->link_word_high) & 0x80) >> 7) == 0
+ (B->link & 0x200) == 0
|
- (((char)(B->link_word_high) & 0x80) >> 7) != 0
+ (B->link & 0x200) != 0
|
- (((byte)(byte)(B->link_word_high) >> 7) & 0x1) == 0
+ (B->link & 0x200) == 0
|
- (((byte)(byte)(B->link_word_high) >> 7) & 0x1) != 0
+ (B->link & 0x200) != 0
|
- (((byte)(byte)(B->link_word_high) & 0x80) >> 7) == 0
+ (B->link & 0x200) == 0
|
- (((byte)(byte)(B->link_word_high) & 0x80) >> 7) != 0
+ (B->link & 0x200) != 0
)

@partial_ptr_50_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->link_word_high & 0x80
+ (B->link & 0x200) >> 2
|
- (byte)(B->link_word_high) & 0x80
+ (B->link & 0x200) >> 2
|
- (char)(B->link_word_high) & 0x80
+ (B->link & 0x200) >> 2
|
- (byte)(byte)(B->link_word_high) & 0x80
+ (B->link & 0x200) >> 2
|
- (B->link_word_high >> 7) & 0x1
+ B->link >> 9
|
- (B->link_word_high & 0x80) >> 7
+ B->link >> 9
|
- ((byte)(B->link_word_high) >> 7) & 0x1
+ B->link >> 9
|
- ((byte)(B->link_word_high) & 0x80) >> 7
+ B->link >> 9
|
- ((char)(B->link_word_high) >> 7) & 0x1
+ B->link >> 9
|
- ((char)(B->link_word_high) & 0x80) >> 7
+ B->link >> 9
|
- ((byte)(byte)(B->link_word_high) >> 7) & 0x1
+ B->link >> 9
|
- ((byte)(byte)(B->link_word_high) & 0x80) >> 7
+ B->link >> 9
)

@partial_ptr_51_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->tile_word & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (B->tile_word & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((byte)(B->tile_word) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((byte)(B->tile_word) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((char)(B->tile_word) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((char)(B->tile_word) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((byte)(byte)(B->tile_word) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((byte)(byte)(B->tile_word) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((B->tile_word >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((B->tile_word >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((B->tile_word & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((B->tile_word & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(B->tile_word) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(B->tile_word) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(B->tile_word) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(B->tile_word) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((char)(B->tile_word) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((char)(B->tile_word) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((char)(B->tile_word) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((char)(B->tile_word) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B->tile_word) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B->tile_word) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B->tile_word) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B->tile_word) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
)

@partial_ptr_51_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->tile_word & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (byte)(B->tile_word) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (char)(B->tile_word) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (byte)(byte)(B->tile_word) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (B->tile_word >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- (B->tile_word & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((byte)(B->tile_word) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((byte)(B->tile_word) & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((char)(B->tile_word) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((char)(B->tile_word) & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((byte)(byte)(B->tile_word) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((byte)(byte)(B->tile_word) & 0xf0) >> 4
+ B->npc_yhome & 0xf
)

@partial_ptr_52_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->tile_word_signed & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (B->tile_word_signed & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((byte)(B->tile_word_signed) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((byte)(B->tile_word_signed) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((char)(B->tile_word_signed) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((char)(B->tile_word_signed) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((byte)(byte)(B->tile_word_signed) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((byte)(byte)(B->tile_word_signed) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((B->tile_word_signed >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((B->tile_word_signed >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((B->tile_word_signed & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((B->tile_word_signed & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(B->tile_word_signed) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(B->tile_word_signed) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(B->tile_word_signed) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(B->tile_word_signed) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((char)(B->tile_word_signed) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((char)(B->tile_word_signed) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((char)(B->tile_word_signed) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((char)(B->tile_word_signed) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B->tile_word_signed) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B->tile_word_signed) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B->tile_word_signed) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B->tile_word_signed) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
)

@partial_ptr_52_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->tile_word_signed & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (byte)(B->tile_word_signed) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (char)(B->tile_word_signed) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (byte)(byte)(B->tile_word_signed) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (B->tile_word_signed >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- (B->tile_word_signed & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((byte)(B->tile_word_signed) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((byte)(B->tile_word_signed) & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((char)(B->tile_word_signed) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((char)(B->tile_word_signed) & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((byte)(byte)(B->tile_word_signed) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((byte)(byte)(B->tile_word_signed) & 0xf0) >> 4
+ B->npc_yhome & 0xf
)

@partial_ptr_53_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->tile_word_low & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (B->tile_word_low & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((byte)(B->tile_word_low) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((byte)(B->tile_word_low) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((char)(B->tile_word_low) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((char)(B->tile_word_low) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((byte)(byte)(B->tile_word_low) & 0xf0) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((byte)(byte)(B->tile_word_low) & 0xf0) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((B->tile_word_low >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((B->tile_word_low >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- ((B->tile_word_low & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- ((B->tile_word_low & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(B->tile_word_low) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(B->tile_word_low) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(B->tile_word_low) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(B->tile_word_low) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((char)(B->tile_word_low) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((char)(B->tile_word_low) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((char)(B->tile_word_low) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((char)(B->tile_word_low) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B->tile_word_low) >> 4) & 0xf) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B->tile_word_low) >> 4) & 0xf) != 0
+ (B->npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B->tile_word_low) & 0xf0) >> 4) == 0
+ (B->npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B->tile_word_low) & 0xf0) >> 4) != 0
+ (B->npc_yhome & 0xf) != 0
)

@partial_ptr_53_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->tile_word_low & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (byte)(B->tile_word_low) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (char)(B->tile_word_low) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (byte)(byte)(B->tile_word_low) & 0xf0
+ (B->npc_yhome & 0xf) << 4
|
- (B->tile_word_low >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- (B->tile_word_low & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((byte)(B->tile_word_low) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((byte)(B->tile_word_low) & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((char)(B->tile_word_low) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((char)(B->tile_word_low) & 0xf0) >> 4
+ B->npc_yhome & 0xf
|
- ((byte)(byte)(B->tile_word_low) >> 4) & 0xf
+ B->npc_yhome & 0xf
|
- ((byte)(byte)(B->tile_word_low) & 0xf0) >> 4
+ B->npc_yhome & 0xf
)

@partial_ptr_54_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->tile_word & 0x3c00) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (B->tile_word & 0x3c00) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((B->tile_word >> 10) & 0xf) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((B->tile_word >> 10) & 0xf) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((B->tile_word & 0x3c00) >> 10) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((B->tile_word & 0x3c00) >> 10) != 0
+ (B->npc_xhome & 0xf) != 0
)

@partial_ptr_54_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->tile_word & 0x3c00
+ (B->npc_xhome & 0xf) << 10
|
- (B->tile_word >> 10) & 0xf
+ B->npc_xhome & 0xf
|
- (B->tile_word & 0x3c00) >> 10
+ B->npc_xhome & 0xf
)

@partial_ptr_55_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->tile_word_signed & 0x3c00) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (B->tile_word_signed & 0x3c00) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((B->tile_word_signed >> 10) & 0xf) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((B->tile_word_signed >> 10) & 0xf) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((B->tile_word_signed & 0x3c00) >> 10) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((B->tile_word_signed & 0x3c00) >> 10) != 0
+ (B->npc_xhome & 0xf) != 0
)

@partial_ptr_55_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->tile_word_signed & 0x3c00
+ (B->npc_xhome & 0xf) << 10
|
- (B->tile_word_signed >> 10) & 0xf
+ B->npc_xhome & 0xf
|
- (B->tile_word_signed & 0x3c00) >> 10
+ B->npc_xhome & 0xf
)

@partial_ptr_56_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B->tile_word_high & 0x3c) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (B->tile_word_high & 0x3c) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((byte)(B->tile_word_high) & 0x3c) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((byte)(B->tile_word_high) & 0x3c) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((char)(B->tile_word_high) & 0x3c) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((char)(B->tile_word_high) & 0x3c) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((byte)(byte)(B->tile_word_high) & 0x3c) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((byte)(byte)(B->tile_word_high) & 0x3c) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((B->tile_word_high >> 2) & 0xf) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((B->tile_word_high >> 2) & 0xf) != 0
+ (B->npc_xhome & 0xf) != 0
|
- ((B->tile_word_high & 0x3c) >> 2) == 0
+ (B->npc_xhome & 0xf) == 0
|
- ((B->tile_word_high & 0x3c) >> 2) != 0
+ (B->npc_xhome & 0xf) != 0
|
- (((byte)(B->tile_word_high) >> 2) & 0xf) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (((byte)(B->tile_word_high) >> 2) & 0xf) != 0
+ (B->npc_xhome & 0xf) != 0
|
- (((byte)(B->tile_word_high) & 0x3c) >> 2) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (((byte)(B->tile_word_high) & 0x3c) >> 2) != 0
+ (B->npc_xhome & 0xf) != 0
|
- (((char)(B->tile_word_high) >> 2) & 0xf) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (((char)(B->tile_word_high) >> 2) & 0xf) != 0
+ (B->npc_xhome & 0xf) != 0
|
- (((char)(B->tile_word_high) & 0x3c) >> 2) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (((char)(B->tile_word_high) & 0x3c) >> 2) != 0
+ (B->npc_xhome & 0xf) != 0
|
- (((byte)(byte)(B->tile_word_high) >> 2) & 0xf) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (((byte)(byte)(B->tile_word_high) >> 2) & 0xf) != 0
+ (B->npc_xhome & 0xf) != 0
|
- (((byte)(byte)(B->tile_word_high) & 0x3c) >> 2) == 0
+ (B->npc_xhome & 0xf) == 0
|
- (((byte)(byte)(B->tile_word_high) & 0x3c) >> 2) != 0
+ (B->npc_xhome & 0xf) != 0
)

@partial_ptr_56_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B->tile_word_high & 0x3c
+ (B->npc_xhome & 0xf) << 2
|
- (byte)(B->tile_word_high) & 0x3c
+ (B->npc_xhome & 0xf) << 2
|
- (char)(B->tile_word_high) & 0x3c
+ (B->npc_xhome & 0xf) << 2
|
- (byte)(byte)(B->tile_word_high) & 0x3c
+ (B->npc_xhome & 0xf) << 2
|
- (B->tile_word_high >> 2) & 0xf
+ B->npc_xhome & 0xf
|
- (B->tile_word_high & 0x3c) >> 2
+ B->npc_xhome & 0xf
|
- ((byte)(B->tile_word_high) >> 2) & 0xf
+ B->npc_xhome & 0xf
|
- ((byte)(B->tile_word_high) & 0x3c) >> 2
+ B->npc_xhome & 0xf
|
- ((char)(B->tile_word_high) >> 2) & 0xf
+ B->npc_xhome & 0xf
|
- ((char)(B->tile_word_high) & 0x3c) >> 2
+ B->npc_xhome & 0xf
|
- ((byte)(byte)(B->tile_word_high) >> 2) & 0xf
+ B->npc_xhome & 0xf
|
- ((byte)(byte)(B->tile_word_high) & 0x3c) >> 2
+ B->npc_xhome & 0xf
)

@partial_value_0_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- (B.type_flags & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((byte)(B.type_flags) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((byte)(B.type_flags) & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((char)(B.type_flags) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((char)(B.type_flags) & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((byte)(byte)(B.type_flags) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((byte)(byte)(B.type_flags) & 0x7) != 0
+ (B.item_id & 0x7) != 0
)

@partial_value_0_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x7
+ B.item_id & 0x7
|
- (byte)(B.type_flags) & 0x7
+ B.item_id & 0x7
|
- (char)(B.type_flags) & 0x7
+ B.item_id & 0x7
|
- (byte)(byte)(B.type_flags) & 0x7
+ B.item_id & 0x7
)

@partial_value_1_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- (B.type_flags_signed & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((byte)(B.type_flags_signed) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((byte)(B.type_flags_signed) & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((char)(B.type_flags_signed) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((char)(B.type_flags_signed) & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((byte)(byte)(B.type_flags_signed) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((byte)(byte)(B.type_flags_signed) & 0x7) != 0
+ (B.item_id & 0x7) != 0
)

@partial_value_1_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x7
+ B.item_id & 0x7
|
- (byte)(B.type_flags_signed) & 0x7
+ B.item_id & 0x7
|
- (char)(B.type_flags_signed) & 0x7
+ B.item_id & 0x7
|
- (byte)(byte)(B.type_flags_signed) & 0x7
+ B.item_id & 0x7
)

@partial_value_2_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_low & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- (B.type_flags_low & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((byte)(B.type_flags_low) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((byte)(B.type_flags_low) & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((char)(B.type_flags_low) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((char)(B.type_flags_low) & 0x7) != 0
+ (B.item_id & 0x7) != 0
|
- ((byte)(byte)(B.type_flags_low) & 0x7) == 0
+ (B.item_id & 0x7) == 0
|
- ((byte)(byte)(B.type_flags_low) & 0x7) != 0
+ (B.item_id & 0x7) != 0
)

@partial_value_2_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_low & 0x7
+ B.item_id & 0x7
|
- (byte)(B.type_flags_low) & 0x7
+ B.item_id & 0x7
|
- (char)(B.type_flags_low) & 0x7
+ B.item_id & 0x7
|
- (byte)(byte)(B.type_flags_low) & 0x7
+ B.item_id & 0x7
)

@partial_value_3_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- (B.type_flags & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((byte)(B.type_flags) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((byte)(B.type_flags) & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((char)(B.type_flags) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((char)(B.type_flags) & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((byte)(byte)(B.type_flags) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((byte)(byte)(B.type_flags) & 0xf) != 0
+ (B.item_id & 0xf) != 0
)

@partial_value_3_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0xf
+ B.item_id & 0xf
|
- (byte)(B.type_flags) & 0xf
+ B.item_id & 0xf
|
- (char)(B.type_flags) & 0xf
+ B.item_id & 0xf
|
- (byte)(byte)(B.type_flags) & 0xf
+ B.item_id & 0xf
)

@partial_value_4_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- (B.type_flags_signed & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((byte)(B.type_flags_signed) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((byte)(B.type_flags_signed) & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((char)(B.type_flags_signed) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((char)(B.type_flags_signed) & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((byte)(byte)(B.type_flags_signed) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((byte)(byte)(B.type_flags_signed) & 0xf) != 0
+ (B.item_id & 0xf) != 0
)

@partial_value_4_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0xf
+ B.item_id & 0xf
|
- (byte)(B.type_flags_signed) & 0xf
+ B.item_id & 0xf
|
- (char)(B.type_flags_signed) & 0xf
+ B.item_id & 0xf
|
- (byte)(byte)(B.type_flags_signed) & 0xf
+ B.item_id & 0xf
)

@partial_value_5_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_low & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- (B.type_flags_low & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((byte)(B.type_flags_low) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((byte)(B.type_flags_low) & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((char)(B.type_flags_low) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((char)(B.type_flags_low) & 0xf) != 0
+ (B.item_id & 0xf) != 0
|
- ((byte)(byte)(B.type_flags_low) & 0xf) == 0
+ (B.item_id & 0xf) == 0
|
- ((byte)(byte)(B.type_flags_low) & 0xf) != 0
+ (B.item_id & 0xf) != 0
)

@partial_value_5_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_low & 0xf
+ B.item_id & 0xf
|
- (byte)(B.type_flags_low) & 0xf
+ B.item_id & 0xf
|
- (char)(B.type_flags_low) & 0xf
+ B.item_id & 0xf
|
- (byte)(byte)(B.type_flags_low) & 0xf
+ B.item_id & 0xf
)

@partial_value_6_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- (B.type_flags & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((byte)(B.type_flags) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((byte)(B.type_flags) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((char)(B.type_flags) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((char)(B.type_flags) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((byte)(byte)(B.type_flags) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((byte)(byte)(B.type_flags) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
)

@partial_value_6_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x1f
+ B.item_id & 0x1f
|
- (byte)(B.type_flags) & 0x1f
+ B.item_id & 0x1f
|
- (char)(B.type_flags) & 0x1f
+ B.item_id & 0x1f
|
- (byte)(byte)(B.type_flags) & 0x1f
+ B.item_id & 0x1f
)

@partial_value_7_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- (B.type_flags_signed & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((byte)(B.type_flags_signed) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((byte)(B.type_flags_signed) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((char)(B.type_flags_signed) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((char)(B.type_flags_signed) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((byte)(byte)(B.type_flags_signed) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((byte)(byte)(B.type_flags_signed) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
)

@partial_value_7_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x1f
+ B.item_id & 0x1f
|
- (byte)(B.type_flags_signed) & 0x1f
+ B.item_id & 0x1f
|
- (char)(B.type_flags_signed) & 0x1f
+ B.item_id & 0x1f
|
- (byte)(byte)(B.type_flags_signed) & 0x1f
+ B.item_id & 0x1f
)

@partial_value_8_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_low & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- (B.type_flags_low & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((byte)(B.type_flags_low) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((byte)(B.type_flags_low) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((char)(B.type_flags_low) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((char)(B.type_flags_low) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
|
- ((byte)(byte)(B.type_flags_low) & 0x1f) == 0
+ (B.item_id & 0x1f) == 0
|
- ((byte)(byte)(B.type_flags_low) & 0x1f) != 0
+ (B.item_id & 0x1f) != 0
)

@partial_value_8_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_low & 0x1f
+ B.item_id & 0x1f
|
- (byte)(B.type_flags_low) & 0x1f
+ B.item_id & 0x1f
|
- (char)(B.type_flags_low) & 0x1f
+ B.item_id & 0x1f
|
- (byte)(byte)(B.type_flags_low) & 0x1f
+ B.item_id & 0x1f
)

@partial_value_9_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- (B.type_flags & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((byte)(B.type_flags) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((byte)(B.type_flags) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((char)(B.type_flags) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((char)(B.type_flags) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((byte)(byte)(B.type_flags) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((byte)(byte)(B.type_flags) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((B.type_flags >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- ((B.type_flags >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- ((B.type_flags & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- ((B.type_flags & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(B.type_flags) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(B.type_flags) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(B.type_flags) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(B.type_flags) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((char)(B.type_flags) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((char)(B.type_flags) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((char)(B.type_flags) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((char)(B.type_flags) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(byte)(B.type_flags) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(byte)(B.type_flags) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(byte)(B.type_flags) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(byte)(B.type_flags) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
)

@partial_value_9_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x30
+ B.item_id & 0x30
|
- (byte)(B.type_flags) & 0x30
+ B.item_id & 0x30
|
- (char)(B.type_flags) & 0x30
+ B.item_id & 0x30
|
- (byte)(byte)(B.type_flags) & 0x30
+ B.item_id & 0x30
|
- (B.type_flags >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- (B.type_flags & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((byte)(B.type_flags) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((byte)(B.type_flags) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((char)(B.type_flags) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((char)(B.type_flags) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((byte)(byte)(B.type_flags) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((byte)(byte)(B.type_flags) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
)

@partial_value_10_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- (B.type_flags_signed & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((byte)(B.type_flags_signed) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((byte)(B.type_flags_signed) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((char)(B.type_flags_signed) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((char)(B.type_flags_signed) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((byte)(byte)(B.type_flags_signed) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((byte)(byte)(B.type_flags_signed) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((B.type_flags_signed >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- ((B.type_flags_signed >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- ((B.type_flags_signed & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- ((B.type_flags_signed & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(B.type_flags_signed) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(B.type_flags_signed) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(B.type_flags_signed) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(B.type_flags_signed) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((char)(B.type_flags_signed) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((char)(B.type_flags_signed) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((char)(B.type_flags_signed) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((char)(B.type_flags_signed) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(byte)(B.type_flags_signed) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(byte)(B.type_flags_signed) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(byte)(B.type_flags_signed) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(byte)(B.type_flags_signed) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
)

@partial_value_10_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x30
+ B.item_id & 0x30
|
- (byte)(B.type_flags_signed) & 0x30
+ B.item_id & 0x30
|
- (char)(B.type_flags_signed) & 0x30
+ B.item_id & 0x30
|
- (byte)(byte)(B.type_flags_signed) & 0x30
+ B.item_id & 0x30
|
- (B.type_flags_signed >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- (B.type_flags_signed & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((byte)(B.type_flags_signed) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((byte)(B.type_flags_signed) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((char)(B.type_flags_signed) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((char)(B.type_flags_signed) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((byte)(byte)(B.type_flags_signed) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((byte)(byte)(B.type_flags_signed) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
)

@partial_value_11_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_low & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- (B.type_flags_low & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((byte)(B.type_flags_low) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((byte)(B.type_flags_low) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((char)(B.type_flags_low) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((char)(B.type_flags_low) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((byte)(byte)(B.type_flags_low) & 0x30) == 0
+ (B.item_id & 0x30) == 0
|
- ((byte)(byte)(B.type_flags_low) & 0x30) != 0
+ (B.item_id & 0x30) != 0
|
- ((B.type_flags_low >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- ((B.type_flags_low >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- ((B.type_flags_low & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- ((B.type_flags_low & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(B.type_flags_low) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(B.type_flags_low) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(B.type_flags_low) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(B.type_flags_low) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((char)(B.type_flags_low) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((char)(B.type_flags_low) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((char)(B.type_flags_low) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((char)(B.type_flags_low) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(byte)(B.type_flags_low) >> 4) & 0x3) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(byte)(B.type_flags_low) >> 4) & 0x3) != 0
+ (B.item_id & 0x30) != 0
|
- (((byte)(byte)(B.type_flags_low) & 0x30) >> 4) == 0
+ (B.item_id & 0x30) == 0
|
- (((byte)(byte)(B.type_flags_low) & 0x30) >> 4) != 0
+ (B.item_id & 0x30) != 0
)

@partial_value_11_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_low & 0x30
+ B.item_id & 0x30
|
- (byte)(B.type_flags_low) & 0x30
+ B.item_id & 0x30
|
- (char)(B.type_flags_low) & 0x30
+ B.item_id & 0x30
|
- (byte)(byte)(B.type_flags_low) & 0x30
+ B.item_id & 0x30
|
- (B.type_flags_low >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- (B.type_flags_low & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((byte)(B.type_flags_low) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((byte)(B.type_flags_low) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((char)(B.type_flags_low) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((char)(B.type_flags_low) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
|
- ((byte)(byte)(B.type_flags_low) >> 4) & 0x3
+ (B.item_id >> 4) & 0x3
|
- ((byte)(byte)(B.type_flags_low) & 0x30) >> 4
+ (B.item_id >> 4) & 0x3
)

@partial_value_12_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- (B.type_flags & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((byte)(B.type_flags) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((byte)(B.type_flags) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((char)(B.type_flags) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((char)(B.type_flags) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((byte)(byte)(B.type_flags) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((byte)(byte)(B.type_flags) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
)

@partial_value_12_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x3f
+ B.item_id & 0x3f
|
- (byte)(B.type_flags) & 0x3f
+ B.item_id & 0x3f
|
- (char)(B.type_flags) & 0x3f
+ B.item_id & 0x3f
|
- (byte)(byte)(B.type_flags) & 0x3f
+ B.item_id & 0x3f
)

@partial_value_13_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- (B.type_flags_signed & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((byte)(B.type_flags_signed) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((byte)(B.type_flags_signed) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((char)(B.type_flags_signed) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((char)(B.type_flags_signed) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((byte)(byte)(B.type_flags_signed) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((byte)(byte)(B.type_flags_signed) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
)

@partial_value_13_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x3f
+ B.item_id & 0x3f
|
- (byte)(B.type_flags_signed) & 0x3f
+ B.item_id & 0x3f
|
- (char)(B.type_flags_signed) & 0x3f
+ B.item_id & 0x3f
|
- (byte)(byte)(B.type_flags_signed) & 0x3f
+ B.item_id & 0x3f
)

@partial_value_14_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_low & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- (B.type_flags_low & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((byte)(B.type_flags_low) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((byte)(B.type_flags_low) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((char)(B.type_flags_low) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((char)(B.type_flags_low) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
|
- ((byte)(byte)(B.type_flags_low) & 0x3f) == 0
+ (B.item_id & 0x3f) == 0
|
- ((byte)(byte)(B.type_flags_low) & 0x3f) != 0
+ (B.item_id & 0x3f) != 0
)

@partial_value_14_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_low & 0x3f
+ B.item_id & 0x3f
|
- (byte)(B.type_flags_low) & 0x3f
+ B.item_id & 0x3f
|
- (char)(B.type_flags_low) & 0x3f
+ B.item_id & 0x3f
|
- (byte)(byte)(B.type_flags_low) & 0x3f
+ B.item_id & 0x3f
)

@partial_value_15_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x1c0) == 0
+ (B.item_id & 0x1c0) == 0
|
- (B.type_flags & 0x1c0) != 0
+ (B.item_id & 0x1c0) != 0
|
- ((B.type_flags >> 6) & 0x7) == 0
+ (B.item_id & 0x1c0) == 0
|
- ((B.type_flags >> 6) & 0x7) != 0
+ (B.item_id & 0x1c0) != 0
|
- ((B.type_flags & 0x1c0) >> 6) == 0
+ (B.item_id & 0x1c0) == 0
|
- ((B.type_flags & 0x1c0) >> 6) != 0
+ (B.item_id & 0x1c0) != 0
)

@partial_value_15_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x1c0
+ B.item_id & 0x1c0
|
- (B.type_flags >> 6) & 0x7
+ B.item_id >> 6
|
- (B.type_flags & 0x1c0) >> 6
+ B.item_id >> 6
)

@partial_value_16_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x1c0) == 0
+ (B.item_id & 0x1c0) == 0
|
- (B.type_flags_signed & 0x1c0) != 0
+ (B.item_id & 0x1c0) != 0
|
- ((B.type_flags_signed >> 6) & 0x7) == 0
+ (B.item_id & 0x1c0) == 0
|
- ((B.type_flags_signed >> 6) & 0x7) != 0
+ (B.item_id & 0x1c0) != 0
|
- ((B.type_flags_signed & 0x1c0) >> 6) == 0
+ (B.item_id & 0x1c0) == 0
|
- ((B.type_flags_signed & 0x1c0) >> 6) != 0
+ (B.item_id & 0x1c0) != 0
)

@partial_value_16_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x1c0
+ B.item_id & 0x1c0
|
- (B.type_flags_signed >> 6) & 0x7
+ B.item_id >> 6
|
- (B.type_flags_signed & 0x1c0) >> 6
+ B.item_id >> 6
)

@partial_value_17_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x1f0) == 0
+ (B.item_id & 0x1f0) == 0
|
- (B.type_flags & 0x1f0) != 0
+ (B.item_id & 0x1f0) != 0
|
- ((B.type_flags >> 4) & 0x1f) == 0
+ (B.item_id & 0x1f0) == 0
|
- ((B.type_flags >> 4) & 0x1f) != 0
+ (B.item_id & 0x1f0) != 0
|
- ((B.type_flags & 0x1f0) >> 4) == 0
+ (B.item_id & 0x1f0) == 0
|
- ((B.type_flags & 0x1f0) >> 4) != 0
+ (B.item_id & 0x1f0) != 0
)

@partial_value_17_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x1f0
+ B.item_id & 0x1f0
|
- (B.type_flags >> 4) & 0x1f
+ B.item_id >> 4
|
- (B.type_flags & 0x1f0) >> 4
+ B.item_id >> 4
)

@partial_value_18_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x1f0) == 0
+ (B.item_id & 0x1f0) == 0
|
- (B.type_flags_signed & 0x1f0) != 0
+ (B.item_id & 0x1f0) != 0
|
- ((B.type_flags_signed >> 4) & 0x1f) == 0
+ (B.item_id & 0x1f0) == 0
|
- ((B.type_flags_signed >> 4) & 0x1f) != 0
+ (B.item_id & 0x1f0) != 0
|
- ((B.type_flags_signed & 0x1f0) >> 4) == 0
+ (B.item_id & 0x1f0) == 0
|
- ((B.type_flags_signed & 0x1f0) >> 4) != 0
+ (B.item_id & 0x1f0) != 0
)

@partial_value_18_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x1f0
+ B.item_id & 0x1f0
|
- (B.type_flags_signed >> 4) & 0x1f
+ B.item_id >> 4
|
- (B.type_flags_signed & 0x1f0) >> 4
+ B.item_id >> 4
)

@partial_value_19_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x200) == 0
+ (B.flags_res & 0x1) == 0
|
- (B.type_flags & 0x200) != 0
+ (B.flags_res & 0x1) != 0
|
- ((B.type_flags >> 9) & 0x1) == 0
+ (B.flags_res & 0x1) == 0
|
- ((B.type_flags >> 9) & 0x1) != 0
+ (B.flags_res & 0x1) != 0
|
- ((B.type_flags & 0x200) >> 9) == 0
+ (B.flags_res & 0x1) == 0
|
- ((B.type_flags & 0x200) >> 9) != 0
+ (B.flags_res & 0x1) != 0
)

@partial_value_19_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x200
+ (B.flags_res & 0x1) << 9
|
- (B.type_flags >> 9) & 0x1
+ B.flags_res & 0x1
|
- (B.type_flags & 0x200) >> 9
+ B.flags_res & 0x1
)

@partial_value_20_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x200) == 0
+ (B.flags_res & 0x1) == 0
|
- (B.type_flags_signed & 0x200) != 0
+ (B.flags_res & 0x1) != 0
|
- ((B.type_flags_signed >> 9) & 0x1) == 0
+ (B.flags_res & 0x1) == 0
|
- ((B.type_flags_signed >> 9) & 0x1) != 0
+ (B.flags_res & 0x1) != 0
|
- ((B.type_flags_signed & 0x200) >> 9) == 0
+ (B.flags_res & 0x1) == 0
|
- ((B.type_flags_signed & 0x200) >> 9) != 0
+ (B.flags_res & 0x1) != 0
)

@partial_value_20_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x200
+ (B.flags_res & 0x1) << 9
|
- (B.type_flags_signed >> 9) & 0x1
+ B.flags_res & 0x1
|
- (B.type_flags_signed & 0x200) >> 9
+ B.flags_res & 0x1
)

@partial_value_21_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_high & 0x2) == 0
+ (B.flags_res & 0x1) == 0
|
- (B.type_flags_high & 0x2) != 0
+ (B.flags_res & 0x1) != 0
|
- ((byte)(B.type_flags_high) & 0x2) == 0
+ (B.flags_res & 0x1) == 0
|
- ((byte)(B.type_flags_high) & 0x2) != 0
+ (B.flags_res & 0x1) != 0
|
- ((char)(B.type_flags_high) & 0x2) == 0
+ (B.flags_res & 0x1) == 0
|
- ((char)(B.type_flags_high) & 0x2) != 0
+ (B.flags_res & 0x1) != 0
|
- ((byte)(byte)(B.type_flags_high) & 0x2) == 0
+ (B.flags_res & 0x1) == 0
|
- ((byte)(byte)(B.type_flags_high) & 0x2) != 0
+ (B.flags_res & 0x1) != 0
|
- ((B.type_flags_high >> 1) & 0x1) == 0
+ (B.flags_res & 0x1) == 0
|
- ((B.type_flags_high >> 1) & 0x1) != 0
+ (B.flags_res & 0x1) != 0
|
- ((B.type_flags_high & 0x2) >> 1) == 0
+ (B.flags_res & 0x1) == 0
|
- ((B.type_flags_high & 0x2) >> 1) != 0
+ (B.flags_res & 0x1) != 0
|
- (((byte)(B.type_flags_high) >> 1) & 0x1) == 0
+ (B.flags_res & 0x1) == 0
|
- (((byte)(B.type_flags_high) >> 1) & 0x1) != 0
+ (B.flags_res & 0x1) != 0
|
- (((byte)(B.type_flags_high) & 0x2) >> 1) == 0
+ (B.flags_res & 0x1) == 0
|
- (((byte)(B.type_flags_high) & 0x2) >> 1) != 0
+ (B.flags_res & 0x1) != 0
|
- (((char)(B.type_flags_high) >> 1) & 0x1) == 0
+ (B.flags_res & 0x1) == 0
|
- (((char)(B.type_flags_high) >> 1) & 0x1) != 0
+ (B.flags_res & 0x1) != 0
|
- (((char)(B.type_flags_high) & 0x2) >> 1) == 0
+ (B.flags_res & 0x1) == 0
|
- (((char)(B.type_flags_high) & 0x2) >> 1) != 0
+ (B.flags_res & 0x1) != 0
|
- (((byte)(byte)(B.type_flags_high) >> 1) & 0x1) == 0
+ (B.flags_res & 0x1) == 0
|
- (((byte)(byte)(B.type_flags_high) >> 1) & 0x1) != 0
+ (B.flags_res & 0x1) != 0
|
- (((byte)(byte)(B.type_flags_high) & 0x2) >> 1) == 0
+ (B.flags_res & 0x1) == 0
|
- (((byte)(byte)(B.type_flags_high) & 0x2) >> 1) != 0
+ (B.flags_res & 0x1) != 0
)

@partial_value_21_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_high & 0x2
+ (B.flags_res & 0x1) << 1
|
- (byte)(B.type_flags_high) & 0x2
+ (B.flags_res & 0x1) << 1
|
- (char)(B.type_flags_high) & 0x2
+ (B.flags_res & 0x1) << 1
|
- (byte)(byte)(B.type_flags_high) & 0x2
+ (B.flags_res & 0x1) << 1
|
- (B.type_flags_high >> 1) & 0x1
+ B.flags_res & 0x1
|
- (B.type_flags_high & 0x2) >> 1
+ B.flags_res & 0x1
|
- ((byte)(B.type_flags_high) >> 1) & 0x1
+ B.flags_res & 0x1
|
- ((byte)(B.type_flags_high) & 0x2) >> 1
+ B.flags_res & 0x1
|
- ((char)(B.type_flags_high) >> 1) & 0x1
+ B.flags_res & 0x1
|
- ((char)(B.type_flags_high) & 0x2) >> 1
+ B.flags_res & 0x1
|
- ((byte)(byte)(B.type_flags_high) >> 1) & 0x1
+ B.flags_res & 0x1
|
- ((byte)(byte)(B.type_flags_high) & 0x2) >> 1
+ B.flags_res & 0x1
)

@partial_value_22_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x400) == 0
+ (B.flags_res & 0x2) == 0
|
- (B.type_flags & 0x400) != 0
+ (B.flags_res & 0x2) != 0
|
- ((B.type_flags >> 10) & 0x1) == 0
+ (B.flags_res & 0x2) == 0
|
- ((B.type_flags >> 10) & 0x1) != 0
+ (B.flags_res & 0x2) != 0
|
- ((B.type_flags & 0x400) >> 10) == 0
+ (B.flags_res & 0x2) == 0
|
- ((B.type_flags & 0x400) >> 10) != 0
+ (B.flags_res & 0x2) != 0
)

@partial_value_22_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x400
+ (B.flags_res & 0x2) << 9
|
- (B.type_flags >> 10) & 0x1
+ (B.flags_res >> 1) & 0x1
|
- (B.type_flags & 0x400) >> 10
+ (B.flags_res >> 1) & 0x1
)

@partial_value_23_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x400) == 0
+ (B.flags_res & 0x2) == 0
|
- (B.type_flags_signed & 0x400) != 0
+ (B.flags_res & 0x2) != 0
|
- ((B.type_flags_signed >> 10) & 0x1) == 0
+ (B.flags_res & 0x2) == 0
|
- ((B.type_flags_signed >> 10) & 0x1) != 0
+ (B.flags_res & 0x2) != 0
|
- ((B.type_flags_signed & 0x400) >> 10) == 0
+ (B.flags_res & 0x2) == 0
|
- ((B.type_flags_signed & 0x400) >> 10) != 0
+ (B.flags_res & 0x2) != 0
)

@partial_value_23_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x400
+ (B.flags_res & 0x2) << 9
|
- (B.type_flags_signed >> 10) & 0x1
+ (B.flags_res >> 1) & 0x1
|
- (B.type_flags_signed & 0x400) >> 10
+ (B.flags_res >> 1) & 0x1
)

@partial_value_24_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_high & 0x4) == 0
+ (B.flags_res & 0x2) == 0
|
- (B.type_flags_high & 0x4) != 0
+ (B.flags_res & 0x2) != 0
|
- ((byte)(B.type_flags_high) & 0x4) == 0
+ (B.flags_res & 0x2) == 0
|
- ((byte)(B.type_flags_high) & 0x4) != 0
+ (B.flags_res & 0x2) != 0
|
- ((char)(B.type_flags_high) & 0x4) == 0
+ (B.flags_res & 0x2) == 0
|
- ((char)(B.type_flags_high) & 0x4) != 0
+ (B.flags_res & 0x2) != 0
|
- ((byte)(byte)(B.type_flags_high) & 0x4) == 0
+ (B.flags_res & 0x2) == 0
|
- ((byte)(byte)(B.type_flags_high) & 0x4) != 0
+ (B.flags_res & 0x2) != 0
|
- ((B.type_flags_high >> 2) & 0x1) == 0
+ (B.flags_res & 0x2) == 0
|
- ((B.type_flags_high >> 2) & 0x1) != 0
+ (B.flags_res & 0x2) != 0
|
- ((B.type_flags_high & 0x4) >> 2) == 0
+ (B.flags_res & 0x2) == 0
|
- ((B.type_flags_high & 0x4) >> 2) != 0
+ (B.flags_res & 0x2) != 0
|
- (((byte)(B.type_flags_high) >> 2) & 0x1) == 0
+ (B.flags_res & 0x2) == 0
|
- (((byte)(B.type_flags_high) >> 2) & 0x1) != 0
+ (B.flags_res & 0x2) != 0
|
- (((byte)(B.type_flags_high) & 0x4) >> 2) == 0
+ (B.flags_res & 0x2) == 0
|
- (((byte)(B.type_flags_high) & 0x4) >> 2) != 0
+ (B.flags_res & 0x2) != 0
|
- (((char)(B.type_flags_high) >> 2) & 0x1) == 0
+ (B.flags_res & 0x2) == 0
|
- (((char)(B.type_flags_high) >> 2) & 0x1) != 0
+ (B.flags_res & 0x2) != 0
|
- (((char)(B.type_flags_high) & 0x4) >> 2) == 0
+ (B.flags_res & 0x2) == 0
|
- (((char)(B.type_flags_high) & 0x4) >> 2) != 0
+ (B.flags_res & 0x2) != 0
|
- (((byte)(byte)(B.type_flags_high) >> 2) & 0x1) == 0
+ (B.flags_res & 0x2) == 0
|
- (((byte)(byte)(B.type_flags_high) >> 2) & 0x1) != 0
+ (B.flags_res & 0x2) != 0
|
- (((byte)(byte)(B.type_flags_high) & 0x4) >> 2) == 0
+ (B.flags_res & 0x2) == 0
|
- (((byte)(byte)(B.type_flags_high) & 0x4) >> 2) != 0
+ (B.flags_res & 0x2) != 0
)

@partial_value_24_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_high & 0x4
+ (B.flags_res & 0x2) << 1
|
- (byte)(B.type_flags_high) & 0x4
+ (B.flags_res & 0x2) << 1
|
- (char)(B.type_flags_high) & 0x4
+ (B.flags_res & 0x2) << 1
|
- (byte)(byte)(B.type_flags_high) & 0x4
+ (B.flags_res & 0x2) << 1
|
- (B.type_flags_high >> 2) & 0x1
+ (B.flags_res >> 1) & 0x1
|
- (B.type_flags_high & 0x4) >> 2
+ (B.flags_res >> 1) & 0x1
|
- ((byte)(B.type_flags_high) >> 2) & 0x1
+ (B.flags_res >> 1) & 0x1
|
- ((byte)(B.type_flags_high) & 0x4) >> 2
+ (B.flags_res >> 1) & 0x1
|
- ((char)(B.type_flags_high) >> 2) & 0x1
+ (B.flags_res >> 1) & 0x1
|
- ((char)(B.type_flags_high) & 0x4) >> 2
+ (B.flags_res >> 1) & 0x1
|
- ((byte)(byte)(B.type_flags_high) >> 2) & 0x1
+ (B.flags_res >> 1) & 0x1
|
- ((byte)(byte)(B.type_flags_high) & 0x4) >> 2
+ (B.flags_res >> 1) & 0x1
)

@partial_value_25_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags & 0x800) == 0
+ (B.flags_res & 0x4) == 0
|
- (B.type_flags & 0x800) != 0
+ (B.flags_res & 0x4) != 0
|
- ((B.type_flags >> 11) & 0x1) == 0
+ (B.flags_res & 0x4) == 0
|
- ((B.type_flags >> 11) & 0x1) != 0
+ (B.flags_res & 0x4) != 0
|
- ((B.type_flags & 0x800) >> 11) == 0
+ (B.flags_res & 0x4) == 0
|
- ((B.type_flags & 0x800) >> 11) != 0
+ (B.flags_res & 0x4) != 0
)

@partial_value_25_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags & 0x800
+ (B.flags_res & 0x4) << 9
|
- (B.type_flags >> 11) & 0x1
+ B.flags_res >> 2
|
- (B.type_flags & 0x800) >> 11
+ B.flags_res >> 2
)

@partial_value_26_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_signed & 0x800) == 0
+ (B.flags_res & 0x4) == 0
|
- (B.type_flags_signed & 0x800) != 0
+ (B.flags_res & 0x4) != 0
|
- ((B.type_flags_signed >> 11) & 0x1) == 0
+ (B.flags_res & 0x4) == 0
|
- ((B.type_flags_signed >> 11) & 0x1) != 0
+ (B.flags_res & 0x4) != 0
|
- ((B.type_flags_signed & 0x800) >> 11) == 0
+ (B.flags_res & 0x4) == 0
|
- ((B.type_flags_signed & 0x800) >> 11) != 0
+ (B.flags_res & 0x4) != 0
)

@partial_value_26_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_signed & 0x800
+ (B.flags_res & 0x4) << 9
|
- (B.type_flags_signed >> 11) & 0x1
+ B.flags_res >> 2
|
- (B.type_flags_signed & 0x800) >> 11
+ B.flags_res >> 2
)

@partial_value_27_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.type_flags_high & 0x8) == 0
+ (B.flags_res & 0x4) == 0
|
- (B.type_flags_high & 0x8) != 0
+ (B.flags_res & 0x4) != 0
|
- ((byte)(B.type_flags_high) & 0x8) == 0
+ (B.flags_res & 0x4) == 0
|
- ((byte)(B.type_flags_high) & 0x8) != 0
+ (B.flags_res & 0x4) != 0
|
- ((char)(B.type_flags_high) & 0x8) == 0
+ (B.flags_res & 0x4) == 0
|
- ((char)(B.type_flags_high) & 0x8) != 0
+ (B.flags_res & 0x4) != 0
|
- ((byte)(byte)(B.type_flags_high) & 0x8) == 0
+ (B.flags_res & 0x4) == 0
|
- ((byte)(byte)(B.type_flags_high) & 0x8) != 0
+ (B.flags_res & 0x4) != 0
|
- ((B.type_flags_high >> 3) & 0x1) == 0
+ (B.flags_res & 0x4) == 0
|
- ((B.type_flags_high >> 3) & 0x1) != 0
+ (B.flags_res & 0x4) != 0
|
- ((B.type_flags_high & 0x8) >> 3) == 0
+ (B.flags_res & 0x4) == 0
|
- ((B.type_flags_high & 0x8) >> 3) != 0
+ (B.flags_res & 0x4) != 0
|
- (((byte)(B.type_flags_high) >> 3) & 0x1) == 0
+ (B.flags_res & 0x4) == 0
|
- (((byte)(B.type_flags_high) >> 3) & 0x1) != 0
+ (B.flags_res & 0x4) != 0
|
- (((byte)(B.type_flags_high) & 0x8) >> 3) == 0
+ (B.flags_res & 0x4) == 0
|
- (((byte)(B.type_flags_high) & 0x8) >> 3) != 0
+ (B.flags_res & 0x4) != 0
|
- (((char)(B.type_flags_high) >> 3) & 0x1) == 0
+ (B.flags_res & 0x4) == 0
|
- (((char)(B.type_flags_high) >> 3) & 0x1) != 0
+ (B.flags_res & 0x4) != 0
|
- (((char)(B.type_flags_high) & 0x8) >> 3) == 0
+ (B.flags_res & 0x4) == 0
|
- (((char)(B.type_flags_high) & 0x8) >> 3) != 0
+ (B.flags_res & 0x4) != 0
|
- (((byte)(byte)(B.type_flags_high) >> 3) & 0x1) == 0
+ (B.flags_res & 0x4) == 0
|
- (((byte)(byte)(B.type_flags_high) >> 3) & 0x1) != 0
+ (B.flags_res & 0x4) != 0
|
- (((byte)(byte)(B.type_flags_high) & 0x8) >> 3) == 0
+ (B.flags_res & 0x4) == 0
|
- (((byte)(byte)(B.type_flags_high) & 0x8) >> 3) != 0
+ (B.flags_res & 0x4) != 0
)

@partial_value_27_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.type_flags_high & 0x8
+ (B.flags_res & 0x4) << 1
|
- (byte)(B.type_flags_high) & 0x8
+ (B.flags_res & 0x4) << 1
|
- (char)(B.type_flags_high) & 0x8
+ (B.flags_res & 0x4) << 1
|
- (byte)(byte)(B.type_flags_high) & 0x8
+ (B.flags_res & 0x4) << 1
|
- (B.type_flags_high >> 3) & 0x1
+ B.flags_res >> 2
|
- (B.type_flags_high & 0x8) >> 3
+ B.flags_res >> 2
|
- ((byte)(B.type_flags_high) >> 3) & 0x1
+ B.flags_res >> 2
|
- ((byte)(B.type_flags_high) & 0x8) >> 3
+ B.flags_res >> 2
|
- ((char)(B.type_flags_high) >> 3) & 0x1
+ B.flags_res >> 2
|
- ((char)(B.type_flags_high) & 0x8) >> 3
+ B.flags_res >> 2
|
- ((byte)(byte)(B.type_flags_high) >> 3) & 0x1
+ B.flags_res >> 2
|
- ((byte)(byte)(B.type_flags_high) & 0x8) >> 3
+ B.flags_res >> 2
)

@partial_value_28_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.position_word & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- (B.position_word & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((byte)(B.position_word) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((byte)(B.position_word) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((char)(B.position_word) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((char)(B.position_word) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((byte)(byte)(B.position_word) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((byte)(byte)(B.position_word) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((B.position_word >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- ((B.position_word >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- ((B.position_word & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- ((B.position_word & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(B.position_word) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(B.position_word) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(B.position_word) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(B.position_word) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((char)(B.position_word) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((char)(B.position_word) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((char)(B.position_word) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((char)(B.position_word) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(byte)(B.position_word) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(byte)(B.position_word) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(byte)(B.position_word) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(byte)(B.position_word) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
)

@partial_value_28_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.position_word & 0x78
+ B.zpos & 0x78
|
- (byte)(B.position_word) & 0x78
+ B.zpos & 0x78
|
- (char)(B.position_word) & 0x78
+ B.zpos & 0x78
|
- (byte)(byte)(B.position_word) & 0x78
+ B.zpos & 0x78
|
- (B.position_word >> 3) & 0xf
+ B.zpos >> 3
|
- (B.position_word & 0x78) >> 3
+ B.zpos >> 3
|
- ((byte)(B.position_word) >> 3) & 0xf
+ B.zpos >> 3
|
- ((byte)(B.position_word) & 0x78) >> 3
+ B.zpos >> 3
|
- ((char)(B.position_word) >> 3) & 0xf
+ B.zpos >> 3
|
- ((char)(B.position_word) & 0x78) >> 3
+ B.zpos >> 3
|
- ((byte)(byte)(B.position_word) >> 3) & 0xf
+ B.zpos >> 3
|
- ((byte)(byte)(B.position_word) & 0x78) >> 3
+ B.zpos >> 3
)

@partial_value_29_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.position_word_signed & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- (B.position_word_signed & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((byte)(B.position_word_signed) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((byte)(B.position_word_signed) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((char)(B.position_word_signed) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((char)(B.position_word_signed) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((byte)(byte)(B.position_word_signed) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((byte)(byte)(B.position_word_signed) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((B.position_word_signed >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- ((B.position_word_signed >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- ((B.position_word_signed & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- ((B.position_word_signed & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(B.position_word_signed) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(B.position_word_signed) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(B.position_word_signed) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(B.position_word_signed) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((char)(B.position_word_signed) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((char)(B.position_word_signed) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((char)(B.position_word_signed) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((char)(B.position_word_signed) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(byte)(B.position_word_signed) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(byte)(B.position_word_signed) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(byte)(B.position_word_signed) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(byte)(B.position_word_signed) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
)

@partial_value_29_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.position_word_signed & 0x78
+ B.zpos & 0x78
|
- (byte)(B.position_word_signed) & 0x78
+ B.zpos & 0x78
|
- (char)(B.position_word_signed) & 0x78
+ B.zpos & 0x78
|
- (byte)(byte)(B.position_word_signed) & 0x78
+ B.zpos & 0x78
|
- (B.position_word_signed >> 3) & 0xf
+ B.zpos >> 3
|
- (B.position_word_signed & 0x78) >> 3
+ B.zpos >> 3
|
- ((byte)(B.position_word_signed) >> 3) & 0xf
+ B.zpos >> 3
|
- ((byte)(B.position_word_signed) & 0x78) >> 3
+ B.zpos >> 3
|
- ((char)(B.position_word_signed) >> 3) & 0xf
+ B.zpos >> 3
|
- ((char)(B.position_word_signed) & 0x78) >> 3
+ B.zpos >> 3
|
- ((byte)(byte)(B.position_word_signed) >> 3) & 0xf
+ B.zpos >> 3
|
- ((byte)(byte)(B.position_word_signed) & 0x78) >> 3
+ B.zpos >> 3
)

@partial_value_30_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.position_word_low & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- (B.position_word_low & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((byte)(B.position_word_low) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((byte)(B.position_word_low) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((char)(B.position_word_low) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((char)(B.position_word_low) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((byte)(byte)(B.position_word_low) & 0x78) == 0
+ (B.zpos & 0x78) == 0
|
- ((byte)(byte)(B.position_word_low) & 0x78) != 0
+ (B.zpos & 0x78) != 0
|
- ((B.position_word_low >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- ((B.position_word_low >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- ((B.position_word_low & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- ((B.position_word_low & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(B.position_word_low) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(B.position_word_low) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(B.position_word_low) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(B.position_word_low) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((char)(B.position_word_low) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((char)(B.position_word_low) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((char)(B.position_word_low) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((char)(B.position_word_low) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(byte)(B.position_word_low) >> 3) & 0xf) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(byte)(B.position_word_low) >> 3) & 0xf) != 0
+ (B.zpos & 0x78) != 0
|
- (((byte)(byte)(B.position_word_low) & 0x78) >> 3) == 0
+ (B.zpos & 0x78) == 0
|
- (((byte)(byte)(B.position_word_low) & 0x78) >> 3) != 0
+ (B.zpos & 0x78) != 0
)

@partial_value_30_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.position_word_low & 0x78
+ B.zpos & 0x78
|
- (byte)(B.position_word_low) & 0x78
+ B.zpos & 0x78
|
- (char)(B.position_word_low) & 0x78
+ B.zpos & 0x78
|
- (byte)(byte)(B.position_word_low) & 0x78
+ B.zpos & 0x78
|
- (B.position_word_low >> 3) & 0xf
+ B.zpos >> 3
|
- (B.position_word_low & 0x78) >> 3
+ B.zpos >> 3
|
- ((byte)(B.position_word_low) >> 3) & 0xf
+ B.zpos >> 3
|
- ((byte)(B.position_word_low) & 0x78) >> 3
+ B.zpos >> 3
|
- ((char)(B.position_word_low) >> 3) & 0xf
+ B.zpos >> 3
|
- ((char)(B.position_word_low) & 0x78) >> 3
+ B.zpos >> 3
|
- ((byte)(byte)(B.position_word_low) >> 3) & 0xf
+ B.zpos >> 3
|
- ((byte)(byte)(B.position_word_low) & 0x78) >> 3
+ B.zpos >> 3
)

@partial_value_31_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.chain_word & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- (B.chain_word & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((byte)(B.chain_word) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((byte)(B.chain_word) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((char)(B.chain_word) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((char)(B.chain_word) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((byte)(byte)(B.chain_word) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((byte)(byte)(B.chain_word) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((B.chain_word >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- ((B.chain_word >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- ((B.chain_word & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- ((B.chain_word & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(B.chain_word) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(B.chain_word) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(B.chain_word) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(B.chain_word) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((char)(B.chain_word) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((char)(B.chain_word) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((char)(B.chain_word) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((char)(B.chain_word) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(byte)(B.chain_word) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(byte)(B.chain_word) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(byte)(B.chain_word) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(byte)(B.chain_word) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
)

@partial_value_31_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.chain_word & 0x30
+ B.quality & 0x30
|
- (byte)(B.chain_word) & 0x30
+ B.quality & 0x30
|
- (char)(B.chain_word) & 0x30
+ B.quality & 0x30
|
- (byte)(byte)(B.chain_word) & 0x30
+ B.quality & 0x30
|
- (B.chain_word >> 4) & 0x3
+ B.quality >> 4
|
- (B.chain_word & 0x30) >> 4
+ B.quality >> 4
|
- ((byte)(B.chain_word) >> 4) & 0x3
+ B.quality >> 4
|
- ((byte)(B.chain_word) & 0x30) >> 4
+ B.quality >> 4
|
- ((char)(B.chain_word) >> 4) & 0x3
+ B.quality >> 4
|
- ((char)(B.chain_word) & 0x30) >> 4
+ B.quality >> 4
|
- ((byte)(byte)(B.chain_word) >> 4) & 0x3
+ B.quality >> 4
|
- ((byte)(byte)(B.chain_word) & 0x30) >> 4
+ B.quality >> 4
)

@partial_value_32_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.chain_word_signed & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- (B.chain_word_signed & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((byte)(B.chain_word_signed) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((byte)(B.chain_word_signed) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((char)(B.chain_word_signed) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((char)(B.chain_word_signed) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((byte)(byte)(B.chain_word_signed) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((byte)(byte)(B.chain_word_signed) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((B.chain_word_signed >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- ((B.chain_word_signed >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- ((B.chain_word_signed & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- ((B.chain_word_signed & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(B.chain_word_signed) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(B.chain_word_signed) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(B.chain_word_signed) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(B.chain_word_signed) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((char)(B.chain_word_signed) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((char)(B.chain_word_signed) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((char)(B.chain_word_signed) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((char)(B.chain_word_signed) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(byte)(B.chain_word_signed) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(byte)(B.chain_word_signed) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(byte)(B.chain_word_signed) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(byte)(B.chain_word_signed) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
)

@partial_value_32_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.chain_word_signed & 0x30
+ B.quality & 0x30
|
- (byte)(B.chain_word_signed) & 0x30
+ B.quality & 0x30
|
- (char)(B.chain_word_signed) & 0x30
+ B.quality & 0x30
|
- (byte)(byte)(B.chain_word_signed) & 0x30
+ B.quality & 0x30
|
- (B.chain_word_signed >> 4) & 0x3
+ B.quality >> 4
|
- (B.chain_word_signed & 0x30) >> 4
+ B.quality >> 4
|
- ((byte)(B.chain_word_signed) >> 4) & 0x3
+ B.quality >> 4
|
- ((byte)(B.chain_word_signed) & 0x30) >> 4
+ B.quality >> 4
|
- ((char)(B.chain_word_signed) >> 4) & 0x3
+ B.quality >> 4
|
- ((char)(B.chain_word_signed) & 0x30) >> 4
+ B.quality >> 4
|
- ((byte)(byte)(B.chain_word_signed) >> 4) & 0x3
+ B.quality >> 4
|
- ((byte)(byte)(B.chain_word_signed) & 0x30) >> 4
+ B.quality >> 4
)

@partial_value_33_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.chain_word_low & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- (B.chain_word_low & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((byte)(B.chain_word_low) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((byte)(B.chain_word_low) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((char)(B.chain_word_low) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((char)(B.chain_word_low) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((byte)(byte)(B.chain_word_low) & 0x30) == 0
+ (B.quality & 0x30) == 0
|
- ((byte)(byte)(B.chain_word_low) & 0x30) != 0
+ (B.quality & 0x30) != 0
|
- ((B.chain_word_low >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- ((B.chain_word_low >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- ((B.chain_word_low & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- ((B.chain_word_low & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(B.chain_word_low) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(B.chain_word_low) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(B.chain_word_low) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(B.chain_word_low) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((char)(B.chain_word_low) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((char)(B.chain_word_low) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((char)(B.chain_word_low) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((char)(B.chain_word_low) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(byte)(B.chain_word_low) >> 4) & 0x3) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(byte)(B.chain_word_low) >> 4) & 0x3) != 0
+ (B.quality & 0x30) != 0
|
- (((byte)(byte)(B.chain_word_low) & 0x30) >> 4) == 0
+ (B.quality & 0x30) == 0
|
- (((byte)(byte)(B.chain_word_low) & 0x30) >> 4) != 0
+ (B.quality & 0x30) != 0
)

@partial_value_33_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.chain_word_low & 0x30
+ B.quality & 0x30
|
- (byte)(B.chain_word_low) & 0x30
+ B.quality & 0x30
|
- (char)(B.chain_word_low) & 0x30
+ B.quality & 0x30
|
- (byte)(byte)(B.chain_word_low) & 0x30
+ B.quality & 0x30
|
- (B.chain_word_low >> 4) & 0x3
+ B.quality >> 4
|
- (B.chain_word_low & 0x30) >> 4
+ B.quality >> 4
|
- ((byte)(B.chain_word_low) >> 4) & 0x3
+ B.quality >> 4
|
- ((byte)(B.chain_word_low) & 0x30) >> 4
+ B.quality >> 4
|
- ((char)(B.chain_word_low) >> 4) & 0x3
+ B.quality >> 4
|
- ((char)(B.chain_word_low) & 0x30) >> 4
+ B.quality >> 4
|
- ((byte)(byte)(B.chain_word_low) >> 4) & 0x3
+ B.quality >> 4
|
- ((byte)(byte)(B.chain_word_low) & 0x30) >> 4
+ B.quality >> 4
)

@partial_value_34_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- (B.link_word & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((byte)(B.link_word) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((byte)(B.link_word) & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((char)(B.link_word) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((char)(B.link_word) & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((byte)(byte)(B.link_word) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((byte)(byte)(B.link_word) & 0x7) != 0
+ (B.owner & 0x7) != 0
)

@partial_value_34_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word & 0x7
+ B.owner & 0x7
|
- (byte)(B.link_word) & 0x7
+ B.owner & 0x7
|
- (char)(B.link_word) & 0x7
+ B.owner & 0x7
|
- (byte)(byte)(B.link_word) & 0x7
+ B.owner & 0x7
)

@partial_value_35_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_signed & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- (B.link_word_signed & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((byte)(B.link_word_signed) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((byte)(B.link_word_signed) & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((char)(B.link_word_signed) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((char)(B.link_word_signed) & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((byte)(byte)(B.link_word_signed) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((byte)(byte)(B.link_word_signed) & 0x7) != 0
+ (B.owner & 0x7) != 0
)

@partial_value_35_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_signed & 0x7
+ B.owner & 0x7
|
- (byte)(B.link_word_signed) & 0x7
+ B.owner & 0x7
|
- (char)(B.link_word_signed) & 0x7
+ B.owner & 0x7
|
- (byte)(byte)(B.link_word_signed) & 0x7
+ B.owner & 0x7
)

@partial_value_36_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_low & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- (B.link_word_low & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((byte)(B.link_word_low) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((byte)(B.link_word_low) & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((char)(B.link_word_low) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((char)(B.link_word_low) & 0x7) != 0
+ (B.owner & 0x7) != 0
|
- ((byte)(byte)(B.link_word_low) & 0x7) == 0
+ (B.owner & 0x7) == 0
|
- ((byte)(byte)(B.link_word_low) & 0x7) != 0
+ (B.owner & 0x7) != 0
)

@partial_value_36_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_low & 0x7
+ B.owner & 0x7
|
- (byte)(B.link_word_low) & 0x7
+ B.owner & 0x7
|
- (char)(B.link_word_low) & 0x7
+ B.owner & 0x7
|
- (byte)(byte)(B.link_word_low) & 0x7
+ B.owner & 0x7
)

@partial_value_37_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- (B.link_word & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((byte)(B.link_word) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((byte)(B.link_word) & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((char)(B.link_word) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((char)(B.link_word) & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((byte)(byte)(B.link_word) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((byte)(byte)(B.link_word) & 0xf) != 0
+ (B.owner & 0xf) != 0
)

@partial_value_37_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word & 0xf
+ B.owner & 0xf
|
- (byte)(B.link_word) & 0xf
+ B.owner & 0xf
|
- (char)(B.link_word) & 0xf
+ B.owner & 0xf
|
- (byte)(byte)(B.link_word) & 0xf
+ B.owner & 0xf
)

@partial_value_38_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_signed & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- (B.link_word_signed & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((byte)(B.link_word_signed) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((byte)(B.link_word_signed) & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((char)(B.link_word_signed) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((char)(B.link_word_signed) & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((byte)(byte)(B.link_word_signed) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((byte)(byte)(B.link_word_signed) & 0xf) != 0
+ (B.owner & 0xf) != 0
)

@partial_value_38_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_signed & 0xf
+ B.owner & 0xf
|
- (byte)(B.link_word_signed) & 0xf
+ B.owner & 0xf
|
- (char)(B.link_word_signed) & 0xf
+ B.owner & 0xf
|
- (byte)(byte)(B.link_word_signed) & 0xf
+ B.owner & 0xf
)

@partial_value_39_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_low & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- (B.link_word_low & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((byte)(B.link_word_low) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((byte)(B.link_word_low) & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((char)(B.link_word_low) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((char)(B.link_word_low) & 0xf) != 0
+ (B.owner & 0xf) != 0
|
- ((byte)(byte)(B.link_word_low) & 0xf) == 0
+ (B.owner & 0xf) == 0
|
- ((byte)(byte)(B.link_word_low) & 0xf) != 0
+ (B.owner & 0xf) != 0
)

@partial_value_39_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_low & 0xf
+ B.owner & 0xf
|
- (byte)(B.link_word_low) & 0xf
+ B.owner & 0xf
|
- (char)(B.link_word_low) & 0xf
+ B.owner & 0xf
|
- (byte)(byte)(B.link_word_low) & 0xf
+ B.owner & 0xf
)

@partial_value_40_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- (B.link_word & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((byte)(B.link_word) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((byte)(B.link_word) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((char)(B.link_word) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((char)(B.link_word) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((byte)(byte)(B.link_word) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((byte)(byte)(B.link_word) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
)

@partial_value_40_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word & 0x1f
+ B.owner & 0x1f
|
- (byte)(B.link_word) & 0x1f
+ B.owner & 0x1f
|
- (char)(B.link_word) & 0x1f
+ B.owner & 0x1f
|
- (byte)(byte)(B.link_word) & 0x1f
+ B.owner & 0x1f
)

@partial_value_41_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_signed & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- (B.link_word_signed & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((byte)(B.link_word_signed) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((byte)(B.link_word_signed) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((char)(B.link_word_signed) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((char)(B.link_word_signed) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((byte)(byte)(B.link_word_signed) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((byte)(byte)(B.link_word_signed) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
)

@partial_value_41_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_signed & 0x1f
+ B.owner & 0x1f
|
- (byte)(B.link_word_signed) & 0x1f
+ B.owner & 0x1f
|
- (char)(B.link_word_signed) & 0x1f
+ B.owner & 0x1f
|
- (byte)(byte)(B.link_word_signed) & 0x1f
+ B.owner & 0x1f
)

@partial_value_42_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_low & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- (B.link_word_low & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((byte)(B.link_word_low) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((byte)(B.link_word_low) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((char)(B.link_word_low) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((char)(B.link_word_low) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
|
- ((byte)(byte)(B.link_word_low) & 0x1f) == 0
+ (B.owner & 0x1f) == 0
|
- ((byte)(byte)(B.link_word_low) & 0x1f) != 0
+ (B.owner & 0x1f) != 0
)

@partial_value_42_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_low & 0x1f
+ B.owner & 0x1f
|
- (byte)(B.link_word_low) & 0x1f
+ B.owner & 0x1f
|
- (char)(B.link_word_low) & 0x1f
+ B.owner & 0x1f
|
- (byte)(byte)(B.link_word_low) & 0x1f
+ B.owner & 0x1f
)

@partial_value_43_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- (B.link_word & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((byte)(B.link_word) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((byte)(B.link_word) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((char)(B.link_word) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((char)(B.link_word) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((byte)(byte)(B.link_word) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((byte)(byte)(B.link_word) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((B.link_word >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- ((B.link_word >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- ((B.link_word & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- ((B.link_word & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(B.link_word) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(B.link_word) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(B.link_word) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(B.link_word) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((char)(B.link_word) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((char)(B.link_word) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((char)(B.link_word) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((char)(B.link_word) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(byte)(B.link_word) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(byte)(B.link_word) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(byte)(B.link_word) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(byte)(B.link_word) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
)

@partial_value_43_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word & 0x30
+ B.owner & 0x30
|
- (byte)(B.link_word) & 0x30
+ B.owner & 0x30
|
- (char)(B.link_word) & 0x30
+ B.owner & 0x30
|
- (byte)(byte)(B.link_word) & 0x30
+ B.owner & 0x30
|
- (B.link_word >> 4) & 0x3
+ B.owner >> 4
|
- (B.link_word & 0x30) >> 4
+ B.owner >> 4
|
- ((byte)(B.link_word) >> 4) & 0x3
+ B.owner >> 4
|
- ((byte)(B.link_word) & 0x30) >> 4
+ B.owner >> 4
|
- ((char)(B.link_word) >> 4) & 0x3
+ B.owner >> 4
|
- ((char)(B.link_word) & 0x30) >> 4
+ B.owner >> 4
|
- ((byte)(byte)(B.link_word) >> 4) & 0x3
+ B.owner >> 4
|
- ((byte)(byte)(B.link_word) & 0x30) >> 4
+ B.owner >> 4
)

@partial_value_44_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_signed & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- (B.link_word_signed & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((byte)(B.link_word_signed) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((byte)(B.link_word_signed) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((char)(B.link_word_signed) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((char)(B.link_word_signed) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((byte)(byte)(B.link_word_signed) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((byte)(byte)(B.link_word_signed) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((B.link_word_signed >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- ((B.link_word_signed >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- ((B.link_word_signed & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- ((B.link_word_signed & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(B.link_word_signed) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(B.link_word_signed) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(B.link_word_signed) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(B.link_word_signed) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((char)(B.link_word_signed) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((char)(B.link_word_signed) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((char)(B.link_word_signed) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((char)(B.link_word_signed) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(byte)(B.link_word_signed) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(byte)(B.link_word_signed) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(byte)(B.link_word_signed) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(byte)(B.link_word_signed) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
)

@partial_value_44_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_signed & 0x30
+ B.owner & 0x30
|
- (byte)(B.link_word_signed) & 0x30
+ B.owner & 0x30
|
- (char)(B.link_word_signed) & 0x30
+ B.owner & 0x30
|
- (byte)(byte)(B.link_word_signed) & 0x30
+ B.owner & 0x30
|
- (B.link_word_signed >> 4) & 0x3
+ B.owner >> 4
|
- (B.link_word_signed & 0x30) >> 4
+ B.owner >> 4
|
- ((byte)(B.link_word_signed) >> 4) & 0x3
+ B.owner >> 4
|
- ((byte)(B.link_word_signed) & 0x30) >> 4
+ B.owner >> 4
|
- ((char)(B.link_word_signed) >> 4) & 0x3
+ B.owner >> 4
|
- ((char)(B.link_word_signed) & 0x30) >> 4
+ B.owner >> 4
|
- ((byte)(byte)(B.link_word_signed) >> 4) & 0x3
+ B.owner >> 4
|
- ((byte)(byte)(B.link_word_signed) & 0x30) >> 4
+ B.owner >> 4
)

@partial_value_45_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_low & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- (B.link_word_low & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((byte)(B.link_word_low) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((byte)(B.link_word_low) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((char)(B.link_word_low) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((char)(B.link_word_low) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((byte)(byte)(B.link_word_low) & 0x30) == 0
+ (B.owner & 0x30) == 0
|
- ((byte)(byte)(B.link_word_low) & 0x30) != 0
+ (B.owner & 0x30) != 0
|
- ((B.link_word_low >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- ((B.link_word_low >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- ((B.link_word_low & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- ((B.link_word_low & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(B.link_word_low) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(B.link_word_low) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(B.link_word_low) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(B.link_word_low) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((char)(B.link_word_low) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((char)(B.link_word_low) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((char)(B.link_word_low) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((char)(B.link_word_low) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(byte)(B.link_word_low) >> 4) & 0x3) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(byte)(B.link_word_low) >> 4) & 0x3) != 0
+ (B.owner & 0x30) != 0
|
- (((byte)(byte)(B.link_word_low) & 0x30) >> 4) == 0
+ (B.owner & 0x30) == 0
|
- (((byte)(byte)(B.link_word_low) & 0x30) >> 4) != 0
+ (B.owner & 0x30) != 0
)

@partial_value_45_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_low & 0x30
+ B.owner & 0x30
|
- (byte)(B.link_word_low) & 0x30
+ B.owner & 0x30
|
- (char)(B.link_word_low) & 0x30
+ B.owner & 0x30
|
- (byte)(byte)(B.link_word_low) & 0x30
+ B.owner & 0x30
|
- (B.link_word_low >> 4) & 0x3
+ B.owner >> 4
|
- (B.link_word_low & 0x30) >> 4
+ B.owner >> 4
|
- ((byte)(B.link_word_low) >> 4) & 0x3
+ B.owner >> 4
|
- ((byte)(B.link_word_low) & 0x30) >> 4
+ B.owner >> 4
|
- ((char)(B.link_word_low) >> 4) & 0x3
+ B.owner >> 4
|
- ((char)(B.link_word_low) & 0x30) >> 4
+ B.owner >> 4
|
- ((byte)(byte)(B.link_word_low) >> 4) & 0x3
+ B.owner >> 4
|
- ((byte)(byte)(B.link_word_low) & 0x30) >> 4
+ B.owner >> 4
)

@partial_value_46_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word & 0x7fc0) == 0
+ (B.link & 0x1ff) == 0
|
- (B.link_word & 0x7fc0) != 0
+ (B.link & 0x1ff) != 0
|
- ((B.link_word >> 6) & 0x1ff) == 0
+ (B.link & 0x1ff) == 0
|
- ((B.link_word >> 6) & 0x1ff) != 0
+ (B.link & 0x1ff) != 0
|
- ((B.link_word & 0x7fc0) >> 6) == 0
+ (B.link & 0x1ff) == 0
|
- ((B.link_word & 0x7fc0) >> 6) != 0
+ (B.link & 0x1ff) != 0
)

@partial_value_46_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word & 0x7fc0
+ (B.link & 0x1ff) << 6
|
- (B.link_word >> 6) & 0x1ff
+ B.link & 0x1ff
|
- (B.link_word & 0x7fc0) >> 6
+ B.link & 0x1ff
)

@partial_value_47_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_signed & 0x7fc0) == 0
+ (B.link & 0x1ff) == 0
|
- (B.link_word_signed & 0x7fc0) != 0
+ (B.link & 0x1ff) != 0
|
- ((B.link_word_signed >> 6) & 0x1ff) == 0
+ (B.link & 0x1ff) == 0
|
- ((B.link_word_signed >> 6) & 0x1ff) != 0
+ (B.link & 0x1ff) != 0
|
- ((B.link_word_signed & 0x7fc0) >> 6) == 0
+ (B.link & 0x1ff) == 0
|
- ((B.link_word_signed & 0x7fc0) >> 6) != 0
+ (B.link & 0x1ff) != 0
)

@partial_value_47_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_signed & 0x7fc0
+ (B.link & 0x1ff) << 6
|
- (B.link_word_signed >> 6) & 0x1ff
+ B.link & 0x1ff
|
- (B.link_word_signed & 0x7fc0) >> 6
+ B.link & 0x1ff
)

@partial_value_48_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word & 0x8000) == 0
+ (B.link & 0x200) == 0
|
- (B.link_word & 0x8000) != 0
+ (B.link & 0x200) != 0
|
- ((B.link_word >> 15) & 0x1) == 0
+ (B.link & 0x200) == 0
|
- ((B.link_word >> 15) & 0x1) != 0
+ (B.link & 0x200) != 0
|
- ((B.link_word & 0x8000) >> 15) == 0
+ (B.link & 0x200) == 0
|
- ((B.link_word & 0x8000) >> 15) != 0
+ (B.link & 0x200) != 0
)

@partial_value_48_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word & 0x8000
+ (B.link & 0x200) << 6
|
- (B.link_word >> 15) & 0x1
+ B.link >> 9
|
- (B.link_word & 0x8000) >> 15
+ B.link >> 9
)

@partial_value_49_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_signed & 0x8000) == 0
+ (B.link & 0x200) == 0
|
- (B.link_word_signed & 0x8000) != 0
+ (B.link & 0x200) != 0
|
- ((B.link_word_signed >> 15) & 0x1) == 0
+ (B.link & 0x200) == 0
|
- ((B.link_word_signed >> 15) & 0x1) != 0
+ (B.link & 0x200) != 0
|
- ((B.link_word_signed & 0x8000) >> 15) == 0
+ (B.link & 0x200) == 0
|
- ((B.link_word_signed & 0x8000) >> 15) != 0
+ (B.link & 0x200) != 0
)

@partial_value_49_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_signed & 0x8000
+ (B.link & 0x200) << 6
|
- (B.link_word_signed >> 15) & 0x1
+ B.link >> 9
|
- (B.link_word_signed & 0x8000) >> 15
+ B.link >> 9
)

@partial_value_50_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.link_word_high & 0x80) == 0
+ (B.link & 0x200) == 0
|
- (B.link_word_high & 0x80) != 0
+ (B.link & 0x200) != 0
|
- ((byte)(B.link_word_high) & 0x80) == 0
+ (B.link & 0x200) == 0
|
- ((byte)(B.link_word_high) & 0x80) != 0
+ (B.link & 0x200) != 0
|
- ((char)(B.link_word_high) & 0x80) == 0
+ (B.link & 0x200) == 0
|
- ((char)(B.link_word_high) & 0x80) != 0
+ (B.link & 0x200) != 0
|
- ((byte)(byte)(B.link_word_high) & 0x80) == 0
+ (B.link & 0x200) == 0
|
- ((byte)(byte)(B.link_word_high) & 0x80) != 0
+ (B.link & 0x200) != 0
|
- ((B.link_word_high >> 7) & 0x1) == 0
+ (B.link & 0x200) == 0
|
- ((B.link_word_high >> 7) & 0x1) != 0
+ (B.link & 0x200) != 0
|
- ((B.link_word_high & 0x80) >> 7) == 0
+ (B.link & 0x200) == 0
|
- ((B.link_word_high & 0x80) >> 7) != 0
+ (B.link & 0x200) != 0
|
- (((byte)(B.link_word_high) >> 7) & 0x1) == 0
+ (B.link & 0x200) == 0
|
- (((byte)(B.link_word_high) >> 7) & 0x1) != 0
+ (B.link & 0x200) != 0
|
- (((byte)(B.link_word_high) & 0x80) >> 7) == 0
+ (B.link & 0x200) == 0
|
- (((byte)(B.link_word_high) & 0x80) >> 7) != 0
+ (B.link & 0x200) != 0
|
- (((char)(B.link_word_high) >> 7) & 0x1) == 0
+ (B.link & 0x200) == 0
|
- (((char)(B.link_word_high) >> 7) & 0x1) != 0
+ (B.link & 0x200) != 0
|
- (((char)(B.link_word_high) & 0x80) >> 7) == 0
+ (B.link & 0x200) == 0
|
- (((char)(B.link_word_high) & 0x80) >> 7) != 0
+ (B.link & 0x200) != 0
|
- (((byte)(byte)(B.link_word_high) >> 7) & 0x1) == 0
+ (B.link & 0x200) == 0
|
- (((byte)(byte)(B.link_word_high) >> 7) & 0x1) != 0
+ (B.link & 0x200) != 0
|
- (((byte)(byte)(B.link_word_high) & 0x80) >> 7) == 0
+ (B.link & 0x200) == 0
|
- (((byte)(byte)(B.link_word_high) & 0x80) >> 7) != 0
+ (B.link & 0x200) != 0
)

@partial_value_50_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.link_word_high & 0x80
+ (B.link & 0x200) >> 2
|
- (byte)(B.link_word_high) & 0x80
+ (B.link & 0x200) >> 2
|
- (char)(B.link_word_high) & 0x80
+ (B.link & 0x200) >> 2
|
- (byte)(byte)(B.link_word_high) & 0x80
+ (B.link & 0x200) >> 2
|
- (B.link_word_high >> 7) & 0x1
+ B.link >> 9
|
- (B.link_word_high & 0x80) >> 7
+ B.link >> 9
|
- ((byte)(B.link_word_high) >> 7) & 0x1
+ B.link >> 9
|
- ((byte)(B.link_word_high) & 0x80) >> 7
+ B.link >> 9
|
- ((char)(B.link_word_high) >> 7) & 0x1
+ B.link >> 9
|
- ((char)(B.link_word_high) & 0x80) >> 7
+ B.link >> 9
|
- ((byte)(byte)(B.link_word_high) >> 7) & 0x1
+ B.link >> 9
|
- ((byte)(byte)(B.link_word_high) & 0x80) >> 7
+ B.link >> 9
)

@partial_value_51_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.tile_word & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (B.tile_word & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((byte)(B.tile_word) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((byte)(B.tile_word) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((char)(B.tile_word) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((char)(B.tile_word) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((byte)(byte)(B.tile_word) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((byte)(byte)(B.tile_word) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((B.tile_word >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((B.tile_word >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((B.tile_word & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((B.tile_word & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(B.tile_word) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(B.tile_word) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(B.tile_word) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(B.tile_word) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((char)(B.tile_word) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((char)(B.tile_word) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((char)(B.tile_word) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((char)(B.tile_word) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B.tile_word) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B.tile_word) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B.tile_word) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B.tile_word) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
)

@partial_value_51_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.tile_word & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (byte)(B.tile_word) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (char)(B.tile_word) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (byte)(byte)(B.tile_word) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (B.tile_word >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- (B.tile_word & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((byte)(B.tile_word) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((byte)(B.tile_word) & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((char)(B.tile_word) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((char)(B.tile_word) & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((byte)(byte)(B.tile_word) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((byte)(byte)(B.tile_word) & 0xf0) >> 4
+ B.npc_yhome & 0xf
)

@partial_value_52_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.tile_word_signed & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (B.tile_word_signed & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((byte)(B.tile_word_signed) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((byte)(B.tile_word_signed) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((char)(B.tile_word_signed) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((char)(B.tile_word_signed) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((byte)(byte)(B.tile_word_signed) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((byte)(byte)(B.tile_word_signed) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((B.tile_word_signed >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((B.tile_word_signed >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((B.tile_word_signed & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((B.tile_word_signed & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(B.tile_word_signed) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(B.tile_word_signed) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(B.tile_word_signed) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(B.tile_word_signed) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((char)(B.tile_word_signed) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((char)(B.tile_word_signed) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((char)(B.tile_word_signed) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((char)(B.tile_word_signed) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B.tile_word_signed) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B.tile_word_signed) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B.tile_word_signed) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B.tile_word_signed) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
)

@partial_value_52_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.tile_word_signed & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (byte)(B.tile_word_signed) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (char)(B.tile_word_signed) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (byte)(byte)(B.tile_word_signed) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (B.tile_word_signed >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- (B.tile_word_signed & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((byte)(B.tile_word_signed) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((byte)(B.tile_word_signed) & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((char)(B.tile_word_signed) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((char)(B.tile_word_signed) & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((byte)(byte)(B.tile_word_signed) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((byte)(byte)(B.tile_word_signed) & 0xf0) >> 4
+ B.npc_yhome & 0xf
)

@partial_value_53_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.tile_word_low & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (B.tile_word_low & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((byte)(B.tile_word_low) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((byte)(B.tile_word_low) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((char)(B.tile_word_low) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((char)(B.tile_word_low) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((byte)(byte)(B.tile_word_low) & 0xf0) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((byte)(byte)(B.tile_word_low) & 0xf0) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((B.tile_word_low >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((B.tile_word_low >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- ((B.tile_word_low & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- ((B.tile_word_low & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(B.tile_word_low) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(B.tile_word_low) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(B.tile_word_low) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(B.tile_word_low) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((char)(B.tile_word_low) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((char)(B.tile_word_low) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((char)(B.tile_word_low) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((char)(B.tile_word_low) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B.tile_word_low) >> 4) & 0xf) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B.tile_word_low) >> 4) & 0xf) != 0
+ (B.npc_yhome & 0xf) != 0
|
- (((byte)(byte)(B.tile_word_low) & 0xf0) >> 4) == 0
+ (B.npc_yhome & 0xf) == 0
|
- (((byte)(byte)(B.tile_word_low) & 0xf0) >> 4) != 0
+ (B.npc_yhome & 0xf) != 0
)

@partial_value_53_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.tile_word_low & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (byte)(B.tile_word_low) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (char)(B.tile_word_low) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (byte)(byte)(B.tile_word_low) & 0xf0
+ (B.npc_yhome & 0xf) << 4
|
- (B.tile_word_low >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- (B.tile_word_low & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((byte)(B.tile_word_low) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((byte)(B.tile_word_low) & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((char)(B.tile_word_low) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((char)(B.tile_word_low) & 0xf0) >> 4
+ B.npc_yhome & 0xf
|
- ((byte)(byte)(B.tile_word_low) >> 4) & 0xf
+ B.npc_yhome & 0xf
|
- ((byte)(byte)(B.tile_word_low) & 0xf0) >> 4
+ B.npc_yhome & 0xf
)

@partial_value_54_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.tile_word & 0x3c00) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (B.tile_word & 0x3c00) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((B.tile_word >> 10) & 0xf) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((B.tile_word >> 10) & 0xf) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((B.tile_word & 0x3c00) >> 10) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((B.tile_word & 0x3c00) >> 10) != 0
+ (B.npc_xhome & 0xf) != 0
)

@partial_value_54_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.tile_word & 0x3c00
+ (B.npc_xhome & 0xf) << 10
|
- (B.tile_word >> 10) & 0xf
+ B.npc_xhome & 0xf
|
- (B.tile_word & 0x3c00) >> 10
+ B.npc_xhome & 0xf
)

@partial_value_55_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.tile_word_signed & 0x3c00) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (B.tile_word_signed & 0x3c00) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((B.tile_word_signed >> 10) & 0xf) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((B.tile_word_signed >> 10) & 0xf) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((B.tile_word_signed & 0x3c00) >> 10) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((B.tile_word_signed & 0x3c00) >> 10) != 0
+ (B.npc_xhome & 0xf) != 0
)

@partial_value_55_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.tile_word_signed & 0x3c00
+ (B.npc_xhome & 0xf) << 10
|
- (B.tile_word_signed >> 10) & 0xf
+ B.npc_xhome & 0xf
|
- (B.tile_word_signed & 0x3c00) >> 10
+ B.npc_xhome & 0xf
)

@partial_value_56_compare disable is_zero, isnt_zero, drop_cast@
expression B;
typedef byte;
@@
(
- (B.tile_word_high & 0x3c) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (B.tile_word_high & 0x3c) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((byte)(B.tile_word_high) & 0x3c) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((byte)(B.tile_word_high) & 0x3c) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((char)(B.tile_word_high) & 0x3c) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((char)(B.tile_word_high) & 0x3c) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((byte)(byte)(B.tile_word_high) & 0x3c) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((byte)(byte)(B.tile_word_high) & 0x3c) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((B.tile_word_high >> 2) & 0xf) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((B.tile_word_high >> 2) & 0xf) != 0
+ (B.npc_xhome & 0xf) != 0
|
- ((B.tile_word_high & 0x3c) >> 2) == 0
+ (B.npc_xhome & 0xf) == 0
|
- ((B.tile_word_high & 0x3c) >> 2) != 0
+ (B.npc_xhome & 0xf) != 0
|
- (((byte)(B.tile_word_high) >> 2) & 0xf) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (((byte)(B.tile_word_high) >> 2) & 0xf) != 0
+ (B.npc_xhome & 0xf) != 0
|
- (((byte)(B.tile_word_high) & 0x3c) >> 2) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (((byte)(B.tile_word_high) & 0x3c) >> 2) != 0
+ (B.npc_xhome & 0xf) != 0
|
- (((char)(B.tile_word_high) >> 2) & 0xf) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (((char)(B.tile_word_high) >> 2) & 0xf) != 0
+ (B.npc_xhome & 0xf) != 0
|
- (((char)(B.tile_word_high) & 0x3c) >> 2) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (((char)(B.tile_word_high) & 0x3c) >> 2) != 0
+ (B.npc_xhome & 0xf) != 0
|
- (((byte)(byte)(B.tile_word_high) >> 2) & 0xf) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (((byte)(byte)(B.tile_word_high) >> 2) & 0xf) != 0
+ (B.npc_xhome & 0xf) != 0
|
- (((byte)(byte)(B.tile_word_high) & 0x3c) >> 2) == 0
+ (B.npc_xhome & 0xf) == 0
|
- (((byte)(byte)(B.tile_word_high) & 0x3c) >> 2) != 0
+ (B.npc_xhome & 0xf) != 0
)

@partial_value_56_read disable drop_cast@
expression B;
typedef byte;
@@
(
- B.tile_word_high & 0x3c
+ (B.npc_xhome & 0xf) << 2
|
- (byte)(B.tile_word_high) & 0x3c
+ (B.npc_xhome & 0xf) << 2
|
- (char)(B.tile_word_high) & 0x3c
+ (B.npc_xhome & 0xf) << 2
|
- (byte)(byte)(B.tile_word_high) & 0x3c
+ (B.npc_xhome & 0xf) << 2
|
- (B.tile_word_high >> 2) & 0xf
+ B.npc_xhome & 0xf
|
- (B.tile_word_high & 0x3c) >> 2
+ B.npc_xhome & 0xf
|
- ((byte)(B.tile_word_high) >> 2) & 0xf
+ B.npc_xhome & 0xf
|
- ((byte)(B.tile_word_high) & 0x3c) >> 2
+ B.npc_xhome & 0xf
|
- ((char)(B.tile_word_high) >> 2) & 0xf
+ B.npc_xhome & 0xf
|
- ((char)(B.tile_word_high) & 0x3c) >> 2
+ B.npc_xhome & 0xf
|
- ((byte)(byte)(B.tile_word_high) >> 2) & 0xf
+ B.npc_xhome & 0xf
|
- ((byte)(byte)(B.tile_word_high) & 0x3c) >> 2
+ B.npc_xhome & 0xf
)
