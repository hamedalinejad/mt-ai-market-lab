---
id: DOC-DATA-004
title: Candle Close Semantics
status: reviewed
version: 0.3
phase: 0
domain: 03-market-data
---

# Candle Close Semantics (system-wide binding)

| Decision point | Rule |
|----------------|------|
| **bar_open** | Current bar OHLC **not** usable |
| **bar_close** | Current bar values only **after** close |
| **tick** | Only state available up to that tick |

Forming ≠ closed. Declared on every Prediction/Signal/Feature snapshot.
