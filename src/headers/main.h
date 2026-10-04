#ifndef HEADERS_MAIN_H
#define HEADERS_MAIN_H

/* Declarations for main.c: process entry point, static-initializer/
 * atexit-handler bookkeeping, and process termination. Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

void entry(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4);
void run_static_initializers();
void call_function_pointer_range();
void terminate_process();
undefined4 register_atexit_handler();
undefined4 register_default_atexit_handler();

#endif
