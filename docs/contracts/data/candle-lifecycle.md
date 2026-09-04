---
id: DOC-CONTRACT-DATA-candle-lifecycle
title: Candle Lifecycle States
status: reviewed
version: 0.2
phase: 0
domain: contracts
updated: 2026-09-04
---

# Live vs Closed Candle Types (BUG-P0-017)

```text
CANDLE_OPEN      # bar started, no usable body for close-decision paths
CANDLE_PARTIAL   # forming / incomplete
CANDLE_CLOSED    # finalized for decision_point=bar_close
```

Backtest/promotable paths default to **CANDLE_CLOSED** only. Using PARTIAL without explicit declaration is a leakage defect.

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

