---
id: DOC-FEAT-018
title: Label Generation
status: draft
version: 0.2
phase: 0
domain: 07-feature-engineering
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-003, DOC-VAL-013]
related: [DOC-PRED-001, DOC-STRAT-001]
---

# Label Generation

## Examples

```text
future_return_1 / _5
future_high / future_low
max_drawdown (path)
MFE / MAE
direction
range
```

## Critical

Each label declares **when it becomes observable** (availability time). Labels that need future path must not leak into features at decision time.

## MFE / MAE

- **Maximum Favorable Excursion**
- **Maximum Adverse Excursion**

Required candidates for strategy discovery evaluation.
