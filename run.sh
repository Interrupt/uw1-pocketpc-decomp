#!/bin/sh
# Build and run the game against the local data/ folder.
set -e
cd "$(dirname "$0")"

cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build -j

UW_DATA_DIR="$(pwd)/data" UW_DEBUG_LEVEL=INFO ./build/uw_dbg
