#ifndef UW_TEST_STATIC_STRINGS_FIXTURE_H
#define UW_TEST_STATIC_STRINGS_FIXTURE_H
#include "src/headers/uw.h"
struct uw_test_static_string {
    unsigned address;
    const char *source;
    const char *actual;
    const char *expected;
};
extern const struct uw_test_static_string uw_test_static_strings[];
extern const size_t uw_test_static_string_count;
#endif
