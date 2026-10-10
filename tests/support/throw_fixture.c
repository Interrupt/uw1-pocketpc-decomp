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
uw_object_hdr_t *alloc_object_slot(int mobile)
{
    if (mobile) { mobile_allocations++; return (char *)arena + 0x4000 + 2 * 27; }
    static_allocations++;
    return (char *)arena + 0x5b00 + 8;
}
void free_object_slot(uw_object_hdr_t *object) { freed++; }
int encode_object_slot_index(const uw_object_hdr_t *object)
{
    return (char *)object < DAT_002046c4 ? ((char *)object-DAT_002046b8)/27
        : 256+((char *)object-DAT_002046c4)/8;
}
void *tilemap_lookup(short x, short y)
{ TEST_ASSERT_TRUE(x>=0 && x<64 && y>=0 && y<64); return (byte *)arena + (y*64+x)*4; }
uw_object_hdr_t *resolve_object_link(ushort *head_)
{ ushort *head = (ushort *)head_;
    unsigned slot=*head>>6;
    return !slot ? NULL : slot<256 ? DAT_002046b8+slot*27 : DAT_002046c4+(slot-256)*8;
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{ return slot<256 ? DAT_002046b8+slot*27 : DAT_002046c4+(slot-256)*8; }
void get_mouse_position(ushort *x, ushort *y) { *x=141; *y=cursor_y; }
long ce_rand(void) { return 0; }
void angle_to_screen_delta(uint heading, void *x_, void *y_)
{ short *x = (short *)x_; short *y = (short *)y_;
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
int check_object_drop_height(ushort *object, ushort *reference) { (void)object; (void)reference; return 1; }
int object_ptr_in_arena(const uw_object_hdr_t *object) { (void)object; return 1; }
int play_sound_effect_at_object(int sound_id, ushort *object, int volume_bias) { (void)sound_id; (void)object; (void)volume_bias; return 0; }
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias) { (void)sound_id; (void)pan; (void)volume_bias; return 0; }
int apply_typed_damage_to_object(ushort *target, ushort *attacker, int tile_x, short tile_y, byte damage, byte damage_type) { (void)target; (void)attacker; (void)tile_x; (void)tile_y; (void)damage; (void)damage_type; return 0; }
int roll_object_destroy_chance(short base_chance, void *object) { (void)base_chance; (void)object; return 0; }
int spawn_scheduled_effect_object(ushort *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y) { (void)source_object; (void)effect_group; (void)delay; (void)animation_offset; (void)heading_adjust; (void)tile_x; (void)tile_y; return 0; }
void print_scroll_message_by_id(uint message_id) { (void)message_id;}
void set_pending_update_flags(ushort flags) { (void)flags;}
void spawn_effect_debris_burst(void *template, uint tile_x, int tile_y) { (void)template; (void)tile_x; (void)tile_y;}
void scheduler_relink_entry(void *new_object, void *old_object) { (void)new_object; (void)old_object;}
void set_ambient_bias_without_light(char light_level) { (void)light_level;}
int activate_area_hazard_object(ushort *hazard, uint tile_x, int tile_y, int damage) { (void)hazard; (void)tile_x; (void)tile_y; (void)damage; return 1; }
ushort *discard_misplaced_object(void *list, ushort *object, int destroy)
{
    if (!destroy) return object;
    object_list_unlink(list,object);
    free_object_slot(object);
    return NULL;
}
uw_object_hdr_t *settle_dropped_object(void *object, short x, short y,
				       int mode) { return object; }
uw_object_hdr_t *reallocate_object_to_arena(ushort *object) { (void)object; TEST_FAIL_MESSAGE("Unexpected reallocation during flight"); return NULL; }
void project_position_by_heading(int heading, short distance, void *x, void *y) { (void)heading; (void)distance; (void)x; (void)y; TEST_FAIL_MESSAGE("Throw took the ground-drop path"); }
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit) { (void)catalog_type; (void)ignore_slot; (void)position_x; (void)position_y; (void)height; (void)check_mode; (void)step_limit; return 1; }

int compute_floor_height_at_position(ushort x_in_tile, ushort y_in_tile) { return 0; }
int resolve_collision_candidate_interaction(short contact, int slot)
{
    if(bridge_fixture && contact>=0) TEST_ASSERT_LESS_THAN_INT(bridge_count,contact);
    else TEST_ASSERT_EQUAL_INT(-1,contact);
    TEST_ASSERT_TRUE(slot==1 || slot==2);
    return 4;
}
void randomize_settled_snapshot_position(void *snapshot) { (void)snapshot;}
void object_list_append_tail(ushort *link_field, uw_object_hdr_t *object) { (void)link_field; (void)object; TEST_FAIL_MESSAGE("Throw took the ground-drop path"); }
int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias) { (void)sound_id; (void)world_x; (void)world_y; (void)volume_bias; return 0; }

bool apply_swim_wade_pose(ushort collision_mask) { (void)collision_mask; TEST_FAIL_MESSAGE("Unexpected water"); return false; }

void throw_fixture_reset(void)
{
    options_unset("player-no-bounce");
    memset(arena,0,sizeof arena); memset(held,0,sizeof held);
    memset(character,0,sizeof character); memset(game_mode,0,sizeof game_mode);
    memset(((byte *)g_object_type_props),0,sizeof g_object_type_props);
    memset(DAT_00204920_backing,0,sizeof DAT_00204920_backing);
    memset(DAT_00086998_backing,0,sizeof DAT_00086998_backing);
    memset(DAT_002049c8_backing,0,sizeof DAT_002049c8_backing);
    memset(DAT_002049a0_backing,0,sizeof DAT_002049a0_backing);
    DAT_00085a6c=(short *)game_mode; *(short *)(game_mode+16)=1;
    DAT_00086df8=character;
    DAT_002046b8=(char *)arena+0x4000; DAT_002046c4=(char *)arena+0x5b00;
    g_player_object = (uw_mobile_object_t *)(ushort *)(DAT_002046b8 + 27);
    ((ushort *)g_player_object)[0]=0x7f;
    ((ushort *)g_player_object)[1]=48 | (4<<13) | (4<<10);
    ((ushort *)g_player_object)[0xb]=(10<<10)|(10<<4);
    held[0]=0x80; held[2]=20;
    g_sweep_foot_pos=(short *)DAT_002049c8_backing;
    DAT_002049a8=collision_response_mobile_object;
    /* Use the real COMOBJ properties for the player and thrown sack. */
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
    DAT_000869a8_backing[0]=0; DAT_000869a8_backing[1]=0;
    DAT_000869a8_backing[4]=0; DAT_000869a8_backing[5]=0xc0;
    cursor_y=55; wall=bridge_fixture=false; bridge_count=0;
    mobile_allocations=static_allocations=freed=0;
    thrown=NULL;
}
void throw_fixture_dispose(void) { options_unset("player-no-bounce"); }
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
