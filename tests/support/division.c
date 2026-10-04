#include "src/headers/uw.h"
#include "unity.h"

/* Preserve the ordinal's divisor-first calling convention. Suites needing a
   deliberately unexpected-call mock can provide their own archive symbol. */
divmod_result ordint_divmod(int divisor, int dividend)
{
    TEST_ASSERT_NOT_EQUAL(0, divisor);
    divmod_result result = {dividend / divisor, dividend % divisor};
    return result;
}
