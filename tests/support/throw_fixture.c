#include "game_fixture.h"
#include "unity.h"
#include "src/headers/uw.h"
#include <stdio.h>
#include <stdlib.h>
#include "throw_test_globals.h"

/* Real throw, snapshot, physics sweep, tile relinking and landing.
   A flat floor and one optional wall are supplied at the map boundary. */
ushort arena[0x4000], held[4];
char character[256], game_mode[32];
int cursor_y, mobile_allocations, static_allocations, freed;
bool wall, bridge_fixture;
byte bridge_heights[3];
int bridge_count;
ushort *thrown;
short fine(ushort *object, int offset)
{ short value; memcpy(&value, (byte *)object + offset, 2); return value; }
void *alloc_object_slot(int mobile)
{
    if (mobile) { mobile_allocations++; return (char *)arena + 0x4000 + 2 * 27; }
    static_allocations++;
    return (char *)arena + 0x5b00 + 8;
}
void free_object_slot(void *object) { freed++; }
int encode_object_slot_index(void *object)
{
    return (char *)object < DAT_002046c4 ? ((char *)object-DAT_002046b8)/27
        : 256+((char *)object-DAT_002046c4)/8;
}
void *tilemap_lookup(int x, int y)
{ TEST_ASSERT_TRUE(x>=0 && x<64 && y>=0 && y<64); return (byte *)arena + (y*64+x)*4; }
void *resolve_object_link(ushort *head)
{
    unsigned slot=*head>>6;
    return !slot ? NULL : slot<256 ? DAT_002046b8+slot*27 : DAT_002046c4+(slot-256)*8;
}
void *get_object_record_by_slot_index(int slot)
{ return slot<256 ? DAT_002046b8+slot*27 : DAT_002046c4+(slot-256)*8; }
void get_mouse_position(short *x, short *y) { *x=141; *y=cursor_y; }
long ce_rand(void) { return 0; }
void angle_to_screen_delta(uint heading, short *x, short *y)
{
    /* Original fixed-point compass, cardinal headings used by this fixture. */
    switch ((ushort)heading) {
    case 0: *x=0; *y=32767; break;
    case 0x8000: *x=0; *y=-32768; break;
    case 0x4000: *x=-32768; *y=0; break;
    case 0xc000: *x=32767; *y=0; break;
    default: TEST_FAIL_MESSAGE("Unexpected non-cardinal heading");
    }
}
void collision_build_height_field(uint step_limit)
{
    DAT_002049d4 = wall && g_sweep_foot_pos[1]>=88 ? 0 : 4;
}
void collision_height_envelope(int mode, int collision)
{
    (void)mode;
    (void)collision;
    DAT_002049d6=0;
    DAT_002049d8=DAT_002049d9=wall && g_sweep_foot_pos[1]>=88 ? 128 : 0;
    DAT_002049dc=DAT_002049dd=DAT_002049de=0;
    if(bridge_fixture) {
        for(int i=0;i<bridge_count;i++) {
            byte *record=DAT_00202c38_backing+i*6;
            record[0]=bridge_heights[i]; /* top */
            record[1]=bridge_heights[i]-2; /* underside */
            *(ushort *)(record+2)=(300+i)<<6;
            *(short *)(record+4)=0; /* same tile */
            ushort *bridge=get_object_record_by_slot_index(300+i);
            bridge[0]=0x164;
            bridge[1]=bridge_heights[i]-2;
        }
        DAT_002049dc=bridge_count;
    }
}
void resolve_wall_slide_corner(void) { DAT_002049da=9; }
undefined4 check_object_drop_height(void) { return 1; }
undefined4 object_ptr_in_arena(void) { return 1; }
undefined4 play_sound_effect_at_object(void) { return 0; }
undefined4 play_sound_effect_with_pan(void) { return 0; }
undefined4 apply_typed_damage_to_object(void) { return 0; }
undefined4 roll_object_destroy_chance(void) { return 0; }
undefined4 spawn_scheduled_effect_object(void) { return 0; }
void print_scroll_message_by_id(void) {}
void set_pending_update_flags(void) {}
void spawn_effect_debris_burst(void) {}
void scheduler_relink_entry(void) {}
void set_ambient_bias_without_light(void) {}
undefined4 activate_area_hazard_object(void) { return 1; }
ushort *discard_misplaced_object(void *list, ushort *object, int destroy)
{
    if (!destroy) return object;
    object_list_unlink(list,object);
    free_object_slot(object);
    return NULL;
}
ushort *settle_dropped_object(ushort *object, int x, int y, int mode) { return object; }
ushort *reallocate_object_to_arena(void) { TEST_FAIL_MESSAGE("Unexpected reallocation during flight"); return NULL; }
void project_position_by_heading(int heading, short distance, short *x, short *y) { (void)heading; (void)distance; (void)x; (void)y; TEST_FAIL_MESSAGE("Throw took the ground-drop path"); }
undefined4 check_object_placement_clearance(short catalog_type, short ignore_slot, undefined2 position_x, undefined2 position_y, short height, int check_mode, byte step_limit) { (void)catalog_type; (void)ignore_slot; (void)position_x; (void)position_y; (void)height; (void)check_mode; (void)step_limit; return 1; }

int compute_floor_height_at_position(ushort x_in_tile, ushort y_in_tile) { return 0; }
undefined4 resolve_collision_candidate_interaction(int contact, int slot)
{
    if(bridge_fixture && contact>=0) TEST_ASSERT_LESS_THAN_INT(bridge_count,contact);
    else TEST_ASSERT_EQUAL_INT(-1,contact);
    TEST_ASSERT_TRUE(slot==1 || slot==2);
    return 4;
}
void randomize_settled_snapshot_position(void) {}
void object_list_append_tail(void) { TEST_FAIL_MESSAGE("Throw took the ground-drop path"); }
undefined4 play_positional_sound_effect(void) { return 0; }

bool apply_swim_wade_pose(void) { TEST_FAIL_MESSAGE("Unexpected water"); return false; }

void throw_fixture_reset(void)
{
    unsetenv("UW_PLAYER_NO_BOUNCE");
    memset(arena,0,sizeof arena); memset(held,0,sizeof held);
    memset(character,0,sizeof character); memset(game_mode,0,sizeof game_mode);
    memset(DAT_00202c90_backing,0,sizeof DAT_00202c90_backing);
    memset(DAT_00204920_backing,0,sizeof DAT_00204920_backing);
    memset(DAT_00086998_backing,0,sizeof DAT_00086998_backing);
    memset(DAT_002049c8_backing,0,sizeof DAT_002049c8_backing);
    memset(DAT_002049a0_backing,0,sizeof DAT_002049a0_backing);
    DAT_00085a6c=(short *)game_mode; *(short *)(game_mode+16)=1;
    DAT_00086df8=character;
    DAT_002046b8=(char *)arena+0x4000; DAT_002046c4=(char *)arena+0x5b00;
    g_player_object=(ushort *)(DAT_002046b8+27);
    g_player_object[0]=0x7f;
    g_player_object[1]=48 | (4<<13) | (4<<10);
    g_player_object[0xb]=(10<<10)|(10<<4);
    held[0]=0x80; held[2]=20;
    g_sweep_foot_pos=(short *)DAT_002049c8_backing;
    DAT_002049a8=(undefined1 *)collision_response_mobile_object;
    /* Use the real COMOBJ properties for the player and thrown sack. */
    uw_test_load_object_properties(DAT_00202c90_backing, sizeof DAT_00202c90_backing);
    DAT_000869a8_backing[0]=0; DAT_000869a8_backing[1]=0;
    DAT_000869a8_backing[4]=0; DAT_000869a8_backing[5]=0xc0;
    cursor_y=55; wall=bridge_fixture=false; bridge_count=0;
    mobile_allocations=static_allocations=freed=0;
    thrown=NULL;
}
void throw_fixture_dispose(void) { unsetenv("UW_PLAYER_NO_BOUNCE"); }
void launch(void)
{
    TEST_ASSERT_EQUAL_UINT(1,drop_held_object_near_player(held,1));
    TEST_ASSERT_EQUAL_INT(1,mobile_allocations);
    TEST_ASSERT_EQUAL_INT(0,static_allocations);
    TEST_ASSERT_EQUAL_INT(1,freed); /* original inventory record */
    thrown=(ushort *)(DAT_002046b8+2*27);
    TEST_ASSERT_EQUAL_UINT16(0x80,thrown[0]&0x1ff);
}
void tick(void)
{ DAT_0010190c=thrown; mobile_object_tick(); }
