#!/usr/bin/env python3
"""Evidence helper: inspect the real shipped ARM UU.exe for a function's argument usage and its
callers' argument setup.   usage: arm_arity.py FUN_xxxxxxxx [--callers N]
Ghidra addresses are virtual addresses (image base 0x10000)."""
import sys, struct
from capstone import *
from capstone.arm import ARM_CC_AL
EXE = '/Users/ccuddigan/Projects/UW1/uw-arm/UU.exe'
d = open(EXE, 'rb').read()
BASE = 0x10000; TEXT_RVA = 0x1000; TEXT_FO = 0x400; TEXT_SZ = 0x7152c
md = Cs(CS_ARCH_ARM, CS_MODE_ARM); md.detail = True
ARGS = ('r0', 'r1', 'r2', 'r3')
def fo(va): return TEXT_FO + (va - BASE - TEXT_RVA)
def disasm(va, n): return list(md.disasm(d[fo(va):fo(va) + 4 * n], va))
def func_insns(va, maxn=800):
    out = []
    for i in disasm(va, maxn):
        out.append(i)
        if i.cc == ARM_CC_AL and ((i.mnemonic.startswith('ldm') and 'pc' in i.op_str) or
                                  (i.mnemonic == 'bx' and i.op_str == 'lr') or
                                  (i.mnemonic in ('mov', 'cpy') and i.op_str == 'pc, lr')): break
    return out
def reads_before_write(insns):
    written = set(); read = []
    for i in insns:
        rr, rw = i.regs_access()
        for r in rr:
            nm = i.reg_name(r)
            if nm in ARGS and nm not in written and nm not in read: read.append(nm)
        if i.cc == ARM_CC_AL:
            for r in rw: written.add(i.reg_name(r))
    return read
def callers(target):
    res = []
    for off in range(0, TEXT_SZ, 4):
        w = struct.unpack_from('<I', d, TEXT_FO + off)[0]
        if (w >> 24) & 0xf == 0xb:
            imm = w & 0xffffff
            if imm & 0x800000: imm -= 1 << 24
            va = BASE + TEXT_RVA + off
            if va + 8 + imm * 4 == target: res.append(va)
    return res
import re
def estimate_arity(ins):
    """Estimated real arity: highest r0-r3 read before written, plus stack args read above the frame."""
    rd = reads_before_write(ins)
    nreg = max([int(r[1]) + 1 for r in rd], default=0)
    frame = 0
    for i in ins[:4]:
        if i.mnemonic == 'push': frame += 4 * (i.op_str.count(',') + 1)
        m = re.match(r'sp, sp, #(0x[0-9a-f]+|\d+)$', i.op_str) if i.mnemonic == 'sub' else None
        if m: frame += int(m.group(1), 0)
    nstk = 0
    for i in ins:
        m = re.search(r'\[sp, #(0x[0-9a-f]+|\d+)\]', i.op_str)
        if m and i.mnemonic.startswith(('ldr',)) and int(m.group(1), 0) >= frame:
            nstk = max(nstk, (int(m.group(1), 0) - frame) // 4 + 1)
    return (nreg if nstk == 0 and nreg else 4 if nstk else nreg) + nstk, nreg, nstk
if __name__ == '__main__':
    va = int(sys.argv[1].split('_')[1], 16)
    ins = func_insns(va)
    print('estimated arity (total, reg, stack):', estimate_arity(ins))
    print('callee r0-r3 read-before-write:', reads_before_write(ins), '| insns', len(ins))
    for i in ins[:5]: print('  %x %s %s' % (i.address, i.mnemonic, i.op_str))
    cs = callers(va); print('bl callers:', len(cs), [hex(c) for c in cs[:6]])
    if '--callers' in sys.argv:
        k = int(sys.argv[sys.argv.index('--callers') + 1])
        for c in cs[:k]:
            print('--', hex(c))
            for i in disasm(c - 4 * 9, 10): print('  %x %s %s' % (i.address, i.mnemonic, i.op_str))

def site_arity(c, window=14):
    """Rough arity at an ARM call site: highest of r0-r3 written in the window before the bl,
    stack slots written ([sp,#0..#0x1c]) -- passthrough regs (written earlier) can't be seen."""
    ins = disasm(c - 4 * window, window)
    # stop the window at the previous call/branch target boundary
    cut = 0
    for k, i in enumerate(ins):
        if i.mnemonic in ('bl', 'b', 'bx', 'pop', 'ldm') or i.mnemonic.startswith(('b', 'ldm')) and i.mnemonic not in ('bic', 'bics'):
            cut = k + 1
    ins = ins[cut:]
    regs = set(); stk = set()
    for i in ins:
        m = __import__('re').match(r'(r[0-3]),', i.op_str)
        if m and not i.mnemonic.startswith(('str', 'cmp', 'tst', 'teq', 'cmn')): regs.add(m.group(1))
        m = __import__('re').search(r'\[sp(?:, #(0x[0-9a-f]+|\d+))?\]', i.op_str)
        if m and i.mnemonic.startswith('str'): stk.add(int(m.group(1) or '0', 0) // 4)
    nreg = max([int(r[1]) + 1 for r in regs], default=0)
    nstk = (max(stk) + 1) if stk and max(stk) < 8 else 0
    return (4 + nstk) if nstk else nreg
