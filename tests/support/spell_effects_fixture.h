#ifndef UW_TEST_SPELL_EFFECTS_FIXTURE_H
#define UW_TEST_SPELL_EFFECTS_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"
typedef struct {
    char character[256], attributes[256];
    ushort player[16], target[16], effect[16];
    byte tile[4], los_tile[4];
    int los_x, los_y;
    int scans, damage_calls, damage, damage_type, dice_count, dice_sides;
    int spawns, links, unlocks, goal, goal_changes, goal_mode, variant, effects, resist;
    uintptr_t dispatched_actor;
    intptr_t dispatched_context;
    int dispatched_type, dispatched_parameter;
} SpellEffectsFixture;
extern SpellEffectsFixture spell_effects_fixture;
void spell_effects_fixture_reset(void);
extern char DAT_00101740_backing[448];
extern undefined1 DAT_0010142c;
#define DAT_00101740 DAT_00101740_backing[0]
#define DAT_00101741 DAT_00101740_backing[1]
#define DAT_00101747 DAT_00101740_backing[7]
#define DAT_00101748 DAT_00101740_backing[8]
#define DAT_0010174a DAT_00101740_backing[10]
#define DAT_0008762c DAT_0008762c_backing[0]
#define DAT_00087630 DAT_0008762c_backing[4]
#define DAT_00087634 DAT_0008762c_backing[8]
#define DAT_000853b0 DAT_000853b0_backing[0]
#define DAT_000853b1 DAT_000853b0_backing[1]
extern undefined4 DAT_00101440;
extern byte DAT_00101450, DAT_00101730;
extern uw_monster_type_props_t *DAT_00101404;
#define DAT_000853cc DAT_000853cc_backing[0]
#define DAT_000853c4 DAT_000853c0_backing[4]
#endif
