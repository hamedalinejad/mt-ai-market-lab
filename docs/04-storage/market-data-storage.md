---
id: DOC-PATH-04-STORAGE-MARKET-DATA-STORAGE-MD
title: Market Data Storage
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-STOR-014, DOC-DATA-001]
related: [DOC-STOR-010, DOC-STOR-012, DOC-SYNC-001]
---

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

