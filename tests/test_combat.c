#include "combat_fixture.h"
#include "game_fixture.h"

void setUp(void) { combat_fixture_reset(); }
void tearDown(void) { combat_fixture_dispose(); }

static void test_player_melee_swing_selects_critter(void)
{
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_INT(1, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_UINT16(2, DAT_00100620);
    TEST_ASSERT_EQUAL_INT(1, lookup_count);
    TEST_ASSERT_EQUAL_UINT16(2, lookup_slots[0]);
    TEST_ASSERT_EQUAL_UINT16(10, DAT_00100600);
    TEST_ASSERT_EQUAL_UINT16(10, DAT_00100604);
    TEST_ASSERT_LESS_THAN_UINT16(4, DAT_00100624);
    TEST_ASSERT_EQUAL_INT(0, wall_collision);
}

static void test_player_melee_swing_without_candidates_misses(void)
{
    TEST_ASSERT_EQUAL_INT(0, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(0, lookup_count);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00100620);
    TEST_ASSERT_EQUAL_INT(0, wall_collision);
}

static void test_player_melee_swing_does_not_hit_attacker(void)
{
    candidate(0, 1, 0);
    TEST_ASSERT_EQUAL_INT(0, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(1, lookup_count);
    TEST_ASSERT_EQUAL_UINT16(1, lookup_slots[0]);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00100620);
}

static void test_player_melee_swing_selects_nearest_critter(void)
{
    candidate(0, 2, 1);
    candidate(1, 3, 0);
    TEST_ASSERT_EQUAL_INT(1, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(2, lookup_count);
    TEST_ASSERT_EQUAL_UINT16(2, lookup_slots[0]);
    TEST_ASSERT_EQUAL_UINT16(3, lookup_slots[1]);
    TEST_ASSERT_EQUAL_UINT16(3, DAT_00100620);
}

static void test_attack_facing_covers_all_heading_pairs(void)
{
    DAT_00100620 = 2;
    for (int attacker = 0; attacker < 8; attacker++) {
        for (int target = 0; target < 8; target++) {
            object_at(1)[1] = attacker << 7;
            object_at(2)[1] = target << 7;
            lookup_count = 0;
            compute_attack_relative_facing();
            int expected = (target - attacker + 12) % 8;
            if (expected > 4) expected = 8 - expected;
            TEST_ASSERT_EQUAL_UINT8(expected, DAT_00100628);
            TEST_ASSERT_EQUAL_UINT16(2, lookup_slots[0]);
            TEST_ASSERT_EQUAL_UINT16(1, lookup_slots[1]);
        }
    }
}

static void test_full_player_swing_applies_damage_to_critter(void)
{
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(96, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(1, (byte)object_at(2)[9]);
    TEST_ASSERT_EQUAL_INT(1, effects);
}

static void test_failed_skill_check_keeps_full_object_pointers(void)
{
    candidate(0, 2, 0);
    skill_result = 1;
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(100, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(1, (byte)object_at(2)[9]);
    TEST_ASSERT_EQUAL_INT(1, impact_sounds);
    TEST_ASSERT_EQUAL_INT(0, effects);
}

static void test_full_swing_without_target_skips_damage(void)
{
    TEST_ASSERT_EQUAL_UINT(0, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(0, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(100, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_INT(1, impact_sounds);
}

static void test_critter_swing_at_same_faction_skips_damage(void)
{
    DAT_00100610 = 3;
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(0, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(0, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(100, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_INT(0, impact_sounds);
}

static void test_critter_swing_at_opposing_faction_preserves_pointers(void)
{
    DAT_00100610 = 3;
    mobile_objects[3 * 27 + 0x19] = 0x40;
    candidate(0, 2, 0);
    skill_result = 1;
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(100, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(3, (byte)object_at(2)[9]);
}

static void test_lethal_player_swing_marks_critter_dead_and_awards_experience(void)
{
    candidate(0, 2, 0);
    object_at(2)[4] = 4;
    ushort xp = 10;
    memcpy(((byte *)g_monster_type_props) + 5 * 0x30 + 0x28, &xp, sizeof(xp));
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_UINT8(0, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(0xc, mobile_objects[2 * 27 + 0x15] & 0x3f);
    TEST_ASSERT_EQUAL_UINT32(60, combat_player_experience());
    TEST_ASSERT_EQUAL_UINT8(1, player_stats[0x3d]);
    TEST_ASSERT_EQUAL_UINT(9, music_track);
}

static void test_killing_a_real_rat_grants_xp_once_without_leveling_new_character(void)
{
    combat_create_character();
    load_real_monster_data();
    ushort *rat=object_at(2);
    rat[0]=0x40;
    rat[4]=1;
    TEST_ASSERT_EQUAL_UINT8(1,player_stats[0x3d]);
    TEST_ASSERT_EQUAL_UINT32(0,combat_player_experience());
    TEST_ASSERT_EQUAL_UINT(1,apply_damage_to_object(rat,100,object_at(1)));
    /* OBJECTS.DAT rat XP stat is 6: 4*6 + 2d6, fixture dice roll 12. */
    TEST_ASSERT_EQUAL_UINT32(36,combat_player_experience());
    TEST_ASSERT_EQUAL_UINT8(1,player_stats[0x3d]);
    TEST_ASSERT_EQUAL_UINT(0,apply_damage_to_object(rat,100,object_at(1)));
    TEST_ASSERT_EQUAL_UINT32(36,combat_player_experience());
    TEST_ASSERT_EQUAL_UINT8(1,player_stats[0x3d]);
}
static void test_each_original_experience_threshold_advances_exactly_one_level(void)
{
    static const uint thresholds[]={500,1000,1500,2000,3000,4000,6000,
        8000,12000,16000,24000,32000,48000,64000,96000};
    DAT_00201b68=9; /* Prevent the original shallow-dungeon XP reduction. */
    for (unsigned i=0;i<sizeof thresholds/sizeof thresholds[0];i++) {
        combat_set_player_experience(thresholds[i]-1,i+1);
        grant_experience_points(0);
        TEST_ASSERT_EQUAL_UINT8(i+1,player_stats[0x3d]);
        grant_experience_points(1);
        TEST_ASSERT_EQUAL_UINT32(thresholds[i],combat_player_experience());
        TEST_ASSERT_EQUAL_UINT8(i+2,player_stats[0x3d]);
        char expected[16];
        snprintf(expected,sizeof expected,"%2u\n",i+2);
        TEST_ASSERT_EQUAL_STRING(expected,level_message);
    }
    grant_experience_points(0);
    TEST_ASSERT_EQUAL_UINT8(16,player_stats[0x3d]);
}
static void test_large_experience_award_only_crosses_earned_thresholds(void)
{
    combat_set_player_experience(499,1);
    grant_experience_points(1001);
    TEST_ASSERT_EQUAL_UINT32(1500,combat_player_experience());
    TEST_ASSERT_EQUAL_UINT8(4,player_stats[0x3d]);
    TEST_ASSERT_EQUAL_INT(1,level_stat_recalculations);
}
static void test_experience_loss_clamps_to_zero_without_removing_levels(void)
{
    combat_set_player_experience(500,2);
    grant_experience_points(-501);
    TEST_ASSERT_EQUAL_UINT32(0,combat_player_experience());
    TEST_ASSERT_EQUAL_UINT8(2,player_stats[0x3d]);
}

static void test_already_dead_critter_does_not_award_experience_again(void)
{
    mobile_objects[2 * 27 + 0x15] = 0xc;
    object_at(2)[4] = 0;
    TEST_ASSERT_EQUAL_UINT(0, apply_damage_to_object(object_at(2), 4, object_at(1)));
    TEST_ASSERT_EQUAL_UINT32(0, combat_player_experience());
    TEST_ASSERT_EQUAL_INT(0, death_sounds);
}

static void test_scripted_critter_can_refuse_death(void)
{
    object_at(2)[4] = 4;
    mobile_objects[2 * 27 + 0x1a] = 0xb;
    TEST_ASSERT_EQUAL_UINT(0, apply_damage_to_object(object_at(2), 4, object_at(1)));
    TEST_ASSERT_EQUAL_UINT8(60, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_INT(1, talks);
    TEST_ASSERT_EQUAL_UINT32(0, combat_player_experience());
    TEST_ASSERT_NOT_EQUAL_UINT8(0xc, mobile_objects[2 * 27 + 0x15] & 0x3f);
}

static void test_critter_kill_does_not_award_player_experience(void)
{
    object_at(2)[4] = 4;
    TEST_ASSERT_EQUAL_UINT(1, apply_damage_to_object(object_at(2), 4, object_at(3)));
    TEST_ASSERT_EQUAL_UINT8(0, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(0xc, mobile_objects[2 * 27 + 0x15] & 0x3f);
    TEST_ASSERT_EQUAL_UINT32(0, combat_player_experience());
}

static void test_successful_critter_hit_redraws_hud_wipe(void)
{
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_UINT8(96, (byte)object_at(2)[4]);
    TEST_ASSERT_BITS_HIGH(0x80, DAT_0023c1d8);
    TEST_ASSERT_EQUAL_UINT8(3, DAT_0023c11f);
    clock_units = 0x40;
    hud_panel_redraw_dispatch();
    TEST_ASSERT_EQUAL_INT(1, wipe_frames);
    TEST_ASSERT_EQUAL_HEX16(0x20ad, frames[0]);
    TEST_ASSERT_EQUAL_INT(1, hud_flushes);
}

static void test_combat_hud_wipe_finishes_and_clears_dirty_bit(void)
{
    set_hud_status_value(7, 3);
    for (unsigned tick = 1; tick <= 22; tick++) {
        clock_units = tick * 0x40;
        hud_panel_redraw_dispatch();
    }
    TEST_ASSERT_EQUAL_INT(7, wipe_frames);
    const uint expected[] = {0x20ad, 0x20ae, 0x20af, 0x20ae, 0x20ad, 6, 0x20a6};
    for (unsigned i = 0; i < 7; i++) TEST_ASSERT_EQUAL_HEX16(expected[i], frames[i]);
    TEST_ASSERT_BITS_LOW(0x80, DAT_0023c1d8);
    TEST_ASSERT_EQUAL_UINT8(0, DAT_0023c12f);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_0023c220);
}

static void test_looking_up_raises_the_wall_spark(void)
{
    /* SDL look-up uses negative pitch; a level strike lands at z=48. */
    TEST_ASSERT_EQUAL_UINT16(56, wall_spark_height(-0x1000));
}

static void test_looking_down_lowers_the_wall_spark(void)
{
    TEST_ASSERT_EQUAL_UINT16(40, wall_spark_height(0x1000));
}

static void test_level_look_keeps_the_wall_spark_at_strike_height(void)
{
    TEST_ASSERT_EQUAL_UINT16(48, wall_spark_height(0));
}

static void test_vertical_aim_rounds_small_pitch_toward_zero(void)
{
    const short pitches[] = {-511, -512, 511, 512};
    const ushort heights[] = {48, 49, 48, 47};
    for (unsigned i = 0; i < 4; i++) {
        wall_collision = 0;
        TEST_ASSERT_EQUAL_UINT16(heights[i], wall_spark_height(pitches[i]));
    }
}

static void test_blood_producing_monster_uses_loaded_data(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x40;
    object_at(2)[4] = 5;
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0, effect_types[0]);
    TEST_ASSERT_LESS_THAN_UINT8(5, (byte)object_at(2)[4]);
}

static void test_bloodless_monster_still_uses_a_spark(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x4a;
    object_at(2)[4] = 20;
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0xb, effect_types[0]);
}

static void test_blood_height_offsets_cover_each_hit_zone(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x46; /* All four armor slots in this record are valid. */
    DAT_00100620 = 2;
    DAT_00100628 = 12;
    DAT_001005dc = 40;
    const int expected[] = {5, 3, 1, 7}; /* Original UU.exe table at 0x84f18. */
    for (int zone = 0; zone < 4; zone++) {
        object_at(2)[4] = 21;
        DAT_00100624 = zone;
        effects = 0;
        apply_melee_damage(4);
        TEST_ASSERT_EQUAL_INT(1, effects);
        TEST_ASSERT_EQUAL_INT(0, effect_types[0]);
        TEST_ASSERT_EQUAL_INT(expected[zone], effect_heights[0]);
    }
}

static void test_special_blood_hit_spawns_the_second_splat(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x46;
    object_at(2)[4] = 21;
    DAT_00100620 = 2;
    DAT_00100624 = 2;
    DAT_00100628 = 12;
    DAT_001005d8 = 1;
    apply_melee_damage(4);
    TEST_ASSERT_EQUAL_INT(2, effects);
    TEST_ASSERT_EQUAL_INT(0, effect_types[0]);
    TEST_ASSERT_EQUAL_INT(0, effect_types[1]);
    TEST_ASSERT_EQUAL_INT(1, effect_heights[0]);
    TEST_ASSERT_EQUAL_INT(4, effect_heights[1]);
}

static void test_blood_hit_outside_zones_uses_runtime_height(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x46;
    object_at(2)[4] = 21;
    DAT_00100620 = 2;
    DAT_00100624 = 4;
    DAT_00100628 = 12;
    DAT_001005dc = 40;
    apply_melee_damage(4);
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0, effect_types[0]);
    TEST_ASSERT_EQUAL_INT(-40, effect_heights[0]);
}

static void test_magic_arrow_impact_on_closed_door_preserves_target_pointer(void)
{
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
    uw_test_read_data("DATA/OBJECTS.DAT", ((byte *)g_ranged_type_props), 0x30,
                      2+0x80, SEEK_SET);
    ushort *arrow=object_at(3);
    arrow[0]=0x17;
    arrow[1]=40; /* launch height */
    ((byte *)arrow)[0x12]=1; /* launched by player */
    wall_effect[0]=0x140; /* closed door, static slot 0x100 */
    wall_effect[1]=0;
    wall_effect[2]=63;
    wall_effect[3]=0;
    expected_effect_target=wall_effect;
    TEST_ASSERT_TRUE((uintptr_t)wall_effect > UINT32_MAX);
    apply_trap_type_damage_effect((byte *)arrow, wall_effect);
    TEST_ASSERT_EQUAL_UINT16(0x100, DAT_00100620);
    TEST_ASSERT_EQUAL_UINT16(1, DAT_00100610);
    TEST_ASSERT_EQUAL_INT(1, positional_impacts);
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0xb, effect_types[0]); /* impact spark */
    TEST_ASSERT_EQUAL_HEX16(0x140, wall_effect[0]);
    TEST_ASSERT_LESS_THAN_UINT16(63, wall_effect[2] & 0x3f);
    TEST_ASSERT_GREATER_THAN_UINT16(0, wall_effect[2] & 0x3f);
}
static void test_magic_arrow_breaks_door_and_cleans_up_linked_object(void)
{
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
    uw_test_read_data("DATA/OBJECTS.DAT", ((byte *)g_ranged_type_props), 0x30,
                      2+0x80, SEEK_SET);
    ushort *arrow=object_at(3);
    arrow[0]=0x17;
    arrow[1]=40;
    ((byte *)arrow)[0x12]=1;
    wall_effect[0]=0x140;
    wall_effect[2]=1; /* one point of remaining durability */
    wall_effect[3]=4 << 6; /* linked lock object */
    object_at(4)[0]=0x10f;
    expected_effect_target=wall_effect;
    DAT_002046e0=DAT_002046e4=10;
    apply_trap_type_damage_effect((byte *)arrow, wall_effect);
    TEST_ASSERT_EQUAL_INT(2, door_triggers);
    TEST_ASSERT_EQUAL_INT(1, door_scheduled);
    TEST_ASSERT_EQUAL_HEX16(0x1cf, wall_effect[0] & 0x1ff);
    TEST_ASSERT_EQUAL_UINT16(0, wall_effect[2] & 0x3f);
    TEST_ASSERT_EQUAL_UINT16(0, wall_effect[3] & 0xffc0);
    TEST_ASSERT_EQUAL_INT(1, discarded_links);
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0xb, effect_types[0]);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_player_melee_swing_selects_critter);
    RUN_TEST(test_player_melee_swing_without_candidates_misses);
    RUN_TEST(test_player_melee_swing_does_not_hit_attacker);
    RUN_TEST(test_player_melee_swing_selects_nearest_critter);
    RUN_TEST(test_attack_facing_covers_all_heading_pairs);
    RUN_TEST(test_full_player_swing_applies_damage_to_critter);
    RUN_TEST(test_failed_skill_check_keeps_full_object_pointers);
    RUN_TEST(test_full_swing_without_target_skips_damage);
    RUN_TEST(test_critter_swing_at_same_faction_skips_damage);
    RUN_TEST(test_critter_swing_at_opposing_faction_preserves_pointers);
    RUN_TEST(test_lethal_player_swing_marks_critter_dead_and_awards_experience);
    RUN_TEST(test_killing_a_real_rat_grants_xp_once_without_leveling_new_character);
    RUN_TEST(test_each_original_experience_threshold_advances_exactly_one_level);
    RUN_TEST(test_large_experience_award_only_crosses_earned_thresholds);
    RUN_TEST(test_experience_loss_clamps_to_zero_without_removing_levels);
    RUN_TEST(test_already_dead_critter_does_not_award_experience_again);
    RUN_TEST(test_scripted_critter_can_refuse_death);
    RUN_TEST(test_critter_kill_does_not_award_player_experience);
    RUN_TEST(test_successful_critter_hit_redraws_hud_wipe);
    RUN_TEST(test_combat_hud_wipe_finishes_and_clears_dirty_bit);
    RUN_TEST(test_looking_up_raises_the_wall_spark);
    RUN_TEST(test_looking_down_lowers_the_wall_spark);
    RUN_TEST(test_level_look_keeps_the_wall_spark_at_strike_height);
    RUN_TEST(test_vertical_aim_rounds_small_pitch_toward_zero);
    RUN_TEST(test_blood_producing_monster_uses_loaded_data);
    RUN_TEST(test_bloodless_monster_still_uses_a_spark);
    RUN_TEST(test_blood_height_offsets_cover_each_hit_zone);
    RUN_TEST(test_special_blood_hit_spawns_the_second_splat);
    RUN_TEST(test_blood_hit_outside_zones_uses_runtime_height);
    RUN_TEST(test_magic_arrow_impact_on_closed_door_preserves_target_pointer);
    RUN_TEST(test_magic_arrow_breaks_door_and_cleans_up_linked_object);
    return UNITY_END();
}
