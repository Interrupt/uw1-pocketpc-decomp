#include "restored_tables_fixture.h"
void setUp(void) { restored_tables_fixture_reset(); }
void tearDown(void) {}
static void test_original_arm_table_contents(void)
{ TEST_ASSERT_EQUAL_INT(0, uw_test_compare_original_tables()); }
static void test_barter_slots_accept_their_centers_and_reject_gaps(void)
{
    const short x[4]={148,169,148,169}, y[4]={12,12,30,30};
    for (int i=0; i<4; ++i) {
        TEST_ASSERT_EQUAL_INT(i, hit_test_barter_player_slot(x[i]+8,y[i]+8));
        TEST_ASSERT_EQUAL_INT(i, hit_test_barter_npc_slot(x[i]-57+8,y[i]+8));
    }
    TEST_ASSERT_EQUAL_INT(-1, hit_test_barter_player_slot(167,20));
    TEST_ASSERT_EQUAL_INT(-1, hit_test_barter_npc_slot(50,20));
    TEST_ASSERT_EQUAL_INT(-1, hit_test_barter_player_slot(148,48));
}
static void test_light_colors_follow_source_type_and_strength(void)
{
    byte colors[3];
    compute_light_source_colors(colors);
    TEST_ASSERT_EQUAL_UINT8(21,colors[0]);
    ushort count=3<<6; memcpy(DAT_00086df8+0x5f,&count,2);
    DAT_00086df8[0x3e]=0x20; /* Type 0, strength 2. */
    DAT_00086df8[0x40]=0x32; /* Type 2, strength 3. */
    DAT_00086df8[0x42]=0x13; /* Type 3, strength 1. */
    compute_light_source_colors(colors);
    TEST_ASSERT_EQUAL_UINT8(16,colors[0]);
    TEST_ASSERT_EQUAL_UINT8(16,colors[1]);
    TEST_ASSERT_EQUAL_UINT8(5,colors[2]);
}
static void test_combination_consumption_and_result_use_loaded_records(void)
{
    for(int i=0; i<10; ++i) {
        ushort a[4]={DAT_00100630_backing[i*3]&0x1ff},
               b[4]={DAT_00100630_backing[i*3+1]&0x1ff};
        TEST_ASSERT_EQUAL_INT((DAT_00100630_backing[i*3]&0x8000)!=0,
                              is_object_consumed_in_combination(a,i));
        TEST_ASSERT_EQUAL_INT((DAT_00100630_backing[i*3+1]&0x8000)!=0,
                              is_object_consumed_in_combination(b,i));
        spawn_combined_object(i);
        TEST_ASSERT_EQUAL_INT((short)DAT_00100630_backing[i*3+2],restored_spawn_id);
    }
}
static void test_lock_ratings_use_loaded_armor_and_accessory_records(void)
{
    ushort object[4]={0};
    for(int id=0; id<64; ++id) {
        object[0]=id;
        int expected=id<16?(signed char)DAT_00202800_backing[id*8+7]:
            id<32?-1:(signed char)DAT_00202750_backing[(id-32)*4+1];
        TEST_ASSERT_EQUAL_INT(expected,resolve_lock_difficulty_rating(object));
    }
    object[0]=0x40;
    TEST_ASSERT_EQUAL_INT(-1,resolve_lock_difficulty_rating(object));
}
static void test_spawn_block_scan_preserves_host_pointers_and_excludes_player(void)
{
    ushort source[16]={0}, nearby[16]={0};
    /* ARM tests bit 0x100 of the unaligned word at +0xd: byte +0xe bit 0. */
    source[7]=g_player_object[7]=1;
    restored_scan_objects[0]=source;
    restored_scan_objects[1]=g_player_object;
    restored_scan_objects[2]=nearby;
    TEST_ASSERT_EQUAL_INT(0,check_object_area_for_spawn_block(source));
    TEST_ASSERT_EQUAL_INT(3,restored_scan_count);
    nearby[7]=1;
    TEST_ASSERT_EQUAL_INT(1,check_object_area_for_spawn_block(source));
    nearby[7]=0;
    TEST_ASSERT_EQUAL_INT(0,check_object_area_for_spawn_block(source));
}
static void test_native_window_callbacks_forward_keyboard_and_mouse_arguments(void)
{
    const uint keys[]={0x100,0x101,0x102,0x103,0x106,0x107,0x104,0x105};
    const uint mouse[]={0x201,0x204,0x202,0x205,0x200};
    for(unsigned i=0; i<sizeof keys/sizeof keys[0]; ++i) {
        dispatch_window_message(42,keys[i],65,0x00500020);
        TEST_ASSERT_EQUAL_INT(1,restored_message_kind);
        TEST_ASSERT_EQUAL_UINT(42,restored_message_window);
        TEST_ASSERT_EQUAL_INT(keys[i],restored_message_id);
        TEST_ASSERT_EQUAL_UINT(65,restored_message_wparam);
    }
    for(unsigned i=0; i<sizeof mouse/sizeof mouse[0]; ++i) {
        dispatch_window_message(42,mouse[i],2,0x00500020);
        TEST_ASSERT_EQUAL_INT(2,restored_message_kind);
        TEST_ASSERT_EQUAL_UINT(42,restored_message_window);
        TEST_ASSERT_EQUAL_INT(mouse[i],restored_message_id);
        TEST_ASSERT_EQUAL_UINT(2,restored_message_wparam);
        TEST_ASSERT_EQUAL_INT(0x00500020,restored_message_lparam);
    }
    const int messages[]={15,2,8,7,0x999};
    const int actions[]={3,4,5,6,7};
    for(unsigned i=0; i<5; ++i) {
        dispatch_window_message(0,messages[i],0,0);
        TEST_ASSERT_EQUAL_INT(actions[i],restored_message_kind);
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_original_arm_table_contents);
    RUN_TEST(test_native_window_callbacks_forward_keyboard_and_mouse_arguments);
    RUN_TEST(test_barter_slots_accept_their_centers_and_reject_gaps);
    RUN_TEST(test_light_colors_follow_source_type_and_strength);
    RUN_TEST(test_combination_consumption_and_result_use_loaded_records);
    RUN_TEST(test_lock_ratings_use_loaded_armor_and_accessory_records);
    RUN_TEST(test_spawn_block_scan_preserves_host_pointers_and_excludes_player);
    return UNITY_END();
}
