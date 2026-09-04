---
id: DOC-PATH-19-EXECUTION-SLIPPAGE-HANDLING-MD
title: Slippage Handling
status: draft
version: 0.2
phase: 0
domain: 19-execution
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-EXEC-001]
related: [DOC-EXEC-012, DOC-VAL-022]
---

# Slippage Handling

## Purpose

Slippage is **dynamic**, not a fixed `1 pip`.

## Forbidden as sole model

```text
slippage = 1 pip
```

## Dynamic model inputs (candidate)

```text
spread
volatility
liquidity
session
symbol
order size
market regime
latency
```

## Rules

- Paper and Live validation use the same slippage model family.
- Stress tests use adverse percentiles of the model, not only the mean.
- Model parameters are calibrated offline and versioned; live uses promoted version only.

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

