#ifndef HEADERS_MAIN_H
#define HEADERS_MAIN_H

/* Declarations for main.c: process entry point, static-initializer/
 * atexit-handler bookkeeping, and process termination. Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

void entry(undefined4 instance, undefined4 prev_instance, undefined4 command_line, undefined4 show_command);
void run_static_initializers(void);
void call_function_pointer_range(undefined4 *range_start, undefined4 *range_end);
void terminate_process(int exit_code);
undefined4 register_atexit_handler(undefined4 handler);
undefined4 register_default_atexit_handler(undefined4 handler);

#endif
