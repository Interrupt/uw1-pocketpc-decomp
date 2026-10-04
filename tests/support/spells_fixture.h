#ifndef UW_TEST_SPELLS_FIXTURE_H
#define UW_TEST_SPELLS_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"
typedef struct {
    char character[256], attributes[256];
    ushort player[16], projectile[16];
    byte map[0x7c08];
    short input[16];
    int skill_result, skill_checks, equipment_refreshes, dice_calls;
    int sound, messages, message_id, click_releases, tile_checks;
    int cursor_pushes, cursor_pops, allocations, links, projectile_sounds, frees;
    int allocation_fails, placement_allowed;
    short mouse_x, mouse_y;
} SpellsFixture;
extern SpellsFixture spells_fixture;
void spells_fixture_reset(void);
void spells_fixture_ready_in_lor(int mana);
void spells_fixture_ready_ort_jux(int mana);
void spells_fixture_fire(void);
#endif
