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

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

