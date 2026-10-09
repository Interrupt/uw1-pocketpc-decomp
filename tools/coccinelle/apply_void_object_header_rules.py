"""Apply audited common-header rules to GNU C byte-scaled void pointers.

No record layout is inferred from a void pointer alone. Every receiver and
function comes from the Clang object-role audit; only header bytes 0..7 are
converted. NPC/projectile extensions and unrelated buffers are excluded.
"""
import argparse
from concurrent.futures import ThreadPoolExecutor
import json
from pathlib import Path
import subprocess
import tempfile
from generate_header_field_rules import generate as field_rules, regex
from generate_word_access_rules import generate as storage_rules, HEADER
from generate_named_field_read_rules import generate as named_reads
from struct_field_catalog import WORDS

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]


def patches(source):
    functions = []
    storage = []
    groups = {}
    for function in source.get('functions', []):
        roles = [r for r in function['roles'] if r['type'] == 'void *']
        if not roles:
            continue
        functions.append(dict(function=function['function'], roles=roles))
        for role in roles:
            groups.setdefault(role['name'], []).append(function['function'])
    for index, (pointer, scopes) in enumerate(groups.items()):
        patch = storage_rules(pointer, HEADER, regex(scopes), raw_type='void *')
        storage.append(patch.replace('@w_', f'@receiver_{index}_w_'))
    if functions:
        return [field_rules(dict(functions=functions)), '\n'.join(storage),
                named_reads({word: WORDS[word] for word in HEADER.values()}, {})]
    return []


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--check', action='store_true')
    group.add_argument('--in-place', action='store_true')
    parser.add_argument('--jobs', type=int, default=4)
    parser.add_argument('--logs', type=Path, default=Path('/private/tmp/uw-void-header-logs'))
    args = parser.parse_args()
    args.logs.mkdir(parents=True, exist_ok=True)
    sources = json.loads((HERE / 'object-pointer-roles.json').read_text())['sources']
    def apply(source):
        phases = patches(source)
        if not phases:
            return 0
        original = ROOT / source['source']
        changed = False
        with tempfile.TemporaryDirectory() as tmp:
            work = Path(tmp) / original.name
            work.write_bytes(original.read_bytes())
            logs = []
            for index, patch in enumerate(phases):
                path = Path(tmp) / f'phase{index}.cocci'
                path.write_text(patch)
                result = subprocess.run(['spatch', '--sp-file', str(path), str(work),
                                         '--all-includes', '--include-headers-for-types',
                                         '-I', str(ROOT), '-I', str(ROOT / 'src'), '--in-place'],
                                        capture_output=True, text=True)
                logs.append(result.stdout + result.stderr)
                if result.returncode:
                    (args.logs / (original.stem + '.log')).write_text('\n'.join(logs))
                    return result.returncode
                changed |= '--- ' in result.stdout
            (args.logs / (original.stem + '.log')).write_text('\n'.join(logs))
            changed = work.read_bytes() != original.read_bytes()
            if changed and args.in_place:
                original.write_bytes(work.read_bytes())
            elif changed and not args.check:
                print('\n'.join(logs), flush=True)
        print(f"{original.name}: {'converted' if changed and args.in_place else 'changes pending' if changed else 'unchanged'}", flush=True)
        return int(changed and args.check)
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        results = list(pool.map(apply, sources))
    if any(results):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
