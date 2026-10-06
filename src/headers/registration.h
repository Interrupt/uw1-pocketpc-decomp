#ifndef HEADERS_REGISTRATION_H
#define HEADERS_REGISTRATION_H

/* Declarations for registration.c: the product registration/copy- protection cluster (code-wheel
   word checksum, registry-based "already validated" sentinel, and the registration-key dialog
   gate). Pulls in uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

short codewheel_letter_at_index(int index);
int codewheel_index_of_letter(short letter);
int validate_codewheel_word(ushort *key, int answer_address);
int check_registration_key_saved();
void save_registration_key_validated();
void set_power_status_flag_bit();
void clear_power_status_flag_bit();
int check_registration_key_dialog(int window, int instance);
int registration_key_dialog_proc(int dialog, int message, short control_id);
int is_product_registered(char *window, int instance);
int check_save_disk_space();

#endif
