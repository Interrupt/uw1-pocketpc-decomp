#!/bin/sh
# Build and run the game against the local data/ folder, instrumented
# with AddressSanitizer (see CMakeLists.txt's uw_asan target). Use this
# instead of run.sh when chasing a memory-safety bug interactively --
# ASan catches out-of-bounds reads/writes and use-after-frees the plain
# uw_dbg build silently reads/writes through instead (this is how every
# fix under "Fix a real heap-buffer-overflow..." and "Fix the 3
# remaining ASan-caught crashes..." in git log was found). Roughly 2x
# slower than run.sh and uses more memory; that's expected.
set -e
cd "$(dirname "$0")"

cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build -j --target uw_asan

UW_DATA_DIR="$(pwd)/data" UW_DEBUG_LEVEL=INFO ASAN_OPTIONS="${ASAN_OPTIONS:-detect_leaks=0}" ./build/uw_asan
