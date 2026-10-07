#include "creatures_fixture.h"

void setUp(void) { creatures_fixture_reset(); }
void tearDown(void) { creatures_fixture_dispose(); }

static void test_level1_goblin_uses_its_associated_palette(void)
{
    TEST_ASSERT_EQUAL_INT(1, resolve_critter_sprite_tier(goblin[0] & 0x3f, 28, 0, 0));
    TEST_ASSERT_EQUAL_UINT(2, palette_used);
}
static void test_level1_goblin_loot_is_limited_to_its_actual_template(void)
{
    for (int seed = 0; seed < 256; seed++) {
        memcpy(goblin, original_goblin, sizeof original_goblin);
        spawned = placed = 0;
        rng_state = seed;
        spawn_creature_death_loot(goblin);
        byte *stats = DAT_001007d0_backing + 13 * 0x30;
        drop_monster_loot(goblin, stats[8] >> 5, (stats[10] >> 2) & 7);
        drop_creature_inventory_on_death(goblin);
        TEST_ASSERT_GREATER_THAN_UINT(0, placed);
        for (unsigned item = 0; item < placed; item++) {
            int type = types[item];
            char failure[100];
            snprintf(failure, sizeof failure, "Seed %d spawned unexpected loot type 0x%x", seed, type);
            TEST_ASSERT_TRUE_MESSAGE(type == 0xb0 || type == 0xdd || type == 0xc6 || type == 0x10 ||
                type == 7 || type == 0x20 || type == 0x18 || (type >= 0xa0 && type <= 0xa6),
                failure);
        }
    }
}
static void test_equipment_drop_quality_uses_the_level_roll_remainder(void)
{
    g_despawn_creature_record = (char *)DAT_001007d0_backing + 13 * 0x30;
    rolls[0] = 0; rolls[1] = 3; rolls[2] = 0; rolls[3] = 2;
    roll_count = 4;
    spawn_creature_equipment_drop(goblin);
    TEST_ASSERT_EQUAL_UINT(2, spawned);
    TEST_ASSERT_EQUAL_UINT(7, drops[0][2] & 0x3f);
    TEST_ASSERT_EQUAL_UINT(6, drops[1][2] & 0x3f);
}
static void test_level1_goblin_ranged_attack_spawns_a_sling_stone(void)
{
    byte *stats = DAT_001007d0_backing + 13 * 0x30;
    unsigned ammo = (stats[0x20] & 0x1e) >> 1;
    TEST_ASSERT_EQUAL_UINT(0, ammo);
    projectile = (ushort *)(DAT_002046b8 + 255 * 27);
    memset(projectile, 0, 27);
    spawn_npc_thrown_weapon(goblin, ammo, (&DAT_002027d1)[ammo * 3]);
    TEST_ASSERT_EQUAL_UINT(0, spawned); /* projectiles stay mobile until landing */
    ushort *tile = (ushort *)((byte *)arena + (28 * 64 + 36) * 4);
    TEST_ASSERT_EQUAL_PTR(projectile, resolve_object_link(tile + 1));
    TEST_ASSERT_EQUAL_UINT(DAT_002027d0_backing[1], projectile[0x13 / 2] >> 8 & 0x7f);
    TEST_ASSERT_EQUAL_UINT16(0x10, projectile[0] & 0x1ff);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_level1_goblin_uses_its_associated_palette);
    RUN_TEST(test_level1_goblin_loot_is_limited_to_its_actual_template);
    RUN_TEST(test_equipment_drop_quality_uses_the_level_roll_remainder);
    RUN_TEST(test_level1_goblin_ranged_attack_spawns_a_sling_stone);
    return UNITY_END();
}
