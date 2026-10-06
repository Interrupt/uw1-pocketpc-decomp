#include "src/headers/uw.h"
extern int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
extern short DAT_0020471c, DAT_00204748, DAT_00204784, DAT_002047a4;
extern short DAT_00204838, DAT_0020483c, DAT_002047dc, DAT_002047d8;
extern undefined2 DAT_00204704;
void uw_reset_frame_pacing(void);
int uw_present_frame_due(uint64_t now_us);
void uw_service_pending_present(uint64_t now_us);
void uw_set_present_refresh_rate(unsigned refresh_hz);
