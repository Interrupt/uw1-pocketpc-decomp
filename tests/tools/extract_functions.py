"""Build test translation units from exact function bodies in game sources.

No implementation copies are checked in: CMake regenerates these files when
an original source changes. Fixtures provide the isolated globals/services.
"""
import argparse
from pathlib import Path
import re


def extract(source, name):
    definition = re.search(
        r"^\w[^\n;]*\b" + re.escape(name) + r"\([^;]*?\)\s*\n",
        source, re.MULTILINE,
    )
    if definition is None:
        raise ValueError(f"Function definition not found: {name}")
    opening = source.index("{", definition.end())
    tokens = re.compile(
        r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|[{}]'
    )
    depth = 0
    for token in tokens.finditer(source, opening):
        if token.group() == "{":
            depth += 1
        elif token.group() == "}":
            depth -= 1
            if depth == 0:
                return source[definition.start():token.end()]
    raise ValueError(f"Unclosed function body: {name}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("functions", nargs="+", help="source.c:function_name")
    args = parser.parse_args()
    chunks = ['/* Generated from original game sources; do not edit. */\n'
              '#include "uw.h"\n#include "src/headers/debug.h"\n']
    for entry in args.functions:
        filename, name = entry.split(":", 1)
        source = (args.root / filename).read_text()
        # Keep compiler errors and Unity diagnostics tied to the original source.
        function = extract(source, name)
        line = source[:source.index(function)].count("\n") + 1
        chunks.append(f'#line {line} "{filename}"\n{function}\n')
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("\n".join(chunks))


if __name__ == "__main__":
    main()
