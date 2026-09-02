---
id: DOC-PRED-007
title: Next Candle Prediction
status: draft
version: 0.2
phase: 0
domain: 12-prediction
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-PRED-001, DOC-REPR-002]
related: [DOC-PRED-002, DOC-PRED-005]
---

# Next Candle Prediction

## Purpose

Predict properties of the **next candle** as a multi-output probabilistic object — not a single label `bullish`.

## Required / Preferred Outputs

```text
P(Close > Open)
P(Close > previous_close)
Expected return
Expected range
Expected volatility
Expected high
Expected low
```

Optional:

- quantiles for high/low/close/return  
- scenarios (paths) with probabilities  
- uncertainty intervals  

## Forbidden as sole output

```text
next_candle = bullish
```

A hard direction label may exist only as a **summary** of an underlying probability vector, with thresholds declared and calibrated.

## Rules

- Decision point (bar open vs close) must be declared.
- Outputs are estimates for Signal Engine consumption, not orders.
