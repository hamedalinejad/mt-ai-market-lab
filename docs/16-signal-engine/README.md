---
id: DOC-SIG-README
title: Signal Engine
status: approved
version: 1.0
phase: 0
domain: 16-signal-engine
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052']
---

# Signal Engine

A signal is an explicit **decision candidate**, not an execution order.

## Minimum lineage
```text
signal_id, prediction_id, strategy_id, instrument_id, decision_time,
side, strength/score, confidence, supporting evidence, contradicting evidence,
feature set/version, knowledge references
```

Must be traceable to prediction and data available at the decision point.
