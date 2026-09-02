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
