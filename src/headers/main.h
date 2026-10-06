#ifndef HEADERS_MAIN_H
#define HEADERS_MAIN_H

/* Declarations for main.c: process entry point, static-initializer/
 * atexit-handler bookkeeping, and process termination. Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

void entry(int instance, int prev_instance, int command_line, int show_command);
void run_static_initializers();
void call_function_pointer_range(uint *range_start, uint *range_end);
void terminate_process(int exit_code);
int register_atexit_handler(int handler);
int register_default_atexit_handler(int handler);

#endif
