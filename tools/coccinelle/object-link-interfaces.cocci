@resolve_object_link_definition@
identifier P;
parameter list rest;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *resolve_object_link(void *P, rest)
+ uw_object_hdr_t *resolve_object_link(ushort *P, rest)
  { ... }

@resolve_object_link_prototype@
identifier P;
parameter list rest;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *resolve_object_link(void *P, rest)
+ uw_object_hdr_t *resolve_object_link(ushort *P, rest)
 ;

@resolve_object_link_single_definition@
identifier P;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *resolve_object_link(void *P)
+ uw_object_hdr_t *resolve_object_link(ushort *P)
  { ... }

@resolve_object_link_single_prototype@
identifier P;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *resolve_object_link(void *P)
+ uw_object_hdr_t *resolve_object_link(ushort *P)
 ;

@find_object_by_encoded_slot_in_chain_definition@
identifier P;
parameter list rest;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *find_object_by_encoded_slot_in_chain(void *P, rest)
+ uw_object_hdr_t *find_object_by_encoded_slot_in_chain(ushort *P, rest)
  { ... }

@find_object_by_encoded_slot_in_chain_prototype@
identifier P;
parameter list rest;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *find_object_by_encoded_slot_in_chain(void *P, rest)
+ uw_object_hdr_t *find_object_by_encoded_slot_in_chain(ushort *P, rest)
 ;

@find_object_in_chain_definition@
identifier P;
parameter list rest;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *find_object_in_chain(void *P, rest)
+ uw_object_hdr_t *find_object_in_chain(ushort **P, rest)
  { ... }

@find_object_in_chain_prototype@
identifier P;
parameter list rest;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *find_object_in_chain(void *P, rest)
+ uw_object_hdr_t *find_object_in_chain(ushort **P, rest)
 ;
