"""Apply or check partial-property rules with header types and source filtering."""
import argparse
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import shutil
import subprocess
import tempfile

from generate_partial_field_read_rules import generate, observed_cases

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--in-place', action='store_true')
    mode.add_argument('--check', action='store_true', help='fail if a conversion remains')
    parser.add_argument('--jobs', type=int, default=4)
    parser.add_argument('sources', type=Path, nargs='*')
    args = parser.parse_args()
    spatch = shutil.which('spatch')
    if not spatch:
        parser.error('spatch is required')
    if args.jobs < 1:
        parser.error('--jobs must be positive')
    sources = args.sources or sorted((ROOT / 'src').glob('*.c'))

    def run(path):
        selected = observed_cases(path.read_text())
        if not selected:
            return path, False, '', None
        with tempfile.TemporaryDirectory() as tmp:
            patch = Path(tmp) / 'reads.cocci'
            patch.write_text(generate(selected))
            command = [spatch, '--sp-file', str(patch), str(path),
                       '--all-includes', '--include-headers-for-types',
                       '-I', str(ROOT), '-I', str(ROOT / 'src')]
            if args.in_place:
                command.append('--in-place')
            result = subprocess.run(command, capture_output=True, text=True)
            if result.returncode:
                return path, False, '', result.stdout + result.stderr
            return path, '--- ' in result.stdout, result.stdout, None

    changed, failed = 0, False
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        for path, changes, output, error in pool.map(run, sources):
            if error is not None:
                print(f'{path}:\n{error}')
                failed = True
            if changes:
                changed += 1
                print(f'{path}: {"converted" if args.in_place else "conversion remains"}')
                if not args.in_place and not args.check:
                    print(output)
    print(f'{changed} files {"converted" if args.in_place else "with remaining conversions"}')
    return 1 if failed or (args.check and changed) else 0


if __name__ == '__main__':
    raise SystemExit(main())
