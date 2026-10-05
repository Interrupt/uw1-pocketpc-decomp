#!/usr/bin/env python3
"""Trace where r0-r3 (and low stack-arg slots) come from at every ARM call site of a function.
usage: arm_trace.py <current_function_name_or_FUN_xxx> [maxsites]"""
import sys, json, re, struct, bisect
sys.path.insert(0, __file__.rsplit('/', 1)[0])
import arm_arity as ar
from capstone.arm import ARM_CC_AL
D = json.load(open(__file__.rsplit('/', 2)[0] + '/ghidra-funcs.json'))['functions']
BYVA = {}
for f in D:
    if f['original_name']: BYVA[int(f['original_name'].split('_')[1], 16)] = f['name']
STARTS = sorted(BYVA)
def enclosing(va):
    i = bisect.bisect_right(STARTS, va) - 1
    return (BYVA[STARTS[i]], STARTS[i]) if i >= 0 else ('?', 0)
def name_of(va): return BYVA.get(va, 'FUN_%08x' % va)
def lit(addr):
    try: return struct.unpack_from('<I', ar.d, ar.fo(addr))[0]
    except Exception: return None
WRITES_ONLY = ('mov', 'mvn', 'ldr', 'ldrb', 'ldrsb', 'ldrh', 'ldrsh', 'add', 'sub', 'rsb', 'orr', 'and', 'eor', 'lsl', 'lsr', 'asr', 'mul', 'bic', 'adr')
def parse(i): return i.mnemonic, i.op_str
def describe(insns, idx, reg, depth=0):
    """Describe reg's value just before insns[idx]."""
    if depth > 6: return '?(deep)'
    for k in range(idx - 1, -1, -1):
        i = insns[k]; m, op = parse(i)
        if m == 'mov' and op.startswith('pc, r') and i.cc == ARM_CC_AL:
            if reg == 'r0': return 'return of <indirect/ordinal call at %x>' % i.address
            return 'after-call (unset/stale %s)' % reg
        if m == 'bl' or m == 'blx':
            if reg == 'r0': return 'return of <%s>%s' % (name_of(int(op.strip('#'), 16)), '' if i.cc == ARM_CC_AL else ' (cond)')
            if reg in ('r1', 'r2', 'r3'): return 'clobbered by call <%s> (stale)' % name_of(int(op.strip('#'), 16)) if False else None or 'after-call (unset/stale r%s)' % reg[1]
            continue
        CCS = ('eq','ne','cs','hs','cc','lo','mi','pl','vs','vc','hi','ls','ge','lt','gt','le')
        base = m[:-2] if i.cc != ARM_CC_AL and m[-2:] in CCS else m
        if base not in WRITES_ONLY and base[:-1] in WRITES_ONLY: base = base[:-1]
        mm = re.match(r'(%s),\s*(.*)$' % reg, op)
        if mm and base in WRITES_ONLY:
            rest = mm.group(2); cond = '' if i.cc == ARM_CC_AL else ' [cond %s]' % m
            if base.startswith('mov') and rest.startswith('#'): return 'const %s%s' % (rest[1:], cond)
            if base.startswith('mov') and re.match(r'r\d+|sb|sl|fp|ip$', rest):
                src = {'sb': 'r9', 'sl': 'r10', 'fp': 'r11'}.get(rest, rest)
                return 'copy of %s <- %s%s' % (src, describe(insns, k, src, depth + 1), cond)
            if base.startswith('ldr') and '[pc, #' in rest:
                off = int(re.search(r'#(-?0x[0-9a-f]+|-?\d+)', rest).group(1), 0); a = i.address + 8 + off
                v = lit(a); return ('&DAT_%08x' % v if v is not None and v >= 0x73000 else hex(v) if v is not None else '?') + cond
            mb = re.match(r'\[(r\d+|sb|sl|fp|ip)(?:, #(-?0x[0-9a-f]+|-?\d+))?\]$', rest)
            if base.startswith('ldr') and mb:
                b = {'sb': 'r9', 'sl': 'r10', 'fp': 'r11'}.get(mb.group(1), mb.group(1))
                return '*(%s%s)%s' % (describe(insns, k, b, depth + 1), ' + ' + mb.group(2) if mb.group(2) else '', cond)
            if base.startswith('ldr'): return '%s%s' % (i.mnemonic + ' ' + rest, cond)
            if base.startswith('add') and re.match(r'sp, #', rest): return 'address of stack local %s%s' % (rest, cond)
            return '%s %s%s' % (i.mnemonic, rest, cond)
        if m.startswith(('b', 'pop', 'ldm')) and not m.startswith(('bic',)) and i.cc == ARM_CC_AL and m in ('b', 'bx') :
            return 'unknown (flow join before %x)' % i.address
    return 'incoming %s (parameter of enclosing function)' % reg
def ordinal_sites(n):
    """Call sites of coredll ordinal n: either a `bl` to its import thunk, or the inline
    `ldr rX,[pc]; ldr rX,[rX]; mov lr,pc; mov pc,rX` indirect-call pattern."""
    import pefile
    pe = pefile.PE(ar.EXE)
    slot = next(s.address for e in pe.DIRECTORY_ENTRY_IMPORT for s in e.imports if s.ordinal == n)
    lits = {ar.BASE + ar.TEXT_RVA + o for o in range(0, ar.TEXT_SZ - 4, 4) if struct.unpack_from('<I', ar.d, ar.TEXT_FO + o)[0] == slot}
    sites = []
    for o in range(0, ar.TEXT_SZ - 4, 4):
        w = struct.unpack_from('<I', ar.d, ar.TEXT_FO + o)[0]
        if (w & 0x0f7f0000) == 0x051f0000 or (w & 0x0f7f0000) == 0x059f0000:
            va = ar.BASE + ar.TEXT_RVA + o; imm = w & 0xfff
            t = va + 8 + (imm if (w >> 23) & 1 else -imm)
            if t in lits:
                rd = (w >> 12) & 0xf
                for i in ar.disasm(va + 4, 8):
                    if i.mnemonic == 'mov' and i.op_str.startswith('pc, r'): sites.append(i.address); break
    return sorted(sites)
def trace(target, maxsites=99, sites=None):
    for c in (sites if sites is not None else ar.callers(target))[:maxsites]:
        fn, fs = enclosing(c)
        n = (c - fs) // 4 + 1
        ins = ar.disasm(max(fs, c - 4 * 60), (c - max(fs, c - 4 * 60)) // 4 + 1)
        idx = len(ins) - 1
        print('site %x in %s(+0x%x):' % (c, fn, c - fs))
        for r in ('r0', 'r1', 'r2', 'r3'): print('    %s: %s' % (r, describe(ins, idx, r)))
        st = []
        for i in ins[-14:]:
            mm = re.match(r'str\w*\s+(\w+), \[sp(?:, #(0x[0-9a-f]+|\d+))?\]', '%s %s' % (i.mnemonic, i.op_str))
            if mm: st.append('[sp+%s]=%s' % (hex(int(mm.group(2) or '0', 0)), mm.group(1)))
        if st: print('    stack:', ' '.join(st))
if __name__ == '__main__':
    a = sys.argv[1]
    if a.startswith('ord:'):
        trace(0, 999, ordinal_sites(int(a[4:]))); sys.exit()
    va = int(a, 16) if a.startswith('0x') else int(a.split('_')[1], 16) if a.startswith('FUN_') else next(v for v, n in BYVA.items() if n == a)
    trace(va, int(sys.argv[2]) if len(sys.argv) > 2 else 99)
