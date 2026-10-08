"""Retype UW1 object lookup/factory returns without changing arena selection."""
from pathlib import Path
functions = ['alloc_object_slot','resolve_object_link','get_object_record_by_slot_index',
             'spawn_new_object','spawn_object_near_player','find_object_in_world',
             'find_object_in_chain','find_object_by_encoded_slot_in_chain',
             'reallocate_object_to_arena','settle_dropped_object','get_equipped_item_at_slot']
rules=[]
for i,name in enumerate(functions):
    rules += [f'''@definition_{i}@
type T;
parameter list args;
typedef uw_object_hdr_t;
@@
- T *{name}(args)
+ uw_object_hdr_t *{name}(args)
 {{ ... }}

@declaration_{i}@
type T;
parameter list args;
typedef uw_object_hdr_t;
@@
- T *{name}(args);
+ uw_object_hdr_t *{name}(args);
''']
Path(__file__).with_name('object-returns.cocci').write_text('\n'.join(rules))
