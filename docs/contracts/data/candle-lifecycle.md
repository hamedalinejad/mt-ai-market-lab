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
