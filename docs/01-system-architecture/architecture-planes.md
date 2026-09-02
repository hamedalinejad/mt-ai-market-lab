---
id: DOC-ARCH-001
title: Architecture Planes
status: draft
version: 0.2
phase: 0
domain: 01-system-architecture
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MASTER-001]
---

# Architecture Planes

```text
CONTROL PLANE   Config | Runtime | Scheduler | Resource | Safety
DATA PLANE      MT5 | External | Replay | Sync | Quality
STORAGE PLANE   SQLite | Parquet | DuckDB | Cache | Archive
REPRESENTATION  Candle | Tick | Structure | Regime | Vol | DNA
FEATURE PLANE   Raw | Derived | Statistical | Temporal | Cross-Market
PREDICTION  ||  DISCOVERY  → Experiment → Validation → Knowledge
SIGNAL → Strategy → Risk → Execution (Paper/Live) → Outcome → Error/Feedback → Learning
```
