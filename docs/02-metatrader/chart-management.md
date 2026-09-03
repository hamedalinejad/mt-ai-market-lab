---
id: DOC-MT5-005
title: Chart Management
status: reviewed
version: 0.5
phase: 0
domain: 02-metatrader
updated: 2026-09-04
related: [ADR-0014]
---

# Chart Opening ≠ Data API (BUG-P0-014)

| Capability | Owner |
|------------|--------|
| symbol selection, rates/ticks, orders | **Python MT5 Adapter** |
| ChartOpen / chart lifecycle GUI | **MQL5 Chart Controller** |

```text
Python Controller → command contract → MQL5 Chart Controller → ChartOpen
```

`symbol_select` is **not** “open chart in UI”. Chart failure must not block data sync.
