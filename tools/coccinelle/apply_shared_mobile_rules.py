"""Apply reviewed shared-mobile layout recipes, preserving source locations."""
import argparse
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import subprocess
import sys
import tempfile
from generate_shared_mobile_rules import CONTEXTS, access_rules, bit_rules, precise_rules, coordinate_rules, shared_write_rules

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT / 'tests/tools'))
from extract_functions import extract


def convert(filename, source, spatch='spatch'):
    logs = []
    with tempfile.TemporaryDirectory() as tmp:
        work = Path(tmp) / filename
        for entry in CONTEXTS[filename]:
            before = extract(source, entry[0])
            prefix = '#include "src/headers/uw.h"\n'
            work.write_text(prefix + before + '\n')
            phases = [access_rules([entry]), precise_rules(), bit_rules([entry]), coordinate_rules([entry])]
            phases += [(HERE / name).read_text() for name in
                       ['named-field-reads.cocci', 'packed-stores.cocci']]
            if entry[3] == 'shared':
                phases.append(shared_write_rules())
            for index, content in enumerate(phases):
                if not content.strip():
                    continue
                patch = Path(tmp) / 'phase.cocci'
                patch.write_text(content)
                result = subprocess.run([spatch, '--sp-file', str(patch), str(work),
                                         '--all-includes', '--include-headers-for-types',
                                         '-I', str(ROOT), '-I', str(ROOT / 'src'), '--in-place'],
                                        capture_output=True, text=True)
                logs.append(result.stdout + result.stderr)
                if result.returncode:
                    raise RuntimeError(entry[0] + f' phase {index}\n' + logs[-1])
                print(f'{filename}: {entry[0]} phase {index} finished', flush=True)
            after = extract(work.read_text(), entry[0])
            source = source.replace(before, after, 1)
        return source, '\n'.join(logs)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--in-place', action='store_true')
    group.add_argument('--check', action='store_true')
    parser.add_argument('--jobs', type=int, default=4)
    parser.add_argument('--files', nargs='+', choices=list(CONTEXTS), default=list(CONTEXTS))
    parser.add_argument('--logs', type=Path, default=Path('/private/tmp/uw-shared-mobile-logs'))
    args = parser.parse_args()
    args.logs.mkdir(parents=True, exist_ok=True)

    def apply(filename):
        path = ROOT / 'src' / filename
        before = path.read_text()
        after, log = convert(filename, before)
        (args.logs / (filename + '.log')).write_text(log)
        changed = before != after
        if changed and args.in_place:
            path.write_text(after)
        elif changed and not args.check:
            print(log, flush=True)
        print(f'{filename}: ' + ('converted' if changed and args.in_place else
              'changes pending' if changed else 'unchanged'), flush=True)
        return changed and args.check

    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        results = list(pool.map(apply, args.files))
    if any(results):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
