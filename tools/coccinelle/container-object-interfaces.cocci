@discard_container_contents_definition@
type R;
identifier P;
parameter list rest;
typedef ushort, uw_object_hdr_t;
@@
- R discard_container_contents(ushort *P, rest)
+ R discard_container_contents(uw_object_hdr_t *P, rest)
 { ... }

@discard_container_contents_prototype@
type R;
identifier P;
parameter list rest;
typedef ushort, uw_object_hdr_t;
@@
- R discard_container_contents(ushort *P, rest)
+ R discard_container_contents(uw_object_hdr_t *P, rest)
 ;

@try_empty_container_definition@
type R;
identifier P;
parameter list rest;
typedef ushort, uw_object_hdr_t;
@@
- R try_empty_container(ushort *P, rest)
+ R try_empty_container(uw_object_hdr_t *P, rest)
 { ... }

@try_empty_container_prototype@
type R;
identifier P;
parameter list rest;
typedef ushort, uw_object_hdr_t;
@@
- R try_empty_container(ushort *P, rest)
+ R try_empty_container(uw_object_hdr_t *P, rest)
 ;

@place_rune_in_bag_definition@
type R;
identifier P;

typedef ushort, uw_object_hdr_t;
@@
- R place_rune_in_bag(short *P)
+ R place_rune_in_bag(uw_object_hdr_t *P)
 { ... }

@place_rune_in_bag_prototype@
type R;
identifier P;

typedef ushort, uw_object_hdr_t;
@@
- R place_rune_in_bag(short *P)
+ R place_rune_in_bag(uw_object_hdr_t *P)
 ;

@rune_id@
type R;
@@
R place_rune_in_bag(...) {
<...
- (int)*rune_object & 0x1ffU
+ rune_object->item_id
...>
}

@container_contents_word@
type R;
typedef byte;
@@
R discard_container_contents(...) {
<...
- *((byte *)container + 1) & 0x80
+ (container->is_quant << 7)
...>
}

@stack_definition@
type R;
identifier A, B;
typedef ushort, uw_object_hdr_t;
@@
- R objects_can_stack(ushort *A, ushort *B)
+ R objects_can_stack(const uw_object_hdr_t *A, const uw_object_hdr_t *B)
 { ... }

@stack_prototype@
type R;
identifier A, B;
typedef ushort, uw_object_hdr_t;
@@
- R objects_can_stack(ushort *A, ushort *B)
+ R objects_can_stack(const uw_object_hdr_t *A, const uw_object_hdr_t *B)
 ;
