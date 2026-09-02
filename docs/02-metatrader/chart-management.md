---
id: DOC-MT5-005
title: Chart Management
status: reviewed
version: 0.4
phase: 0
domain: 02-metatrader
related: [ADR-0014]
---

# Chart Opening (ADR-0014 binding)

```text
Python Controller
  → MT5 integration boundary (command channel)
  → MQL5 helper / EA
  → ChartOpen(symbol, timeframe)
```

| Layer | Responsibility |
|-------|----------------|
| **Python** | which symbols, policy, command emit, no ChartOpen API |
| **MQL5** | ChartOpen, chart limits, terminal GUI |

Chart failure must not block data sync. Chart ≠ Signal correctness.
