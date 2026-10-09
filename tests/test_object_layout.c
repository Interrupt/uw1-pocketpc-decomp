#include "src/headers/uw.h"
#include "unity.h"

void setUp(void) {}
void tearDown(void) {}

static void test_uw1_record_sizes(void)
{
    TEST_ASSERT_EQUAL_UINT(8, sizeof(uw_object_hdr_t));
    TEST_ASSERT_EQUAL_UINT(0, offsetof(uw_object_hdr_t, type_flags));
    TEST_ASSERT_EQUAL_UINT(2, offsetof(uw_object_hdr_t, position_word));
    TEST_ASSERT_EQUAL_UINT(4, offsetof(uw_object_hdr_t, chain_word));
    TEST_ASSERT_EQUAL_UINT(6, offsetof(uw_object_hdr_t, link_word));
    TEST_ASSERT_EQUAL_UINT(27, sizeof(uw_mobile_object_t));
    TEST_ASSERT_EQUAL_UINT(11, offsetof(uw_mobile_object_t, goal_word));
    TEST_ASSERT_EQUAL_UINT(13, offsetof(uw_mobile_object_t, status_word));
    TEST_ASSERT_EQUAL_UINT(15, offsetof(uw_mobile_object_t, target_word));
    TEST_ASSERT_EQUAL_UINT(22, offsetof(uw_mobile_object_t, tile_word));
    TEST_ASSERT_EQUAL_UINT(27, sizeof(uw_projectile_object_t));
    TEST_ASSERT_EQUAL_UINT(20, offsetof(uw_projectile_object_t, pitch_flags));
    TEST_ASSERT_EQUAL_UINT(26, offsetof(uw_mobile_object_t, npc_whoami));
    TEST_ASSERT_EQUAL_UINT(13, sizeof(uw_object_type_props_t));
    TEST_ASSERT_EQUAL_UINT(48, sizeof(uw_monster_type_props_t));
}

/* Independent disk-byte checks for every named view. This also verifies
 * that a partial write preserves the other byte and adjacent storage. */
#define VERIFY_WORD(TYPE, FIELD, OFFSET) do { \
    TYPE object; \
    byte *raw = (byte *)&object; \
    TEST_ASSERT_EQUAL_UINT(OFFSET, offsetof(TYPE, FIELD##_low)); \
    TEST_ASSERT_EQUAL_UINT((OFFSET) + 1, offsetof(TYPE, FIELD##_high)); \
    for (unsigned value = 0; value < 65536; ++value) { \
        memset(&object, 0x5a, sizeof object); \
        raw[OFFSET] = value & 255; \
        raw[(OFFSET) + 1] = value >> 8; \
        TEST_ASSERT_EQUAL_UINT16(value, object.FIELD); \
        TEST_ASSERT_EQUAL_INT((short)value, object.FIELD##_signed); \
        TEST_ASSERT_EQUAL_UINT8(value & 255, object.FIELD##_low); \
        TEST_ASSERT_EQUAL_UINT8(value >> 8, object.FIELD##_high); \
        object.FIELD##_low = 0xa5; \
        TEST_ASSERT_EQUAL_UINT8(0xa5, raw[OFFSET]); \
        TEST_ASSERT_EQUAL_UINT8(value >> 8, raw[(OFFSET) + 1]); \
        object.FIELD##_high = 0x3c; \
        TEST_ASSERT_EQUAL_UINT8(0xa5, raw[OFFSET]); \
        TEST_ASSERT_EQUAL_UINT8(0x3c, raw[(OFFSET) + 1]); \
        for (unsigned i = 0; i < sizeof object; ++i) \
            if (i != (OFFSET) && i != (OFFSET) + 1) \
                TEST_ASSERT_EQUAL_UINT8(0x5a, raw[i]); \
    } \
} while (0)

static void test_uw1_word_byte_views(void)
{
    VERIFY_WORD(uw_object_hdr_t, type_flags, 0);
    VERIFY_WORD(uw_object_hdr_t, position_word, 2);
    VERIFY_WORD(uw_object_hdr_t, chain_word, 4);
    VERIFY_WORD(uw_object_hdr_t, link_word, 6);
    VERIFY_WORD(uw_mobile_object_t, goal_word, 11);
    VERIFY_WORD(uw_mobile_object_t, status_word, 13);
    VERIFY_WORD(uw_mobile_object_t, target_word, 15);
    VERIFY_WORD(uw_mobile_object_t, tile_word, 22);
    VERIFY_WORD(uw_object_type_props_t, size_weight, 1);
}
#undef VERIFY_WORD

static void test_uw1_container_light_animation_layout(void)
{
    TEST_ASSERT_EQUAL_UINT(3, sizeof(uw_container_type_props_t));
    TEST_ASSERT_EQUAL_UINT(0, offsetof(uw_container_type_props_t, capacity));
    TEST_ASSERT_EQUAL_UINT(1, offsetof(uw_container_type_props_t, acceptance_mask));
    TEST_ASSERT_EQUAL_UINT(2, sizeof(uw_light_type_props_t));
    TEST_ASSERT_EQUAL_UINT(0, offsetof(uw_light_type_props_t, decay_interval));
    TEST_ASSERT_EQUAL_UINT(1, offsetof(uw_light_type_props_t, brightness));
    TEST_ASSERT_EQUAL_UINT(4, sizeof(uw_animation_type_props_t));
    TEST_ASSERT_EQUAL_UINT(0, offsetof(uw_animation_type_props_t, flags));
    TEST_ASSERT_EQUAL_UINT(2, offsetof(uw_animation_type_props_t, start_frame));
    TEST_ASSERT_EQUAL_UINT(3, offsetof(uw_animation_type_props_t, frame_count));
    for (unsigned value = 0; value < 65536; ++value) {
        byte raw[3] = {0x5a, value & 255, value >> 8};
        uw_container_type_props_t container;
        memcpy(&container, raw, sizeof raw);
        TEST_ASSERT_EQUAL_UINT16(value, container.acceptance_mask);
        TEST_ASSERT_EQUAL_INT((short)value, (short)container.acceptance_mask);
        TEST_ASSERT_EQUAL_UINT8(0x5a, container.capacity);
    }
}

static void test_uw1_melee_and_armor_layout(void)
{
    TEST_ASSERT_EQUAL_UINT(8, sizeof(uw_melee_type_props_t));
#define CHECK_MELEE(FIELD, OFFSET) \
    TEST_ASSERT_EQUAL_UINT(OFFSET, offsetof(uw_melee_type_props_t, FIELD))
    CHECK_MELEE(slash_damage, 0);
    CHECK_MELEE(bash_damage, 1);
    CHECK_MELEE(stab_damage, 2);
    CHECK_MELEE(minimum_charge, 3);
    CHECK_MELEE(charge_speed, 4);
    CHECK_MELEE(maximum_charge, 5);
    CHECK_MELEE(skill, 6);
    CHECK_MELEE(durability, 7);
#undef CHECK_MELEE
    TEST_ASSERT_EQUAL_UINT(4, sizeof(uw_armor_type_props_t));
    TEST_ASSERT_EQUAL_UINT(0, offsetof(uw_armor_type_props_t, protection));
    TEST_ASSERT_EQUAL_UINT(1, offsetof(uw_armor_type_props_t, durability));
    TEST_ASSERT_EQUAL_UINT(2, offsetof(uw_armor_type_props_t, _unknown02));
    TEST_ASSERT_EQUAL_UINT(3, offsetof(uw_armor_type_props_t, equipment_slot));
}

static void test_uw1_ranged_property_layout(void)
{
    TEST_ASSERT_EQUAL_UINT(3, sizeof(uw_ranged_type_props_t));
    TEST_ASSERT_EQUAL_UINT(0, offsetof(uw_ranged_type_props_t, damage));
    TEST_ASSERT_EQUAL_UINT(1, offsetof(uw_ranged_type_props_t, projectile_speed));
    TEST_ASSERT_EQUAL_UINT(2, offsetof(uw_ranged_type_props_t, ammo_damage_selector));
    /* Independently populate each disk byte, including signed selectors. */
    for (unsigned value = 0; value < 256; ++value) {
        byte raw[3] = {value, value ^ 0x55, value ^ 0xaa};
        uw_ranged_type_props_t row;
        memcpy(&row, raw, sizeof raw);
        TEST_ASSERT_EQUAL_UINT8(raw[0], row.damage);
        TEST_ASSERT_EQUAL_UINT8(raw[1], row.projectile_speed);
        TEST_ASSERT_EQUAL_UINT8(raw[2], row.ammo_damage_selector);
        TEST_ASSERT_EQUAL_INT((char)raw[2], (char)row.ammo_damage_selector);
    }
}

static void test_uw1_monster_property_offsets(void)
{
#define CHECK_OFFSET(FIELD, OFFSET) \
    TEST_ASSERT_EQUAL_UINT(OFFSET, offsetof(uw_monster_type_props_t, FIELD))
    CHECK_OFFSET(armor, 0);
    CHECK_OFFSET(max_hp, 4);
    CHECK_OFFSET(strength, 5);
    CHECK_OFFSET(dexterity, 6);
    CHECK_OFFSET(intelligence, 7);
    CHECK_OFFSET(effects_flags, 8);
    CHECK_OFFSET(race_flags, 9);
    CHECK_OFFSET(movement_flags, 10);
    CHECK_OFFSET(magic_power, 11);
    CHECK_OFFSET(movement_speed, 12);
    CHECK_OFFSET(trade_level, 13);
    CHECK_OFFSET(trade_patience, 14);
    CHECK_OFFSET(poison_damage, 15);
    CHECK_OFFSET(category, 16);
    CHECK_OFFSET(equipment_damage, 17);
    CHECK_OFFSET(defense, 18);
    CHECK_OFFSET(attacks[0].skill, 19);
    CHECK_OFFSET(attacks[0].damage, 20);
    CHECK_OFFSET(attacks[0].probability, 21);
    CHECK_OFFSET(attacks[1].skill, 22);
    CHECK_OFFSET(attacks[2].probability, 27);
    CHECK_OFFSET(morale_flags, 28);
    CHECK_OFFSET(detection_ranges, 29);
    CHECK_OFFSET(awareness_ranges, 30);
    CHECK_OFFSET(missile_wander_flags, 31);
    CHECK_OFFSET(weapon_loot, 32);
    CHECK_OFFSET(item_loot, 34);
    CHECK_OFFSET(coin_loot, 38);
    CHECK_OFFSET(food_loot, 39);
    CHECK_OFFSET(experience, 40);
    CHECK_OFFSET(spells, 42);
    CHECK_OFFSET(spell_flags, 45);
    CHECK_OFFSET(door_skill, 46);
    CHECK_OFFSET(_unknown2f, 47);
#undef CHECK_OFFSET
}

/* Exhaustive raw-word checks test both compiler bitfield packing and field
 * writes preserving neighbours. Expected masks are the UW1 LEV.ARK format,
 * independently expressed here rather than extracted from the game struct. */
#define VERIFY_FIELD(TYPE, FIELD, OFFSET, SHIFT, MASK) do { \
    for (unsigned value = 0; value <= 0xffff; ++value) { \
        TYPE record; \
        memset(&record, 0xa5, sizeof record); \
        byte *bytes = (byte *)&record; \
        bytes[OFFSET] = value; bytes[(OFFSET)+1] = value >> 8; \
        TEST_ASSERT_EQUAL_UINT((value >> (SHIFT)) & (MASK), record.FIELD); \
        record.FIELD = ((value >> (SHIFT)) ^ (MASK)) & (MASK); \
        unsigned expected = value ^ ((MASK) << (SHIFT)); \
        TEST_ASSERT_EQUAL_UINT(expected & 255, bytes[OFFSET]); \
        TEST_ASSERT_EQUAL_UINT(expected >> 8, bytes[(OFFSET)+1]); \
        for (size_t j=0; j<sizeof record; ++j) \
            if (j!=(OFFSET) && j!=(OFFSET)+1) TEST_ASSERT_EQUAL_HEX8(0xa5,bytes[j]); \
    } \
} while (0)

static void test_uw1_header_fields(void)
{
    VERIFY_FIELD(uw_object_hdr_t,item_id,0,0,0x1ff);
    VERIFY_FIELD(uw_object_hdr_t,flags_res,0,9,7);
    VERIFY_FIELD(uw_object_hdr_t,enchanted,0,12,1);
    VERIFY_FIELD(uw_object_hdr_t,doordir,0,13,1);
    VERIFY_FIELD(uw_object_hdr_t,invisible,0,14,1);
    VERIFY_FIELD(uw_object_hdr_t,is_quant,0,15,1);
    VERIFY_FIELD(uw_object_hdr_t,zpos,2,0,0x7f);
    VERIFY_FIELD(uw_object_hdr_t,heading,2,7,7);
    VERIFY_FIELD(uw_object_hdr_t,ypos,2,10,7);
    VERIFY_FIELD(uw_object_hdr_t,xpos,2,13,7);
    VERIFY_FIELD(uw_object_hdr_t,quality,4,0,0x3f);
    VERIFY_FIELD(uw_object_hdr_t,next,4,6,0x3ff);
    VERIFY_FIELD(uw_object_hdr_t,owner,6,0,0x3f);
    VERIFY_FIELD(uw_object_hdr_t,link,6,6,0x3ff);
}

static void test_uw1_mobile_fields(void)
{
    VERIFY_FIELD(uw_mobile_object_t, tick_phase, 10, 0, 0xf);
    VERIFY_FIELD(uw_mobile_object_t,npc_path_slot,22,0,15);
    VERIFY_FIELD(uw_mobile_object_t,npc_goal,0xb,0,0xf);
    VERIFY_FIELD(uw_mobile_object_t,npc_gtarg,0xb,4,0xff);
    VERIFY_FIELD(uw_mobile_object_t,npc_level,0xd,0,0xf);
    VERIFY_FIELD(uw_mobile_object_t,npc_talkedto,0xd,13,1);
    VERIFY_FIELD(uw_mobile_object_t,npc_attitude,0xd,14,3);
    VERIFY_FIELD(uw_mobile_object_t,npc_animation_frame,0xb,12,0xf);
    VERIFY_FIELD(uw_mobile_object_t,npc_target_tile_x,0xf,0,0x3f);
    VERIFY_FIELD(uw_mobile_object_t,npc_target_tile_y,0xf,6,0x3f);
    VERIFY_FIELD(uw_mobile_object_t,npc_swing_charge,0xf,12,0xf);
    VERIFY_FIELD(uw_mobile_object_t,npc_yhome,0x16,4,0x3f);
    VERIFY_FIELD(uw_mobile_object_t,npc_xhome,0x16,10,0x3f);
    VERIFY_FIELD(uw_mobile_object_t,npc_heading,0x18,0,0x1f);
    VERIFY_FIELD(uw_mobile_object_t,npc_hunger,0x19,0,0x7f);
}

static void test_arm_uw1_common_property_fields(void)
{
    /* UW1 COMOBJ disk bytes 4..10 land at native bytes 5..11. The
     * port's loader leaves bytes 4 and 12 as alignment gaps. */
    TEST_ASSERT_EQUAL_UINT(0, offsetof(uw_object_type_props_t, height));
    TEST_ASSERT_EQUAL_UINT(1, offsetof(uw_object_type_props_t, size_weight));
    TEST_ASSERT_EQUAL_UINT(3, offsetof(uw_object_type_props_t, flags));
    TEST_ASSERT_EQUAL_UINT(5, offsetof(uw_object_type_props_t, monetary_value));
    TEST_ASSERT_EQUAL_UINT(7, offsetof(uw_object_type_props_t, quality_flags));
    TEST_ASSERT_EQUAL_UINT(8, offsetof(uw_object_type_props_t, owner_flags));
    TEST_ASSERT_EQUAL_UINT(9, offsetof(uw_object_type_props_t, scale_flags));
    TEST_ASSERT_EQUAL_UINT(10, offsetof(uw_object_type_props_t, class_flags));
    TEST_ASSERT_EQUAL_UINT(11, offsetof(uw_object_type_props_t, description_flags));
    VERIFY_FIELD(uw_object_type_props_t,collision_radius,1,0,7);
    VERIFY_FIELD(uw_object_type_props_t,animated,1,3,1);
    VERIFY_FIELD(uw_object_type_props_t,unit_weight,1,4,0xfff);
    VERIFY_FIELD(uw_object_type_props_t,can_have_owner,8,7,1);
    VERIFY_FIELD(uw_object_type_props_t,quality_type,11,0,0xf);
    VERIFY_FIELD(uw_object_type_props_t,has_look_description,11,4,1);
}

static void test_uw1_projectile_fields(void)
{
    TEST_ASSERT_EQUAL_UINT(11, offsetof(uw_projectile_object_t, precise_x));
    TEST_ASSERT_EQUAL_UINT(13, offsetof(uw_projectile_object_t, precise_y));
    TEST_ASSERT_EQUAL_UINT(15, offsetof(uw_projectile_object_t, precise_z));
    TEST_ASSERT_EQUAL_UINT(18, offsetof(uw_projectile_object_t, source_slot));
    TEST_ASSERT_EQUAL_UINT(22, offsetof(uw_projectile_object_t, tile_position));
    TEST_ASSERT_EQUAL_UINT(26, offsetof(uw_projectile_object_t, original_heading));
    VERIFY_FIELD(uw_projectile_object_t,speed,0x13,0,0x7f);
    VERIFY_FIELD(uw_projectile_object_t,gravity_flag,0x13,7,1);
    VERIFY_FIELD(uw_projectile_object_t,pitch,0x14,3,0x1f);
    VERIFY_FIELD(uw_projectile_object_t,tile_y,0x16,4,0x3f);
    VERIFY_FIELD(uw_projectile_object_t,tile_x,0x16,10,0x3f);
    VERIFY_FIELD(uw_projectile_object_t,fine_heading,0x18,0,0x1f);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_uw1_record_sizes);
    RUN_TEST(test_uw1_word_byte_views);
    RUN_TEST(test_uw1_monster_property_offsets);
    RUN_TEST(test_uw1_ranged_property_layout);
    RUN_TEST(test_uw1_melee_and_armor_layout);
    RUN_TEST(test_uw1_container_light_animation_layout);
    RUN_TEST(test_uw1_header_fields);
    RUN_TEST(test_uw1_mobile_fields);
    RUN_TEST(test_arm_uw1_common_property_fields);
    RUN_TEST(test_uw1_projectile_fields);
    return UNITY_END();
}
