#include "src/headers/uw.h"
void uw_reset_frame_pacing(void);
void uw_set_present_refresh_rate(unsigned refresh_hz);
int uw_present_frame_due(uint64_t now_us);
void uw_service_pending_present(uint64_t now_us);
int uw_service_game_clock(uint64_t now_us);
