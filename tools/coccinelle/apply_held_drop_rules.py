"""Apply the exact-source held-drop recipe, leaving edited bodies untouched."""
import argparse
import json
from pathlib import Path
import re
HERE=Path(__file__).resolve().parent
NONCODE=re.compile(r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'')

def apply(source,recipe):
    # Mask comments/strings before locating a real function definition; an
    # example body embedded in a comment must never be rewritten.
    code=NONCODE.sub(lambda m:re.sub(r'[^\n]',' ',m.group()),source)
    pattern=re.compile(r'^int\s+'+re.escape(recipe['function'])+r'\s*\([^;{}]*?\)\s*\{',re.M)
    matches=list(pattern.finditer(code))
    if len(matches)!=1: return source,False
    start=matches[0].start(); end=matches[0].end(); depth=1
    while depth and end<len(code):
        depth+=(code[end]=='{')-(code[end]=='}'); end+=1
    if depth or source[start:end]!=recipe['before']: return source,False
    return source[:start]+recipe['after']+source[end:],True

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('source',type=Path)
    args=parser.parse_args()
    recipe=json.loads((HERE/'held-drop-fields.json').read_text())
    source=args.source.read_text(); result,changed=apply(source,recipe)
    if changed: args.source.write_text(result)
    print('Converted held-drop body' if changed else 'No matching original held-drop body')
if __name__=='__main__': main()
