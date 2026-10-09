#!/bin/sh
# Build and run the game against the local data/ folder.
set -e
cd "$(dirname "$0")"

cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build -j

./build/uw_dbg --data-dir="$(pwd)/data" --debug-level=INFO "$@"
