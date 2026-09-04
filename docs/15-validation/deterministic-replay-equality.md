---
id: DOC-VAL-029
title: Deterministic Replay Equality Policy
status: reviewed
version: 0.2
phase: 0
domain: 15-validation
updated: 2026-09-04
---

# Deterministic Replay Equality (BUG-TEST-P0-003)

“Same result” must declare equality policy:

```text
bitwise equality
tolerance equality
event equality
trade sequence equality
metric equality
```

Each replay test pins which policy applies per assertion class.
