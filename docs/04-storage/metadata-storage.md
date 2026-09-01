---
id: DOC-STOR-010
title: Metadata Storage
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-STOR-014]
related: [DOC-STOR-009, DOC-SYNC-002, DOC-0003]
---

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
