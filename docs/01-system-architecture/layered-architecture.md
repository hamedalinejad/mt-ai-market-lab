---
id: DOC-ARCH-002
title: Final Layered Architecture
status: approved
version: 1.0
phase: 0
domain: 01-system-architecture
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-050', 'DOC-PROJ-052']
---

# Layered Architecture

```text
User / CLI / Monitoring / Research UI
        ↓
Runtime Orchestrator / Mode Manager / Scheduler
        ↓
MT5 Adapter | External Ingestion | Control Plane | Observability
        ↓
Raw / Staging / Quarantine
        ↓
Canonical Data Publisher
        ↓
Canonical Market Data  |  Metadata / State DB
        ↓
Dataset / Snapshot Layer
        ↓
Market Representation
        ↓
Feature / Label Layer
        ↓
Prediction Engine  |  Discovery Engine
        ↓
Experiment / Validation
        ↓
Knowledge Base
        ↓
Signal / Strategy Engine
        ↓
Risk Authority
        ↓
Paper Execution  |  Live Execution (promoted only)
        ↓
Outcomes / Feedback
        ↓
Learning / Drift / Error → governed re-entry
```

## Control plane vs data plane

**Control plane** (SQLite candidate): instrument registry, sync state, gaps, run metadata, manifests, experiment/hypothesis/model/knowledge registries, order intents, execution state, event log, migrations, config metadata, health/recovery checkpoints.

**Data plane** (Parquet candidate bulk; DuckDB analytics candidate): raw observations, canonical candles, optional ticks, derived TFs, features, labels, experiment outputs, replay, research artifacts.

DuckDB is **not** the sole persistence authority.
