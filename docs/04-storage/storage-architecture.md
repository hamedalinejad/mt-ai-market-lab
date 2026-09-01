---
id: DOC-STOR-014
title: Storage Architecture
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-STOR-016, ADR-0004]
related: [DOC-STOR-015, DOC-STOR-009, DOC-STOR-010, DOC-SYNC-001]
---

# Storage Architecture

## Purpose

Specify the **logical** storage architecture for `mt-ai-market-lab`: separation of raw vs canonical data, metadata vs bulk series, and analytics access patterns suitable for a laptop.

## Design Principles

1. **Logical separation before physical choice** — contracts first; engines second (ADR-0004).
2. **Raw ≠ Canonical** — broker/source payloads are retained separately from normalized models.
3. **Metadata is transactional; market history is append-oriented columnar.**
4. **Analytics must not own the source of truth** — query engines attach/read; they do not replace canonical stores.
5. **Idempotent sync** — re-running backfill must not duplicate canonical rows.

## High-Level Data Flow

```text
                 ┌──────────────────┐
                 │   MetaTrader 5   │
                 └────────┬─────────┘
                          │
             ┌────────────┴────────────┐
             │                         │
          Ticks                      Bars
             │                         │
             ▼                         ▼
      ┌──────────────┐        ┌──────────────┐
      │ Raw Tick     │        │ Raw OHLCV    │
      │ Store        │        │ Store        │
      └──────┬───────┘        └──────┬───────┘
             │                       │
             └───────────┬───────────┘
                         ▼
                 Data Normalization
                         │
                         ▼
                  Data Quality Layer
                         │
                         ▼
                  Canonical Dataset
                         │
           ┌─────────────┼─────────────┐
           ▼             ▼             ▼
       Features      Indicators     Labels
           │             │             │
           └─────────────┼─────────────┘
                         ▼
                  AI / Discovery
```

External Parquet/CSV imports join at **Normalization → Quality → Canonical** so that downstream interfaces do not depend on source type.

## Logical Store Classes

| Store class | Responsibility | Typical access |
|-------------|----------------|----------------|
| Raw Tick Store | Source ticks as received | Write-heavy ingest; rare full scan |
| Raw Bar Store | Source OHLCV as received | Write-heavy ingest; repair/audit |
| Canonical Market Store | Normalized Tick/Candle by instrument+timeframe | Time-range reads; sync; features |
| Feature Store | Derived features versioned | Training / inference snapshots |
| Label / Target Store | Outcome labels for supervised tasks | Experiment reproducibility |
| Metadata / State DB | Symbols, sync cursors, registries, config | Transactional R/W |
| Experiment / Knowledge Store | Hypotheses, runs, knowledge lifecycle | Research governance |
| Analytics Engine | Ad-hoc SQL over Parquet + metadata | Research, backtest exploration |
| Archive | Cold partitions | Restore on demand |

## Candidate Physical Mapping (Hybrid — preferred direction)

This mapping is a **strong candidate**, not a locked decision until Benchmark + ADR update:

| Logical class | Candidate technology |
|---------------|----------------------|
| Metadata / State / Registries | Embedded SQLite (WAL mode) |
| Historical canonical bars/ticks, features, labels | Partitioned Parquet files |
| Analytics / research / backtest queries | DuckDB (query Parquet; optional attach SQLite) |
| Model artifacts | Versioned local directories |

Rationale (summary):

- SQLite fits small transactional state and sync cursors on a laptop.
- Parquet fits multi-year columnar history with compression and partition pruning.
- DuckDB can query Parquet with projection/filter pushdown and can attach SQLite for joined metadata queries — without requiring a separate heavyweight warehouse process.

**SQLite alone must not be the entire market data lake.**

## Repository Layout (logical paths)

```text
data/
├── raw/
│   ├── ticks/
│   │   └── source=<mt5|import>/symbol=<SYM>/...
│   └── bars/
│       └── source=<mt5|import>/symbol=<SYM>/timeframe=<TF>/...
│
├── canonical/
│   └── symbol=<SYM>/
│       ├── timeframe=M1/
│       ├── timeframe=M5/
│       ├── timeframe=M15/
│       └── ...
│
├── features/
│   └── feature_set=<id>/symbol=<SYM>/timeframe=<TF>/...
│
├── labels/
├── datasets/          # frozen training/eval dataset manifests + data
├── experiments/       # optional large experiment outputs
└── archive/

state/
└── market_lab.sqlite  # metadata, sync state, registries

analytics/
└── market_lab.duckdb  # optional persistent DuckDB catalog / views
```

Partition keys and filename conventions are specified in `partitioning.md` and `market-data-storage.md`.

## Write Paths

1. **Live ingest:** MT5 adapter → raw append → normalize → quality gates → canonical append → update sync cursor (transactional in state DB).
2. **Historical backfill:** same pipeline in batches; cursor advances only after batch validation.
3. **External import:** schema map → normalize → quality → canonical (provenance recorded).

## Read Paths

1. **Live analysis:** canonical recent windows (+ in-memory cache policy).
2. **Training / discovery:** DuckDB or columnar readers over Parquet partitions + dataset manifests.
3. **Audit:** raw + lineage tables in state DB.

## Failure Modes

| Failure | Required behavior |
|---------|-------------------|
| Crash mid-batch write | No partial canonical commit visible; cursor unchanged or marked in-progress |
| Disk full | Fail write loudly; do not mark sync complete |
| Corrupt Parquet footer | Isolate partition; do not silently skip into training |
| State DB locked | Retry with backoff; never dual-write conflicting cursors |

## Rules

- Canonical schema is the only interface for Analysis / AI / Discovery.
- Raw data is never deleted solely because canonical exists (retention policy separate).
- Every canonical partition carries `source`, `quality_status`, and lineage references.
- Technology lock requires ADR after measured Benchmark on target laptop class.

## Open Questions

- Tick retention policy (full history vs rolling window vs on-demand)
- Exact Parquet row-group and compression defaults (Benchmark)
- Whether DuckDB file is mandatory or ephemeral sessions only
