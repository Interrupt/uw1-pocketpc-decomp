@header_type@
typedef ushort, uint, uw_object_hdr_t;
@@
uint calculate_object_weight(
- ushort *object
+ uw_object_hdr_t *object
 ) { ... }

@item@
typedef uint;
@@
uint calculate_object_weight(...) {
<...
- uVar1 & 0x1ff
+ object->item_id
...>
}

@quant@
typedef uint;
@@
uint calculate_object_weight(...) {
<...
- (uVar1 & 0x8000) == 0
+ !object->is_quant
...>
}

@special@
typedef uint;
@@
uint calculate_object_weight(...) {
<...
- (object[3] & 0x8000) != 0
+ (object->link & 0x200) != 0
...>
}

@contents@
typedef uint;
@@
uint calculate_object_weight(...) {
<...
- (object[3] & 0xffc0) != 0
+ object->link != 0
...>
}

@link_address@
typedef uint;
@@
uint calculate_object_weight(...) {
<...
- object + 3
+ &object->link_word
...>
}

@quantity@
typedef uint;
@@
uint calculate_object_weight(...) {
<...
- object[3] >> 6
+ object->link
...>
}

@unused_word@
typedef ushort, uint;
@@
uint calculate_object_weight(...) {
- ushort uVar1;
...
- uVar1 = *object;
... }
