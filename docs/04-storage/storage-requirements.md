---
id: DOC-PATH-04-STORAGE-STORAGE-REQUIREMENTS-MD
title: Storage Requirements
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MASTER-001, ADR-0004]
related: [DOC-STOR-014, DOC-STOR-015, DOC-DATA-001]
---

# Storage Requirements

## Purpose

Define non-negotiable requirements for persisting multi-year market data, metadata, features, experiments and knowledge on a **typical laptop**, without assuming a server or cloud data warehouse.

## Scope

Phase 0 Specification. Technology choices remain **candidates** until Benchmark + ADR (see ADR-0004).

## Functional Requirements

| ID | Requirement |
|----|-------------|
| SR-01 | Store multi-year historical bars for selected symbols and timeframes |
| SR-02 | Optionally store ticks (or tick windows) where available and needed |
| SR-03 | Survive process restart and OS reboot without data loss of committed writes |
| SR-04 | Support gap detection and idempotent backfill after downtime |
| SR-05 | Separate **raw** source data from **canonical** normalized data |
| SR-06 | Support external import (Parquet/CSV) into the same canonical interface |
| SR-07 | Persist sync state, symbol registry, experiment registry, knowledge status |
| SR-08 | Enable analytical queries for research, backtest and feature exploration |
| SR-09 | Version datasets used for training and experiments (reproducibility) |
| SR-10 | Archive cold data without breaking hot-path reads |

## Non-Functional Requirements

| ID | Requirement |
|----|-------------|
| NFR-01 | Target machine: consumer laptop (no assumption of 64GB+ RAM or GPU) |
| NFR-02 | Graceful degradation under low disk / low RAM (see resource policy) |
| NFR-03 | Read path for live analysis must not block indefinitely on heavy research scans |
| NFR-04 | Writes must be recoverable (WAL / atomic replace / manifest) |
| NFR-05 | Prefer columnar storage for large historical series |
| NFR-06 | Metadata and small transactional state should support concurrent readers |
| NFR-07 | No mandatory cloud dependency for Phase 1–7 |

## Explicit Non-Goals (Phase 0–2)

- Distributed cluster storage
- Real-time multi-node replication
- Guaranteed sub-millisecond tick store for HFT
- Replacing MetaTrader’s own history as the sole source of truth for broker time

## Capacity Assumptions (planning only, not guarantees)

Exact numbers are deferred to Benchmark. Planning envelopes:

- Symbols: tens to low hundreds (configurable)
- Timeframes: multiple (M1+ and higher)
- History: multi-year bars; ticks selectively
- Features: derived tables/files co-located or partitioned by symbol/timeframe

## Acceptance Criteria (for later implementation phases)

- [ ] Documented logical layout under `data/`, `state/`, `analytics/`
- [ ] Benchmark report comparing candidates under laptop constraints
- [ ] ADR locking the selected hybrid (or justified alternative)
- [ ] Sync state survives crash mid-backfill without silent corruption
