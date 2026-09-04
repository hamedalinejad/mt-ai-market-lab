---
id: DOC-EXEC-012
title: Paper Trading
status: draft
version: 0.2
phase: 0
domain: 19-execution
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-EXEC-001]
related: [DOC-EXEC-011, DOC-EXEC-010]
---

# Paper Trading

## Purpose

Paper Trading must mirror Live, except broker submission.

## Same as Live

```text
Signal
Strategy
Risk
Execution
Reconciliation
Cost
Slippage
Spread
Latency (modeled)
```

## Difference

```text
Broker Execution  →  Simulated Execution
```

## Rules

- Not a toy simulator that bypasses Risk or Trace.
- Uses real market data path.
- Simulated fills consume the **dynamic slippage model**.
- Outcomes feed Error Memory and performance the same way as live (flagged `paper`).

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

