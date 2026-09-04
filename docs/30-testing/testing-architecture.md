---
id: DOC-TEST-001
title: Testing Architecture
status: reviewed
version: 0.6
phase: 0
domain: 30-testing
updated: 2026-09-04
---

# Test Specification Direction (BUG-TEST-P0-001)

Suites: unit, integration, contract, data, replay, backtest, model, discovery, execution, recovery, performance, end-to-end

Each suite specification must eventually define:

```text
test cases
fixtures
pass/fail criteria
deterministic seed
failure injection hooks
```

Merge gate remains: unit, contract, data invariants, leakage, deterministic replay, no unauthorized MT5 imports, no schema drift.
