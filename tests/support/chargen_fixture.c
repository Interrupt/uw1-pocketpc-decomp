#include "game_fixture.h"
#include "chargen_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
long ce_rand(void);
void configure_texture_detail_functions(void);
void refresh_player_equipment_effects(void);
undefined4 recompute_level7_hazard_from_character_level(int level);

char record[256], attributes[16];

ushort player_object[16];

char *DAT_00086df8 = record;

char *DAT_0023be74 = attributes;

ushort *g_player_object = player_object;

short DAT_00201b68;

undefined1 DAT_000fb860_backing[256];

undefined1 DAT_000fb8f0_backing[1680];

int random_values[64], random_count, random_index;

int dice_calls, hazard_calls, equipment_calls, reset_calls;

int trained[6], trained_count;

long ce_rand(void)
{
    TEST_ASSERT_LESS_THAN_INT(random_count, random_index);
    return random_values[random_index++];
}

int roll_dice_sum(count, sides)
int count;
short sides;
{
    /* Deterministic roll totals distinguish skills from attributes. */
    if (dice_calls < 20) {
        TEST_ASSERT_EQUAL_INT(3, count);
        TEST_ASSERT_EQUAL_INT(4, sides);
        dice_calls++;
        return 6;
    }
    TEST_ASSERT_EQUAL_INT(2, count);
    TEST_ASSERT_EQUAL_INT(10, sides);
    dice_calls++;
    return 11;
}

void configure_texture_detail_functions(void) { reset_calls++; }

void refresh_player_equipment_effects(void) { equipment_calls++; }

undefined4 recompute_level7_hazard_from_character_level(int level)
{
    TEST_ASSERT_EQUAL_INT(1, level);
    hazard_calls++;
    return 0;
}

void advance_skill_training(skill)
short skill;
{
    TEST_ASSERT_LESS_THAN_INT(6, trained_count);
    trained[trained_count++] = skill;
}

void chargen_fixture_reset(void)
{
    memset(record, 0xa5, sizeof(record));
    memset(attributes, 0, sizeof(attributes));
    memset(player_object, 0, sizeof(player_object));
    /* Match character_generator_start's SKILLS.DAT load without its UI. */
    memset(DAT_000fb8f0_backing, 0, sizeof DAT_000fb8f0_backing);
    FILE *skills = uw_test_open_data("DATA/SKILLS.DAT");
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(0x28,
        fread(DAT_000fb8f0_backing, 1, 0x348, skills));
    TEST_ASSERT_EQUAL_INT(0, fclose(skills));
    memcpy(DAT_000fb860_backing, DAT_000fb8f0_backing, 0x20);
    memset(random_values, 0, sizeof(random_values));
    random_count = random_index = dice_calls = hazard_calls = 0;
    equipment_calls = reset_calls = trained_count = 0;
    DAT_00201b68 = 0;
    attributes[4] = 40;
}

void chargen_fixture_dispose(void)
{
    TEST_ASSERT_EQUAL_INT(random_count, random_index);
}

void prepare_initial_randomness(void)
{
    random_values[0] = 4; /* portrait */
    random_values[1] = 1; /* sex */
    random_values[2] = 5; /* initial object stat adjustment */
    random_count = 3;
}
