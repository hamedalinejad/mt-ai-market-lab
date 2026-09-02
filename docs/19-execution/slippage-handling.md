---
id: DOC-EXEC-010
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
