---
id: DOC-0004
title: Glossary
status: reviewed
version: 0.3
phase: 0
domain: docs
updated: 2026-09-04
---

# Glossary

| Term | Definition |
|------|------------|
| **Availability time** | Instant when information could legitimately be used for a decision (`availability_time_utc`) |
| **Atomic publish** | Staging → validate → checksum → publish → update control state without half-visible canonical |
| **Bar / Candle** | OHLCV interval with explicit open/close semantics and lifecycle state |
| **Baseline model** | Simple reference model for vertical slice before advanced AI |
| **Binding contract** | Spec under `docs/contracts/` that implementation must obey |
| **Broker reconciliation** | Aligning local intents/orders/positions with broker truth |
| **Calibration** | Mapping raw scores to reliable probabilities |
| **Canonical store** | Lab-normalized market data after quality gates (not raw MT5 shapes) |
| **CANDLE_CLOSED / PARTIAL** | Lifecycle states; promotable paths use closed bars unless declared |
| **Causal claim** | Assertion requiring explicit assumptions; not mere correlation |
| **Champion / Challenger / Shadow** | Model roles in promotion lifecycle |
| **Client order id** | Idempotency key for broker submits |
| **Complexity penalty** | Discovery score term against overfit formulas |
| **Control plane** | SQLite metadata, registry, sync state, experiments |
| **Cursor (sync)** | `last_persisted` watermark advanced only after successful publish |
| **Data plane** | Parquet (and related) historical/feature datasets |
| **Decision point** | `bar_open` / `bar_close` / `tick` — when a decision is allowed to see data |
| **Discovery ≠ Truth** | Candidates need independent validation before knowledge/promotion |
| **DuckDB** | Analytics engine candidate for research queries over Parquet/SQLite |
| **Embargo / Purge** | Temporal split hygiene for overlapping labels |
| **Event envelope** | Standard observability/audit event schema |
| **Execution intent** | Pre-broker order intent bound to risk decision |
| **Fail-safe default** | On uncertainty: DENY/HALT rather than trade |
| **Feature snapshot** | Point-in-time feature vector with availability constraints |
| **Gap class** | market_closed, holiday, transport_failure, … — not always data loss |
| **Hard limit vs target** | Hard limit trips Safe Mode; target is soft operating goal |
| **Idempotency** | Repeat submit must not create duplicate broker orders |
| **Instrument id** | Stable lab identity for a tradable binding |
| **Kill switch** | Emergency halt independent of model health |
| **Knowledge lifecycle** | Candidate → validated → active → degraded → retired |
| **Label** | Supervised target with horizon, price definition, availability rule |
| **Leakage** | Using information not available at decision time |
| **Logical identity** | Canonical key for dedupe (e.g. instrument, TF, open_time) |
| **Manifest** | File list, checksums, schema version for a published dataset |
| **Mid price** | Derived `(bid+ask)/2`, not a source fact unless provided |
| **Migration metadata** | Applied schema migrations with checksum and status |
| **Mixture of specialists** | Ensemble of expert models with gating |
| **Multiple testing** | Accounting for many hypotheses in discovery/search |
| **Narrative doc** | Domain context; TBD sections are not binding |
| **Novelty score** | Discovery metric for structural/temporal/behavioral newness |
| **OHLC invariants** | e.g. high ≥ open,close,low and low ≤ open,close,high |
| **Order lifecycle** | NEW → SENT → ACK → PARTIAL/FILLED/REJECTED/… |
| **Paper trading** | Simulated execution with same risk path as live intent |
| **Pareto frontier** | Multi-objective non-dominated discovery candidates |
| **Point-in-time** | Computation using only data available at T |
| **Prediction ≠ Decision** | Forecasts are not orders |
| **Promotion protocol** | Gated path candidate → shadow → champion |
| **Provenance** | Source identity and transform lineage |
| **Quarantine** | Holding area for bad/suspect data; never silent overwrite |
| **Raw store** | Immutable source captures before canonicalization |
| **Replay** | Deterministic re-run of events for validation/debug |
| **Risk veto** | ALLOW/REDUCE/DENY/HALT independent of AI confidence |
| **Safe Mode** | Restricted runtime: data on; signals/trading/discovery off |
| **Shadow model** | Parallel inference without production authority |
| **Source identity** | Broker/server/feed/schema of origin, separate from logical id |
| **Sync state** | Per instrument×timeframe×source synchronization record |
| **Trace id** | End-to-end link across prediction → signal → risk → order |
| **Vertical slice** | First end-to-end path: MT5→data→sync→feature→baseline→paper |
| **Walk-forward** | Temporal validation scheme with rolling/expanding windows |
