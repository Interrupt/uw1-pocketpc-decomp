"""Apply or check the generated per-source semantic patches with spatch."""
import argparse
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import subprocess

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--check', action='store_true')
    p.add_argument('--jobs',type=int,default=4)
    p.add_argument('--patch-dir',type=Path,default=HERE/'header-fields')
    p.add_argument('--logs',type=Path,default=Path('/private/tmp/uw-header-field-logs'))
    args=p.parse_args()
    args.logs.mkdir(parents=True,exist_ok=True)
    def apply(patch):
        source=ROOT/'src'/(patch.stem+'.c')
        command=['spatch','--sp-file',str(patch),str(source),'--no-includes']
        if not args.check: command+=['--in-place']
        result=subprocess.run(command,text=True,capture_output=True)
        (args.logs/(patch.stem+'.log')).write_text(result.stdout+result.stderr)
        changed='--- ' in result.stdout
        print(f'{source.name}: '+('changes pending' if args.check and changed else 'converted' if changed else 'unchanged'),flush=True)
        return result.returncode or (1 if args.check and changed else 0)
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        codes=list(pool.map(apply, sorted(args.patch_dir.glob('*.cocci'))))
    if any(codes):raise SystemExit(1)

if __name__=='__main__':main()
