`static_strings.json` records the original Pocket PC `UU.exe` string bytes,
exported from a read-only Ghidra project. Each entry identifies the executable
address and the corresponding game declaration. Embedded spaces, newlines,
carriage returns, punctuation, and actual underscores are significant.

The audit covers all 343 initialized byte-string declarations in `src/*.c`,
including 19 previously zero-filled constants recovered by checking their
addresses and text callers. Host diagnostic literals without original binary
addresses are outside this audit. Coordinate tables that happen to start with
printable bytes are not interpreted as strings.

Five intentional host adaptations are recorded with `port_value` and `reason`:

- Four save-path fragments keep their separator on the filename suffix instead
  of the directory prefix. Together they still produce `\SAVE0\player.dat`,
  `\SAVE0\desc`, and `\SAVE0\*.*`.
- The model parser uses `%x%1s` instead of ARM's `%lx%1s`, because its destination
  is a 32-bit integer while this host's `long` is 64 bits.

The static-strings test compiles the actual game declarations and compares them
with this independent audit. The scroll-messages test uses those declarations
with the actual scroll wrapping, newline parsing, and cursor-state code;
only font measurement, drawing, and input services are mocked. Tests require
neither Ghidra nor the original executable at runtime.

When updating an expectation, verify the bytes in the original executable;
do not regenerate expected text from the current C source. Keep the original
value and explain any deliberate port adaptation separately.
