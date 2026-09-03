---
id: DOC-ARCH-001
title: Architecture Planes
status: reviewed
version: 0.5
phase: 0
domain: 01-system-architecture
---

# Final Plane Layout

```text
CONTROL: Config | Scheduler | Safety | Resource
DATA: MT5 | External | Replay | Sync | Quality
STORAGE: SQLite | Parquet | DuckDB | Cache
REPRESENTATION: Tick | Candle | Session | Regime | Structure
FEATURE/LABEL: Raw | Derived | Statistical | Temporal | Cross
PREDICTION (Predictor) || DISCOVERY (Discoverer)
→ Experiment → Validation → Knowledge → Signal → Strategy → Risk
→ Execution (Paper|Live) → Outcome → Error/Feedback → Learner
```

## Responsibilities
MT5 Adapter, Sync, Quality, Storage, Representation, Feature, Predictor, Learner, Discoverer, Experiment, Validator, Knowledge, Signal, Strategy, Risk, Execution — each bounded; no cross-skip to broker from Prediction/Discovery.
