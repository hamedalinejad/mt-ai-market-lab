---
id: DOC-MT5-001
title: MT5 Integration Boundary
status: approved
version: 1.0
phase: 0
domain: 02-metatrader
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-050']
related: ['ADR-0008']
---

# MT5 Integration Boundary

```text
Application → MarketDataProvider interface → MT5 adapter → MetaTrader 5 terminal
```

Application code must **not** scatter direct broker API calls.

## Adapter responsibilities
connect/disconnect; health; symbol discovery/selection; rates; ticks where available; broker/server metadata; history availability; error taxonomy translation; bounded retry; reconnect signaling to sync.

## Non-assumptions
- identical history depth per symbol
- identical TF availability
- identical session hours across brokers
- unlimited history regardless of terminal config
- 1:1 symbol map across brokers
- source-native HTF always ≡ locally derived HTF

Chart-open is adapter/bridge capability, **not** a prerequisite for core ingestion correctness.
