#include "unity.h"
#include "uw.h"
#include "src/headers/inventory.h"

/* Object links and widget slots are fixtures; recursive inventory lookup is real. */
static ushort objects[5][4];
static ushort slots[29];
char *g_backpack_slot_table = (char *)slots;
unsigned char g_backpack_widget_to_slot_backing[0x17];
char *g_current_container_record;
ushort *DAT_002046b4;

void *resolve_object_link(ushort *link)
{
    unsigned slot = *link >> 6;
    TEST_ASSERT_GREATER_THAN_UINT(0, slot);
    TEST_ASSERT_LESS_THAN_UINT(5, slot);
    return objects[slot];
}

int encode_object_slot_index(ushort *object)
{
    TEST_ASSERT_NOT_NULL(object);
    for (int i = 1; i < 5; i++)
        if (object == objects[i]) return i;
    TEST_FAIL_MESSAGE("Lookup must pass the actual object pointer to slot encoding");
    return 0;
}

void setUp(void)
{
    memset(objects, 0, sizeof(objects));
    memset(slots, 0, sizeof(slots));
    for (int i = 0; i < 20; i++) g_backpack_widget_to_slot_backing[i] = i;
    g_current_container_record = NULL;
    DAT_002046b4 = 0;
    objects[1][0] = 0x15f; /* sack */
    objects[1][3] = 2 << 6; /* contents */
    objects[2][0] = 0x8000 | 0x80; /* quantity object, not a container */
    slots[4] = 1 << 6;
}
void tearDown(void) {}

static void test_picked_up_sack_has_inventory_widget(void)
{
    TEST_ASSERT_EQUAL_INT(4, find_or_assign_object_widget(objects[1]));
}
static void test_open_sack_finds_contents_through_inventory_widget(void)
{
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[2]));
}
static void test_lookup_returns_object_and_owning_link(void)
{
    TEST_ASSERT_EQUAL_PTR(objects[2], FUN_00053644(objects[1] + 3, 1, 2));
    TEST_ASSERT_EQUAL_PTR(objects[1] + 3, DAT_002046b4);
}
static void test_nested_container_finds_inner_object(void)
{
    objects[2][0] = 0x15f;
    objects[2][3] = 3 << 6;
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[3]));
    TEST_ASSERT_EQUAL_PTR(objects[2] + 3, DAT_002046b4);
}
static void test_lookup_follows_sibling_link(void)
{
    objects[2][2] = 3 << 6;
    TEST_ASSERT_EQUAL_PTR(objects[3], FUN_00053644(objects[1] + 3, 1, 3));
    TEST_ASSERT_EQUAL_PTR(objects[1] + 3, DAT_002046b4);
}
static void test_missing_object_has_no_widget(void)
{
    TEST_ASSERT_EQUAL_INT(-1, find_or_assign_object_widget(objects[4]));
}
static void test_empty_container_returns_null(void)
{
    objects[1][3] = 0;
    TEST_ASSERT_NULL(FUN_00053644(objects[1] + 3, 1, 2));
}
static void test_quantity_field_is_not_traversed_as_contents(void)
{
    objects[2][3] = 4 << 6;
    TEST_ASSERT_EQUAL_INT(-1, find_or_assign_object_widget(objects[4]));
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_picked_up_sack_has_inventory_widget);
    RUN_TEST(test_open_sack_finds_contents_through_inventory_widget);
    RUN_TEST(test_lookup_returns_object_and_owning_link);
    RUN_TEST(test_nested_container_finds_inner_object);
    RUN_TEST(test_lookup_follows_sibling_link);
    RUN_TEST(test_missing_object_has_no_widget);
    RUN_TEST(test_empty_container_returns_null);
    RUN_TEST(test_quantity_field_is_not_traversed_as_contents);
    return UNITY_END();
}
