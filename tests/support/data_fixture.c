#include "game_fixture.h"
#include "unity.h"

FILE *uw_test_open_data(const char *relative_path)
{
    char path[512];
    int length = snprintf(path, sizeof path, "%s/%s", UW_TEST_DATA_DIR, relative_path);
    TEST_ASSERT_TRUE(length > 0 && (size_t)length < sizeof path);
    FILE *file = fopen(path, "rb");
    TEST_ASSERT_NOT_NULL_MESSAGE(file, path);
    return file;
}

void uw_test_read_data(const char *path, void *destination, size_t size,
                       long offset, int origin)
{
    FILE *file = uw_test_open_data(path);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, offset, origin));
    TEST_ASSERT_EQUAL_UINT(size, fread(destination, 1, size, file));
    TEST_ASSERT_EQUAL_INT(0, fclose(file));
}

void uw_test_load_map(byte *arena, size_t capacity, unsigned level)
{
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(UW_TEST_LEVEL_SIZE, capacity);
    FILE *file = uw_test_open_data("DATA/LEV.ARK");
    ushort count;
    uint offsets[2048];
    TEST_ASSERT_EQUAL_UINT(2, fread(&count, 1, 2, file));
    TEST_ASSERT_GREATER_THAN_UINT(0, level);
    TEST_ASSERT_LESS_OR_EQUAL_UINT(count, level);
    TEST_ASSERT_LESS_OR_EQUAL_UINT(2048, count);
    TEST_ASSERT_EQUAL_UINT(count, fread(offsets, sizeof *offsets, count, file));
    uint offset = offsets[level - 1];
    TEST_ASSERT_GREATER_THAN_UINT(0, offset);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, 0, SEEK_END));
    long end = ftell(file);
    TEST_ASSERT_TRUE(end >= offset);
    uint length = end - offset;
    for (unsigned i = 0; i < count; i++)
        if (offsets[i] > offset && offsets[i] - offset < length)
            length = offsets[i] - offset;
    TEST_ASSERT_EQUAL_UINT(UW_TEST_LEVEL_SIZE, length);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, offset, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(length, fread(arena, 1, length, file));
    TEST_ASSERT_EQUAL_INT(0, fclose(file));
    ushort marker;
    memcpy(&marker, arena + 0x7c06, 2);
    TEST_ASSERT_EQUAL_HEX16(0x7577, marker);
}

ushort *uw_test_level_object(byte *arena, size_t capacity, unsigned slot)
{
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(UW_TEST_LEVEL_SIZE, capacity);
    TEST_ASSERT_GREATER_THAN_UINT(0, slot);
    TEST_ASSERT_LESS_THAN_UINT(1024, slot);
    unsigned offset = slot < 256 ? 0x4000 + slot * 27 : 0x5b00 + (slot - 256) * 8;
    return (ushort *)(arena + offset);
}

void uw_test_load_object_properties(byte *records, size_t capacity)
{
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(512 * 13, capacity);
    memset(records, 0, capacity);
    FILE *file = uw_test_open_data("DATA/COMOBJ.DAT");
    TEST_ASSERT_EQUAL_INT(0, fseek(file, 2, SEEK_SET));
    for (int id = 0; id < 512; id++) {
        byte packed[11], *row = records + id * 13;
        TEST_ASSERT_EQUAL_UINT(11, fread(packed, 1, sizeof packed, file));
        memcpy(row, packed, 4);
        memcpy(row + 5, packed + 4, 7);
    }
    TEST_ASSERT_EQUAL_INT(0, fclose(file));
}
