"""Apply an ARM-verified semantic patch in two exact function contexts.

Function extraction bounds the repair without expensive repeated deep-ellipsis
matching. All semantic rewrites are performed by spatch; this script only
extracts/reinserts exact bodies, retaining their original source locations.
"""
import argparse
from pathlib import Path
import subprocess
import sys
import tempfile
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
sys.path.insert(0,str(ROOT/'tests/tools'))
from extract_functions import extract

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source',type=Path,default=ROOT/'src/combat.c')
    parser.add_argument('--check',action='store_true')
    parser.add_argument('--spatch',default='spatch')
    args=parser.parse_args()
    original=args.source.read_text()
    result=original
    for name in ['npc_combat_position_tick','npc_combat_disengage_tick']:
        body=extract(original,name)
        # Repairs apply only to this proven legacy boundary representation.
        if '((ushort *)DAT_0010190c + 0x14)' not in body:
            continue
        with tempfile.TemporaryDirectory(prefix='uw-npc-word-') as directory:
            path=Path(directory)/'function.c'
            path.write_text(body+'\n')
            for patch in ['npc-combat-byte-offsets.cocci','current-mobile-object.cocci',
                          'object-word-accesses.cocci','current-mobile-fields.cocci']:
                call=subprocess.run([args.spatch,'--sp-file',str(HERE/patch),str(path),
                                     '--no-includes','--in-place'],capture_output=True,text=True)
                if call.returncode:
                    raise RuntimeError(call.stdout+call.stderr)
            fixed=extract(path.read_text(),name)
        if result.count(body)!=1:
            raise ValueError('Ambiguous function body: '+name)
        result=result.replace(body,fixed,1)
        print(name+': corrected ARM byte offsets')
    if result!=original:
        if args.check:
            raise SystemExit(1)
        args.source.write_text(result)

if __name__=='__main__':main()
