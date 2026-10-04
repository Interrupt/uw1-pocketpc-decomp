/* Kept in its own archive member so a suite's RNG fixture takes precedence
   without requiring weak symbols or changes to the original game code. */
long ce_rand(void) { return 0; }
