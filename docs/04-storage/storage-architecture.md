---
id: DOC-STOR-014
title: Storage Architecture
status: approved
version: 0.5
phase: 0
domain: 04-storage
---

# Boundaries

SQLite = control plane · Parquet = canonical history · DuckDB = analytics

Lifecycle dirs: see [data-lifecycle-layout.md](data-lifecycle-layout.md)  
Revisions: see [revision-policy.md](revision-policy.md)

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/04-storage/storage-requirements.md -->

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


<!-- merged from docs/04-storage/storage-candidates.md -->

# Storage Candidates

## Purpose

List technology candidates and evaluation dimensions. **No final lock without Benchmark + ADR.**

## Preferred Hybrid Candidate

| Layer | Candidate | Role |
|-------|-----------|------|
| Metadata / state | SQLite + WAL | Instruments, sync, registries |
| Historical bulk | Parquet (partitioned) | Canonical bars/ticks, features, labels |
| Analytics | DuckDB | SQL over Parquet; optional SQLite attach |

### Why this hybrid

- Laptop-friendly, file-based, minimal ops.
- Columnar compression for multi-year bars.
- DuckDB pushdown on Parquet reduces RAM pressure vs loading full frames.
- Clear separation: transactional control plane vs append-oriented data plane.

### Risks

- Operational discipline required for partition manifests and atomic publish.
- Too many tiny Parquet files harm performance (compaction policy needed).
- User must not treat DuckDB as the only copy of data.

## Alternative Candidates (to benchmark)

| Area | Alternatives |
|------|----------------|
| Metadata | SQLite, LanceDB (if vector needs dominate — unlikely for Phase 1), pure JSON files (weak) |
| Bulk series | Parquet, Arrow IPC, HDF5, SQLite-only (discouraged for multi-year) |
| Analytics | DuckDB, Polars scan, Pandas (dev only), SQLite views over CSV (weak) |

## Evaluation Dimensions

1. Ingest throughput (bars/s, ticks/s) on laptop SSD
2. Range-query latency for 1 symbol × 1 year M1
3. Disk footprint after compression
4. Crash safety of sync cursor + last batch
5. Concurrent live read during backfill
6. Operational complexity

## Decision Path

```text
Requirements → Candidate List → Benchmark → Operational Fit → Resource Fit → Decision → ADR
```

See ADR-0004.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/04-storage/writer-policy.md -->

# Writer Policy

## SQLite

**Single-Writer** policy for state DB to avoid lock storms.

## DuckDB

Analytics must not become unbounded multi-writer against the same mutable DB; clear boundary vs ingestion/canonical writers.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/04-storage/metadata-storage.md -->

# Metadata Storage

## Purpose

Specify transactional storage for configuration-facing and control-plane state: instruments, sync cursors, registries, run metadata.

## Candidate Engine

**SQLite** in WAL mode at:

```text
state/market_lab.sqlite
```

Rationale: embedded, zero ops, good for laptop, concurrent readers with WAL, sufficient for control-plane scale.

## Logical Tables (minimum)

### instrument

Maps to Canonical Instrument model: `instrument_id`, `symbol`, `broker`, `asset_class`, precisions, contract fields, `metadata_version`, timestamps.

### sync_state

| Column | Purpose |
|--------|---------|
| instrument_id | |
| timeframe | or TICK |
| last_canonical_ts | Last successfully published timestamp |
| last_attempt_at | |
| last_success_at | |
| status | idle / backfilling / live / error |
| error_code | nullable |
| source | mt5 / import |

### sync_run

Audit of each sync execution: run_id, started_at, finished_at, stats, outcome.

### dataset_manifest

Frozen dataset id → list of partition URIs + schema version + code version + checksum.

### experiment_registry / hypothesis_registry

Lightweight indexes; large blobs may live under `data/experiments/`.

### knowledge_registry

Knowledge object id, version, status (CANDIDATE…RETIRED), paths to evidence.

### schema_version

Migrations for this SQLite file.

## Rules

- Market OHLCV bulk series do **not** live as SQLite rows for multi-year history.
- Sync cursor advance is transactional with respect to “batch published” flag.
- WAL enabled; backup via online backup API or consistent file copy under quiesce policy.
- DuckDB may **ATTACH** this database for joined analytics; SQLite remains source of truth for state.

## Failure Modes

- Partial migration → refuse startup until migrated or rolled back.
- Locked DB under long writer → readers still served in WAL; writers queue with timeout.

## Open Questions

- Single SQLite vs split (sync.db / research.db) for contention isolation

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/04-storage/feature-storage.md -->

# feature storage

## Purpose

Specification for **feature storage** within the 04-storage domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/04-storage/knowledge-storage.md -->

# knowledge storage

## Purpose

Specification for **knowledge storage** within the 04-storage domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/04-storage/experiment-storage.md -->

# experiment storage

## Purpose

Specification for **experiment storage** within the 04-storage domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/04-storage/market-data-storage.md -->

# Market Data Storage

## Purpose

Specify how **canonical** ticks and candles are stored, partitioned, and read for multi-year history on a laptop.

## Scope

Canonical market series only. Metadata/sync state → `metadata-storage.md`. Features → `feature-storage.md`.

## Canonical Identity

A market series row is identified by:

```text
(instrument_id, timeframe | tick, timestamp_utc)
```

- `instrument_id` is internal stable ID (not broker symbol string alone).
- `timestamp_utc` is the bar open time or tick event time in UTC.
- Timeframe for ticks is the sentinel `TICK` (logical).

## Partitioning Strategy (Candidate)

```text
data/canonical/symbol=<SYMBOL>/timeframe=<TF>/year=<YYYY>/month=<MM>/part-*.parquet
```

Optional finer grain (`day=`) for M1 or tick-heavy series after Benchmark.

### Why partition by symbol + timeframe

- Sync and live reads almost always target one series.
- Backfill and quality repair isolate blast radius.
- Discovery jobs can select subsets without full-lake scan.

## Candle Logical Schema (storage projection)

Aligned with Canonical Data Model (Master Blueprint §7):

| Field | Type (logical) | Notes |
|-------|----------------|-------|
| timestamp_utc | timestamp | Bar open, UTC |
| instrument_id | string/uuid | Internal |
| symbol | string | Denormalized for file self-description |
| timeframe | string | e.g. M1, M5, H1 |
| open, high, low, close | decimal/float64 | Price |
| tick_volume | int64 | |
| real_volume | int64 nullable | If available |
| spread | int/float nullable | |
| source | string | mt5 / import / ... |
| quality_status | enum | ok / suspect / gap_filled / rejected |
| ingestion_batch_id | string | Lineage |

Physical types and decimal precision are finalized with Instrument metadata (`price_precision`).

## Tick Logical Schema (storage projection)

| Field | Type (logical) | Notes |
|-------|----------------|-------|
| timestamp_utc | timestamp | Event time UTC |
| instrument_id | string/uuid | |
| bid, ask | decimal/float64 | |
| last | decimal/float64 nullable | |
| volume | float64 nullable | |
| flags | int/string nullable | |
| source | string | |
| source_timestamp | timestamp nullable | Broker/local source clock if present |
| ingestion_timestamp | timestamp | When we received it |

## Raw vs Canonical

| | Raw | Canonical |
|---|-----|-----------|
| Path | `data/raw/...` | `data/canonical/...` |
| Purpose | Audit, re-normalize | System interface |
| Dedup key | source-native | (instrument_id, tf, ts) |
| Mutable | Prefer append-only | Append / controlled rewrite on repair |

## Read Patterns

1. **Range read:** `[start_utc, end_utc)` for one symbol+timeframe.
2. **As-of latest:** last N bars for live features.
3. **Multi-symbol batch:** explicit list; no implicit full scan in live mode.

## Write Patterns

1. Append-only parquet parts under a staging directory, then atomic publish (manifest or directory swap).
2. Deduplicate on `(instrument_id, timeframe, timestamp_utc)` before publish.
3. Update `sync_state` in SQLite only after successful publish.

## Quality Hooks

Before canonical publish:

- monotonic timestamps within partition
- OHLC integrity (high >= max(o,c), low <= min(o,c), etc.)
- gap classification reference (see sync gap model)
- spread non-negative when present

## Rules

- Live path never reads `raw/` for signal generation.
- Training datasets must pin partition manifests + code version.
- Compression codec and row-group size are Benchmark parameters, not architecture truth.

## Open Questions

- Store mid price derived columns or compute on read?
- Separate “broker session calendar” table vs embed in quality layer

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

