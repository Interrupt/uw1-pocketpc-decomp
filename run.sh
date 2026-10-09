#!/bin/sh
# Build and run the game against the local data/ folder -- or against
# whatever UW_DATA_DIR already names, so `UW_DATA_DIR=/path/to/UW ./run.sh`
# works (it used to be overridden here). UW_DEBUG_LEVEL overrides too.
set -e
cd "$(dirname "$0")"

cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build -j

UW_DATA_DIR="${UW_DATA_DIR:-$(pwd)/data}" UW_DEBUG_LEVEL="${UW_DEBUG_LEVEL:-INFO}" ./build/uw_dbg
