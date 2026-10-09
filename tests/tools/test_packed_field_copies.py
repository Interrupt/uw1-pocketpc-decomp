"""Exhaustive direct-field copy checks using actual UW1 layouts."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from generate_packed_store_rules import COPY_LOW_CASTS, generate_copies
from generate_named_field_write_rules import receivers
from struct_field_catalog import WORDS
from extract_functions import extract

assert (ROOT / 'tools/coccinelle/packed-field-copies.cocci').read_text() == generate_copies(), \
    'regenerate packed-field-copies.cocci before testing'


def shape(word, spelling):
    header = word in ('type_flags', 'position_word', 'chain_word', 'link_word')
    nested = header and 'hdr.' in spelling
    typ = ('uw_object_type_props_t' if word == 'size_weight' else
           'uw_mobile_object_t' if not header or nested else 'uw_object_hdr_t')
    return typ, ('hdr.' if nested else '') + word


def check(word):
    with tempfile.TemporaryDirectory() as tmp:
        path = Path(tmp) / 'copies.c'
        patch = Path(tmp) / 'copies.cocci'
        patch.write_text(generate_copies([word]))
        functions, checks, expected = [], [], []
        for dest in receivers(word):
            dt, dm = shape(word, dest)
            d = dest.replace('P', 'dp' if '->' in dest else 'dst') + word
            for source in receivers(word):
                st, sm = shape(word, source)
                s = source.replace('P', 'sp' if '->' in source else 'src') + word
                for cast in COPY_LOW_CASTS:
                    i = len(expected)
                    expected.append(f'{d} = {s};')
                    low = s + '_low' if not cast else cast + '(' + s + ')'
                    alias = dt == st and dm == sm and '->' in source
                    functions.append(f'''unsigned copy_{i}(unsigned V, int self)
{{
    {dt} dst, *dp = &dst;
    {st} src, *sp = &src;
    memset(&dst, 0xa5, sizeof(dst));
    memset(&src, 0x5a, sizeof(src));
    src.{sm} = V;
    {'if (self) { sp = (' + st + ' *)&dst; dst.' + dm + ' = V; }' if alias else '(void)self;'}
    unsigned char before[sizeof(src)];
    memcpy(before, &src, sizeof(src));
    {d}_low = {low};
    {d}_high = {s}_high;
    assert(dst.{dm} == V);
    assert(memcmp(before, &src, sizeof(src)) == 0);
    for (unsigned j = 0; j < sizeof(dst); ++j)
        if (j < offsetof({dt}, {dm}) || j >= offsetof({dt}, {dm}) + 2)
            assert(((unsigned char *)&dst)[j] == 0xa5);
    return dst.{dm};
}}''')
                    checks.append(f'hash = hash * 31 + copy_{i}(V, self);')
        excluded = '''void excluded(uw_object_hdr_t *dst, uw_object_hdr_t *src, uw_object_hdr_t *other)
{
    dst->position_word_low = (byte)src->position_word;
    dst->position_word_high = other->position_word_high;
    dst->chain_word_low = src->chain_word_low;
    src->chain_word_high++;
    dst->chain_word_high = src->chain_word_high;
    dst->link_word_low = src->chain_word_low;
    dst->link_word_high = src->link_word_high;
}
'''
        path.write_text('#include "src/headers/uw.h"\n#include <stddef.h>\n#include <assert.h>\n' + excluded + '\n'.join(functions) + '''
int main(void) {
    uint64_t hash = 0;
    for (unsigned V = 0; V < 65536; ++V)
        for (int self = 0; self < 2; ++self) {
''' + '\n'.join(checks) + '''
        }
    printf("%llu\\n", (unsigned long long)hash);
}
''')
        def execute():
            program = Path(tmp) / 'copies'
            subprocess.run(['cc', '-std=c11', '-O2', '-I', str(ROOT), str(path), '-o', str(program)], check=True, capture_output=True)
            return subprocess.check_output([str(program)])
        def transform():
            result = subprocess.run([sys.argv[1], '--sp-file', str(patch), str(path),
                                     '--all-includes', '--include-headers-for-types', '-I', str(ROOT),
                                     '-I', str(ROOT / 'src'), '--in-place'], capture_output=True, text=True)
            assert result.returncode == 0, result.stdout + result.stderr
        before = execute()
        transform()
        result = path.read_text()
        for i, assignment in enumerate(expected):
            body = extract(result, f'copy_{i}')
            assert assignment in body, (word, i, body)
            assert word + '_low' not in body and word + '_high' not in body
        assert extract(result, 'excluded') == extract(excluded, 'excluded')
        assert execute() == before
        transform()
        assert path.read_text() == result
        return len(expected)


with ThreadPoolExecutor(max_workers=4) as pool:
    counts = list(pool.map(check, WORDS))
print(f'UW1 direct packed copies: {sum(counts)} forms x 65,536 values; source, neighbors, self-copy, exclusions and idempotence passed')
