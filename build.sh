#!/bin/sh
# Configure (if needed) and build build/uw_dbg via CMake.
cd "$(dirname "$0")"

cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug || exit 1
cmake --build build -j 2>&1 | grep -iE "error:"
echo "built"
