---
id: DOC-DATA-004
title: Candle Close Semantics
status: reviewed
version: 0.5
phase: 0
domain: 03-market-data
updated: 2026-09-04
---

# Candle Close Semantics — locked (BUG-P0-016)

Must be defined centrally (not re-interpreted per model/feature):

```text
candle open time
candle close boundary
inclusive/exclusive endpoint policy
timezone
DST handling
broker session
incomplete current candle rules
revised closed candle rules
```

| Decision point | Rule |
|----------------|------|
| bar_open | current bar OHLC not usable |
| bar_close | values only after close |
| tick | state up to that tick only |

Feature/model code **must not** invent private close semantics.
