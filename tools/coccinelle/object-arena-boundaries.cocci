/* Byte-addressed UW1 arena boundaries: 256 mobile records followed by
 * 768 static headers. Cast only after computing the original byte offset. */
@allocation_local@
typedef uw_object_hdr_t;
@@
uw_object_hdr_t *alloc_object_slot(...) {
<...
- void *pvVar1;
+ uw_object_hdr_t *pvVar1;
...>
}

@allocation_static@
typedef uw_object_hdr_t;
@@
uw_object_hdr_t *alloc_object_slot(...) {
<...
- pvVar1 = DAT_002046c4 + (*(short *)DAT_0020469c - 0x100) * 8;
+ pvVar1 = (uw_object_hdr_t *)(DAT_002046c4 + (*(short *)DAT_0020469c - 0x100) * 8);
...>
}

@allocation_mobile@
typedef uw_object_hdr_t, ushort, uint;
@@
uw_object_hdr_t *alloc_object_slot(...) {
<...
- pvVar1 = (uint)*(ushort *)DAT_002046a8 * 0x1b + DAT_002046b8;
+ pvVar1 = (uw_object_hdr_t *)((uint)*(ushort *)DAT_002046a8 * 0x1b + DAT_002046b8);
...>
}

@resolve_static@
typedef uw_object_hdr_t;
@@
uw_object_hdr_t *resolve_object_link(...) {
<...
- return DAT_002046c4 + ((uVar1 >> 6) - 0x100) * 8;
+ return (uw_object_hdr_t *)(DAT_002046c4 + ((uVar1 >> 6) - 0x100) * 8);
...>
}

@resolve_mobile@
typedef uw_object_hdr_t, uint;
@@
uw_object_hdr_t *resolve_object_link(...) {
<...
- return (uint)(uVar1 >> 6) * 0x1b + DAT_002046b8;
+ return (uw_object_hdr_t *)((uint)(uVar1 >> 6) * 0x1b + DAT_002046b8);
...>
}

@indexed_return@
typedef uw_object_hdr_t;
@@
uw_object_hdr_t *get_object_record_by_slot_index(...) {
<...
- return (void *)iVar1;
+ return (uw_object_hdr_t *)iVar1;
...>
}
