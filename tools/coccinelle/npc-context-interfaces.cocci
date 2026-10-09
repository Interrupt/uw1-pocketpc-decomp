@setup_definition@
typedef ushort, uw_mobile_object_t;
identifier P;
@@
- void setup_npc_ai_tick_state(ushort *P)
+ void setup_npc_ai_tick_state(uw_mobile_object_t *P)
 { ... }

@setup_prototype@
typedef ushort, uw_mobile_object_t;
identifier P;
@@
- void setup_npc_ai_tick_state(ushort *P);
+ void setup_npc_ai_tick_state(uw_mobile_object_t *P);

@goal_context_definition@
typedef uw_mobile_object_t;
identifier P;
parameter list rest;
@@
- void npc_set_goal_for_object(void *P, rest)
+ void npc_set_goal_for_object(uw_mobile_object_t *P, rest)
 { ... }

@goal_context_prototype@
typedef uw_mobile_object_t;
identifier P;
parameter list rest;
@@
- void npc_set_goal_for_object(void *P, rest);
+ void npc_set_goal_for_object(uw_mobile_object_t *P, rest);

@goal_context_local@
typedef ushort, uw_mobile_object_t;
@@
void npc_set_goal_for_object(...) {
<...
- ushort *npc = (ushort *)npc_ptr;
+ uw_mobile_object_t *npc = npc_ptr;
...
- ushort *saved_npc;
+ uw_mobile_object_t *saved_npc;
...>
}
