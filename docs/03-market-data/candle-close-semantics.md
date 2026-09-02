---
id: DOC-DATA-004
title: Candle Close Semantics
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-003]
related: [DOC-PRED-007, DOC-VAL-013]
---

# Candle Close Semantics

## Live distinction

```text
current (forming) candle  ≠  closed candle
```

Predictions on a forming bar must not be labeled/evaluated as if they used the final closed OHLC of that same bar.

Decision point (`bar_open` | `bar_close` | tick) is mandatory on Prediction/Signal artifacts.
