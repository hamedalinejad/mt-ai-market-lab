---
id: ADR-0004
title: Storage Selection by Benchmark
status: draft
version: 0.2
phase: 0
domain: decisions
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-STOR-016, DOC-STOR-014, DOC-STOR-015]
related: [DOC-STOR-009, DOC-STOR-010]
---

# ADR-0004: Storage Selection by Benchmark

## Context

`mt-ai-market-lab` must hold multi-year market history, live sync state, features and experiment metadata on a **consumer laptop**. Choosing a single technology for all roles is a common failure mode.

## Problem

How do we select storage technologies without locking the architecture to hype, while still giving Phase 0 a concrete design direction?

## Options

1. **SQLite-only** for everything including multi-year OHLCV.
2. **Parquet-only** files without a transactional state store.
3. **Hybrid:** SQLite (metadata/state) + Parquet (bulk series) + DuckDB (analytics).
4. Defer any direction until after first code.

## Decision

1. **Process decision (binding):** No storage technology is Architecture Truth until Requirements → Candidates → Benchmark → ADR Decision.
2. **Design direction (candidate, not yet locked):** Prefer the **Hybrid** option for planning and Specification:
   - SQLite + WAL → metadata, sync cursors, registries
   - Partitioned Parquet → canonical bars/ticks, features, labels
   - DuckDB → research/backtest SQL over Parquet; optional attach of SQLite
3. **Anti-decision:** SQLite alone **must not** be the market data lake for multi-year series.

## Rationale

- Matches laptop resource envelope and operational simplicity.
- Separates transactional control plane from append-oriented data plane.
- DuckDB can query Parquet efficiently and join metadata without a separate warehouse server.
- Aligns with Documentation First: contracts and layout are specified now; engines measured next.

## Trade-offs

| Pro | Con |
|-----|-----|
| Clear role separation | More moving parts than SQLite-only |
| Columnar compression | Need compaction / manifest discipline |
| Strong analytics story | Benchmark still required to lock codecs and partition grain |

## Consequences

- Specs in `docs/04-storage/*` and `docs/03-market-data/*` describe hybrid layout under `data/`, `state/`, `analytics/`.
- Implementation phases must run Benchmark before declaring storage “done”.
- A superseding ADR is required to lock versions, codecs, and exact schemas if hybrid is confirmed—or to choose an alternative with evidence.

## Status

draft — **direction preferred; technology not locked**
