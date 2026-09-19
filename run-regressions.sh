#!/bin/sh
# Run the demo_*.txt regression suite against build/uw_dbg and report
# which scripts crash. Mirrors the ad-hoc loop used throughout this
# session's playtesting/bug-fixing work.
#
# Usage:
#   ./run-regressions.sh                  # run the default script list
#   ./run-regressions.sh foo.txt bar.txt  # run only these scripts instead
#
# Tweakable via env vars:
#   BUILD=0                 skip running build.sh first (default: 1, builds)
#   TIMEOUT=10               seconds to let each script run before killing it
#   OUT_DIR=/tmp/regress_out directory for per-script logs
#   BIN=build/uw_dbg         binary to run
#   DEBUG_LEVEL=WARN         UW_DEBUG_LEVEL passed to the binary
#   EXTRA_ENV="UW_DEBUG_INV=1 UW_CONTAINER_AUTOCLOSE_ON_DRAG_OUT=1"
#                            extra env vars (space-separated KEY=VAL pairs)
#                            forwarded to the binary for every script
#
# Note: demo_automap.txt is deliberately excluded from the default list
# -- it's a 4000+ line tile-by-tile traversal that takes 5+ minutes,
# too slow for a routine regression check. Pass it explicitly as an
# argument if you want to run it anyway.

set -u
cd "$(dirname "$0")"

BUILD="${BUILD:-1}"
TIMEOUT="${TIMEOUT:-10}"
OUT_DIR="${OUT_DIR:-/tmp/regress_out}"
BIN="${BIN:-build/uw_dbg}"
DEBUG_LEVEL="${DEBUG_LEVEL:-WARN}"
EXTRA_ENV="${EXTRA_ENV:-}"

DEFAULT_SCRIPTS="demo_click_female.txt demo_critter_orbit_cardinal.txt demo_dungeon_room.txt demo_inventory_container_item_click_test.txt demo_inventory_container_torch_use_test.txt demo_inventory_dropback_test.txt demo_inventory_open_bag_test.txt demo_object_test.txt demo_objects.txt demo.txt"

if [ "$#" -gt 0 ]; then
  SCRIPTS="$*"
else
  SCRIPTS="$DEFAULT_SCRIPTS"
fi

if [ "$BUILD" = "1" ]; then
  echo "Building..."
  ./build.sh
fi

mkdir -p "$OUT_DIR"

crash_count=0
total_count=0

for s in $SCRIPTS; do
  if [ ! -f "$s" ]; then
    echo "SKIP (not found): $s"
    continue
  fi
  total_count=$((total_count + 1))
  log="$OUT_DIR/$s.log"
  ( eval "$EXTRA_ENV" UW_DATA_DIR="$(pwd)/data" UW_DEBUG_LEVEL="$DEBUG_LEVEL" UW_DEMO_FILE="$(pwd)/$s" "./$BIN" > "$log" 2>&1 & )
  sleep "$TIMEOUT"
  pkill -x "$(basename "$BIN")" 2>/dev/null
  sleep 1
  if grep -qi "fatal signal\|EXC_BAD_ACCESS\|SIGSEGV\|Segmentation fault" "$log"; then
    echo "CRASH: $s (see $log)"
    crash_count=$((crash_count + 1))
  else
    echo "clean: $s"
  fi
done

echo ""
echo "$((total_count - crash_count))/$total_count clean"
[ "$crash_count" -eq 0 ]
