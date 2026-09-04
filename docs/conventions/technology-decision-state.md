---
id: DOC-CONV-010
title: Technology Decision State
status: approved
version: 0.3
phase: 0
domain: conventions
updated: 2026-09-04
depends_on: ['DOC-PROJ-050']
---

# Technology States

```text
candidate → benchmarked-candidate → locked
```

- Prototype behind interfaces is allowed at **candidate**.
- Global defaults require **locked** (ADR + benchmark).
- Contracts must not encode unbenchmarked product names as truth.

Examples remaining candidate until benchmark: specific Parquet layout details, ML library, exact RAM numbers.
