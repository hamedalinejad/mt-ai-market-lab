#!/usr/bin/env python3
"""Lightweight doc validation: unique IDs, approved files should not be empty of substance."""
from pathlib import Path
import re
from collections import Counter
root = Path(__file__).resolve().parents[1] / 'docs'
ids = []
errors = []
for p in root.rglob('*.md'):
    t = p.read_text(encoding='utf-8', errors='replace')
    m = re.search(r'^id:\s*(.+)$', t, re.M)
    if m:
        ids.append(m.group(1).strip())
    else:
        errors.append(f'MISSING_ID {p}')
    st = re.search(r'^status:\s*(\S+)', t, re.M)
    if st and st.group(1) == 'approved' and len(t) < 200:
        errors.append(f'APPROVED_TOO_SHORT {p}')
for i, n in Counter(ids).items():
    if n > 1:
        errors.append(f'DUPLICATE_ID {i} x{n}')
if errors:
    print('\n'.join(errors))
    raise SystemExit(1)
print(f'OK {len(ids)} ids, unique')
