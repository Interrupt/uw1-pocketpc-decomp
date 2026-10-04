#ifndef HEADERS_REGISTRATION_H
#define HEADERS_REGISTRATION_H

/* Declarations for registration.c: the product registration/copy-
 * protection cluster (code-wheel word checksum, registry-based
 * "already validated" sentinel, and the registration-key dialog gate).
 * Pulls in uw.h itself so this header is self-contained for any
 * caller. */
#include "uw.h"

undefined2 codewheel_letter_at_index();
int codewheel_index_of_letter();
undefined4 validate_codewheel_word();
undefined4 check_registration_key_saved();
void save_registration_key_validated();
void set_power_status_flag_bit();
void clear_power_status_flag_bit();
undefined4 check_registration_key_dialog();
undefined4 registration_key_dialog_proc();
undefined4 is_product_registered();
undefined4 check_save_disk_space();

#endif
