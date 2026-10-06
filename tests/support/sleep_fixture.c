#include "sleep_fixture.h"

SleepFixture sleep_fixture;
short DAT_002046b0;
char *DAT_0020469c, *DAT_002046a8, *DAT_0023b82c;
undefined1 DAT_00204880_backing[128];
unsigned char DAT_00085ac8_backing[16];
undefined1 DAT_002029d8_backing[256];
undefined1 DAT_00202c90_backing[8192];
char *DAT_00248410, *DAT_0024cff4;
ushort *DAT_0024cff0;
undefined4 g_weapon_overlay_enabled, DAT_00202c84;
undefined4 DAT_0024cff8;
char *DAT_0024cfd4;
char s_Look__it_s_a_text_trap_00087918[] = "Look, it's a text trap\n";

long ce_rand(void) { return 0; }
undefined4 rand_below(int max) { return sleep_fixture.random_low ? 0 : max - 1; }
void full_dungeon_redraw(void) { sleep_fixture.redraws++; }
void set_pending_music_track(int track) { TEST_ASSERT_EQUAL_INT(0xd, track); }
void update_ingame_music_track(void) {}
void pick_random_pending_music_track(void) { sleep_fixture.music_restores++; }
void weapon_overlay_and_full_redraw(void) { sleep_fixture.overlay_redraws++; }
void decrement_cursor_hide_depth(void) { sleep_fixture.cursor_hides++; }
undefined4 cursor_show_idle_tick(void)
{
    sleep_fixture.cursor_shows++;
    if (sleep_fixture.cursor_shows & 1) sleep_fixture.sleeps++;
    else sleep_fixture.wakes++;
    return 0;
}
void debug_noop_frame_hook(int step) {}
void show_error_dialog_stub_thunk(void) {}
void debug_print(char *format, ...) {}
void *ce_malloc(unsigned int count)
{
    TEST_ASSERT_EQUAL_UINT(sizeof sleep_fixture.screen, count);
    TEST_ASSERT_LESS_THAN_INT(16, sleep_fixture.snapshot_count);
    void *snapshot = calloc(1, count);
    TEST_ASSERT_NOT_NULL(snapshot);
    sleep_fixture.snapshots[sleep_fixture.snapshot_count++] = snapshot;
    return snapshot;
}
void *ce_memmove(void *destination, void *source, unsigned int count)
{
    TEST_ASSERT_EQUAL_UINT(sizeof sleep_fixture.screen, count);
    TEST_ASSERT_GREATER_THAN_INT(0, sleep_fixture.snapshot_count);
    void *snapshot = sleep_fixture.snapshots[sleep_fixture.snapshot_count - 1];
    if (source == DAT_00248410) TEST_ASSERT_EQUAL_PTR(snapshot, destination);
    else {
        TEST_ASSERT_EQUAL_PTR(DAT_00248410, destination);
        TEST_ASSERT_EQUAL_PTR(snapshot, source);
    }
    sleep_fixture.overlay_copies++;
    return memmove(destination, source, count);
}
void tick_ambient_doors_and_scheduler(int mode)
{ TEST_ASSERT_EQUAL_INT(0, mode); sleep_fixture.ambient_ticks++; }
undefined4 check_rest_interrupted_by_monster(void)
{ sleep_fixture.interruption_checks++; return sleep_fixture.interrupted; }
void advance_mobile_objects(void) { sleep_fixture.mobile_ticks++; }
void flush_pending_critter_resource_slots(void) { sleep_fixture.resources_flushed++; }
void refresh_stats_panel_if_active(void) { sleep_fixture.stat_redraws++; }
uint read_realtime_clock_units(void)
{
    TEST_ASSERT_LESS_THAN_UINT(0x10000, sleep_fixture.clock);
    sleep_fixture.clock += 0x80;
    return sleep_fixture.clock;
}
void *get_equipped_item_at_slot(int slot)
{ return slot == 5 && sleep_fixture.torch[0] ? sleep_fixture.torch : NULL; }
void redraw_backpack_slot_widget(int slot)
{ TEST_ASSERT_EQUAL_INT(5, slot); sleep_fixture.light_slot_redraws++; }
void set_ambient_bias_without_light(int strength) { sleep_fixture.light_updates++; }
void active_mobile_list_remove(int slot) {}
void enter_free_camera_mode(int slot) { TEST_FAIL_MESSAGE("Unexpected free camera"); }
void scheduler_remove_entry(int slot) { TEST_FAIL_MESSAGE("Unexpected scheduled-object removal"); }
undefined4 apply_typed_damage_to_object(void) { TEST_FAIL_MESSAGE("Unexpected damage during healthy sleep"); return 0; }
void apply_rest_status_effects(void) { TEST_FAIL_MESSAGE("Unexpected forced rest"); }
void free_trap_class_object(void) { TEST_FAIL_MESSAGE("Unexpected trap deletion"); }
undefined4 resolve_object_variant_or_special_link(void)
{ TEST_FAIL_MESSAGE("Unexpected fountain effect"); return 0; }
undefined4 dispatch_trap_special_or_tile_action(void)
{ TEST_FAIL_MESSAGE("Unexpected fountain dispatch"); return 0; }

void *alloc_object_slot(int mobile)
{
    TEST_ASSERT_EQUAL_INT(1, mobile);
    sleep_fixture.spawn_attempts++;
    return NULL; /* Controlled exhausted pool: spawning stops after the safety scan. */
}
#define UNUSED_VOID(name) void name(void) { TEST_FAIL_MESSAGE("Unexpected " #name); }
#define UNUSED_RESULT(name) undefined4 name(void) { TEST_FAIL_MESSAGE("Unexpected " #name); return 0; }
UNUSED_VOID(spawn_trap_hazard_object)
UNUSED_RESULT(apply_poison_or_damage_trap_effect)
UNUSED_RESULT(teleport_object_to_level_tile)
UNUSED_RESULT(dispatch_quest_event_code)
UNUSED_RESULT(apply_area_terrain_effect)
UNUSED_RESULT(place_object_in_world)
UNUSED_RESULT(scheduler_add_entry)
UNUSED_VOID(open_door_object)
UNUSED_VOID(close_door_object)
UNUSED_VOID(toggle_door_object)
UNUSED_VOID(print_message_with_proximity_qualifier)
UNUSED_RESULT(resolve_skill_gated_unlock_or_use)
UNUSED_VOID(set_pending_update_flags)
char *get_message_string(void) { TEST_FAIL_MESSAGE("Unexpected text trap"); return NULL; }
int message_scroll_print_wrapped(void) { TEST_FAIL_MESSAGE("Unexpected text trap message"); return 0; }
#undef UNUSED_VOID
#undef UNUSED_RESULT

uint sleep_game_time(void)
{
    uint value;
    memcpy(&value, DAT_00086df8 + 0xce, sizeof value);
    return value;
}
ushort *sleep_bedroll(void)
{
    /* The player uses the level's actual bedroll at the reported rest
       location; the item need not have spawned on that same tile. */
    ushort *bedroll = special_use_object(640);
    TEST_ASSERT_EQUAL_HEX16(0x121, bedroll[0] & 0x1ff);
    return bedroll;
}
void sleep_fixture_reset(void)
{
    special_use_fixture_reset();
    memset(&sleep_fixture, 0, sizeof sleep_fixture);
    DAT_00248410 = (char *)sleep_fixture.screen;
    g_weapon_overlay_enabled = 1;
    DAT_0024cff8 = 0; DAT_0024cfd4 = NULL;
    DAT_0024cff0 = NULL; DAT_0024cff4 = NULL;
    /* Preserve the actual level's linked object lists, including objects far
       from the bedroll that the sleep cleanup will visit. */
    uw_test_load_map(special_use_fixture.map, sizeof special_use_fixture.map, 1);
    uw_test_load_object_properties(DAT_00202c90_backing, sizeof DAT_00202c90_backing);
    uw_test_create_character(special_use_fixture.character, special_use_fixture.attributes,
                             special_use_object(1));
    g_player_object[11] = (18 << 10) | (5 << 4);
    DAT_002020a0 = DAT_0023c3dc = 18;
    DAT_002020a4 = DAT_0023c3d8 = 5;
    object_list_insert_head((char *)tilemap_lookup(18, 5) + 2, g_player_object);
    ((byte *)g_player_object)[8] = 10;
    DAT_00086df8[0x39] = 100;
    DAT_00086df8[0x3a] = 8;
    DAT_00086df8[0x37] = 5;
    DAT_00086df8[0x38] = 20;
    DAT_00086df8[0xb8] = 0;
    /* Deterministic no-dream event mask: the first two events and the
       random event selected by our zero RNG are already recorded. */
    DAT_00086df8[0x6e] = (char)0xf3;
    DAT_00086df8[0x6f] = (char)0xff;
    g_jump_ascent_timer = g_fall_accel = g_vertical_velocity = 0;
    DAT_0020469c = (char *)sleep_fixture.static_free;
    DAT_002046a8 = (char *)sleep_fixture.mobile_free;
    DAT_0023b82c = NULL;
    memset(DAT_00085ac8_backing, 0, sizeof DAT_00085ac8_backing);
    for (unsigned i = 0; i < 4; i++) DAT_00085ac8_backing[i] = 5 + i;
    uw_test_read_data("DATA/OBJECTS.DAT", DAT_002029d8_backing, 32, 3426, SEEK_SET);
    special_use_fixture.messages = special_use_fixture.health_refreshes = 0;
}

void sleep_fixture_dispose(void)
{
    /* The ARM transition retains its allocated snapshot. The fixture owns
       those allocations and frees them after each test. */
    for (int i = 0; i < sleep_fixture.snapshot_count; i++) free(sleep_fixture.snapshots[i]);
    special_use_fixture_dispose();
}

ushort *sleep_fixture_spawn_trap(int blocked)
{
    special_use_empty_area(18, 4);
    ushort *spawn = special_use_object(720);
    ushort *npc = special_use_object(2);
    memset(spawn, 0, 8);
    memset(npc, 0, 27);
    spawn[0] = 0x187;
    spawn[3] = 2 << 6;
    npc[0] = 0x40;
    npc[11] = (18 << 10) | (4 << 4);
    /* Background processing marks the template before testing the area.
       A second marked NPC blocks the spawn, without making rest unsafe. */
    object_list_insert_head((char *)tilemap_lookup(18, 4) + 2, spawn);
    if (blocked) {
        ushort *other = special_use_npc(3, 19, 4, 1, 0);
        ((byte *)other)[14] |= 1;
    }
    return npc;
}

void sleep_fixture_cleanup_chain(void)
{
    special_use_empty_area(18, 5);
    /* Small, non-container objects qualify for the original cleanup roll.
       Keep the real property table apart from this controlled size class. */
    DAT_00202c90_backing[0x10 * 13 + 10] &= (byte)~0x3c;
    ushort *far = (ushort *)tilemap_lookup(35, 20);
    far[1] = (700 << 6) | 0x2b;
    for (unsigned slot = 700; slot <= 703; slot++) {
        ushort *object = special_use_object(slot);
        memset(object, 0, 8);
        object[0] = 0x8010;
        object[2] = ((slot < 702 ? slot + 1 : 0) << 6) | 0x25;
    }
    *(ushort *)((char *)tilemap_lookup(19, 5) + 2) = 703 << 6;
    sleep_fixture.random_low = 1;
}
