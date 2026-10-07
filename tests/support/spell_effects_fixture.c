#include "spell_effects_fixture.h"
#define fx spell_effects_fixture
SpellEffectsFixture spell_effects_fixture;
undefined1 DAT_0023c3dc, DAT_0023c3d8, DAT_0010142c;
char DAT_00101740_backing[448];
undefined4 DAT_00101440;
byte DAT_00101450, DAT_00101730;
char *DAT_00101404;
undefined1 DAT_00202c90_backing[8192], DAT_000878d0_backing[256];
undefined2 DAT_0023ae40_backing[16];

void spell_effects_fixture_reset(void)
{
    memset(&fx, 0, sizeof fx);
    uw_test_create_character(fx.character, fx.attributes, fx.player);
    fx.player[11]=(32<<10)|(2<<4);
    fx.target[0]=0x40;
    fx.target[3]=0x40; /* locked object */
    fx.target[6]=1;
    memset(DAT_00101740_backing, 0, sizeof DAT_00101740_backing);
    DAT_0010142c=0;
}
undefined4 dispatch_special_action(uint type, uint parameter, uintptr_t actor, intptr_t context)
{
    fx.dispatched_type=type; fx.dispatched_parameter=parameter;
    fx.dispatched_actor=actor; fx.dispatched_context=context;
    return 1;
}
int encode_object_slot_index(void *object)
{
    if (object == fx.effect) return 2;
    TEST_ASSERT_EQUAL_PTR(g_player_object, object);
    return 1;
}
void project_position_by_heading(int heading, int distance, ushort *x, ushort *y)
{
    (void)heading;
    TEST_ASSERT_EQUAL_INT(4, distance);
    TEST_ASSERT_EQUAL_INT(32, *x); TEST_ASSERT_EQUAL_INT(2, *y);
}
/* Isolate scanning geometry, but execute the restored callback with real
   host addresses and the same register arguments as the ARM scanner. */
void scan_area_for_matching_objects(int count, int owner, codeval *callback,
                                   int mode, int x, int y, int width, int height)
{
    (void)count; (void)mode;
    TEST_ASSERT_EQUAL_INT(1, owner);
    TEST_ASSERT_EQUAL_INT(30, x); TEST_ASSERT_EQUAL_INT(0, y);
    TEST_ASSERT_EQUAL_INT(5, width); TEST_ASSERT_EQUAL_INT(5, height);
    fx.scans++;
    if (callback) callback(32, 2, fx.target, fx.tile, owner);
}
int roll_dice_sum(int count, int sides)
{ fx.dice_count=count; fx.dice_sides=sides; return count*sides; }
void *tilemap_lookup(int x, int y)
{ return x == fx.los_x && y == fx.los_y ? fx.los_tile : fx.tile; }
void *resolve_object_link(void *link)
{ return link == fx.tile+2 ? fx.target : NULL; }
void *get_object_record_by_slot_index(int slot)
{ TEST_ASSERT_EQUAL_INT(1, slot); return g_player_object; }
undefined4 apply_typed_damage_to_object(ushort *target, ushort *attacker, int x, int y,
                                 int damage, int type)
{
    TEST_ASSERT_EQUAL_PTR(fx.target, target);
    TEST_ASSERT_EQUAL_PTR(g_player_object, attacker);
    (void)x; (void)y;
    fx.damage_calls++; fx.damage=damage; fx.damage_type=type;
    return 0;
}
void *spawn_and_prime_spell_effect_object(int type, byte *tile)
{
    TEST_ASSERT_EQUAL_PTR(fx.tile, tile);
    TEST_ASSERT_TRUE(type == 0x1c2 || type == 0x1c5);
    fx.spawns++;
    return fx.effect;
}
uint scheduler_add_entry(int slot, int type, int delay, int x, int y)
{
    TEST_ASSERT_EQUAL_INT(2, slot); TEST_ASSERT_EQUAL_INT(4, type);
    (void)delay; TEST_ASSERT_EQUAL_INT(32, x); TEST_ASSERT_EQUAL_INT(2, y);
    return 0;
}
void free_object_slot(void *object)
{ (void)object; TEST_FAIL_MESSAGE("Unexpected allocation failure"); }
void object_list_insert_head(void *head, void *object)
{
    TEST_ASSERT_EQUAL_PTR(fx.tile+2, head); TEST_ASSERT_EQUAL_PTR(fx.effect, object);
    fx.links++;
}
void spawn_effect_debris_burst(void *object, int x, int y)
{ TEST_ASSERT_EQUAL_PTR(fx.effect, object); (void)x; (void)y; }
ushort *find_object_in_chain(void *head, int a, int b, int c, int d)
{ (void)head; (void)a; (void)b; (void)c; (void)d; return fx.target+3; }
uint resolve_skill_gated_unlock_or_use(void *actor, void *target, void *link, int mode)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, actor); TEST_ASSERT_EQUAL_PTR(fx.target, target);
    TEST_ASSERT_EQUAL_PTR(fx.target+3, link); TEST_ASSERT_EQUAL_INT(5, mode); fx.unlocks++; return 1;
}
undefined4 resolve_damage_type_resistance(void *object, int damage, int type)
{ TEST_ASSERT_EQUAL_PTR(fx.target, object); (void)damage; (void)type; return fx.resist; }
undefined4 spawn_scheduled_effect_object(void *object, int group, int variant,
                                   int a, int b, int x, int y)
{
    TEST_ASSERT_EQUAL_PTR(fx.target, object);
    TEST_ASSERT_EQUAL_INT(7, group); fx.variant=variant; fx.effects++;
    (void)a; (void)b; TEST_ASSERT_EQUAL_INT(32, x); TEST_ASSERT_EQUAL_INT(2, y); return 1;
}
void npc_set_goal_for_object(void *object, int goal, int mode)
{
    TEST_ASSERT_EQUAL_PTR(fx.target, object); fx.goal_mode=mode;
    fx.goal=goal; fx.goal_changes++;
}
void configure_texture_detail_functions(void) {}
void refresh_player_equipment_effects(void) {}
