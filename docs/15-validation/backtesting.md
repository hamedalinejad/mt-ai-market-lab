---
id: DOC-VAL-004
title: Backtesting
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022]
related: [DOC-VAL-017, DOC-EXEC-010]
---

# Backtesting

## Two engines

| Engine | Role |
|--------|------|
| **Vectorized** | Fast Discovery screening |
| **Event-driven replay** | Final Validation (spread, slippage, latency, partial fill, stop, TP) |

Vectorized alone is insufficient for promotion of trading Claims.
