---
id: DOC-SYNC-009
title: Reconciliation
status: draft
version: 0.2
phase: 0
domain: 05-synchronization
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-SYNC-013, DOC-SYNC-004, DOC-DATA-003]
related: [DOC-SYNC-002, DOC-SYNC-014, DOC-SYNC-007]
---

# Reconciliation

## Purpose

Sync is **not** only “download missing rows.” Reconciliation compares source and local state, classifies differences, repairs, and verifies.

## Pipeline

```text
Source snapshot / range
        ↓
Local canonical range
        ↓
Compare
        ↓
Detect difference
        ↓
Classify
        ↓
Repair
        ↓
Verify
```

## Difference Types

| Type | Description |
|------|-------------|
| missing_local | Source has bar/tick; local does not |
| missing_source | Local has point; source range lacks it (rare; investigate) |
| ohlc_conflict | **Same `utc_timestamp` (and instrument/tf), different OHLC/volume** |
| field_conflict | Same identity; secondary fields differ (spread, volume) |
| quality_conflict | Local rejected/suspect vs source ok |
| duplicate_local | Multiple local rows for one identity |

### OHLC conflict (critical)

```text
same timestamp + different OHLC
```

Must be detected. Default handling:

1. Mark local row `quality_status` appropriately / quarantine partition segment
2. Record conflict evidence (source values vs local values)
3. Repair policy: prefer re-fetch source and replace if source trusted; never silent overwrite without audit
4. Re-verify range checksum or row hashes

## Compare Strategy

1. Select range `[from_utc, to_utc)` for `(instrument_id, timeframe)`.
2. Fetch source bars/ticks (or sample checkpoints for huge ranges).
3. Join on identity key.
4. Emit difference set.
5. Classify each difference (gap class / conflict class).
6. Apply repair actions transactionally with sync_run audit.
7. Verify: re-compare sample or full range; advance cursors only if clean.

## When to Run

- Startup (checkpoint + recent window)
- After backfill batch
- Periodic low-priority full-range (resource-aware)
- On operator demand
- After detected clock/policy change

## Rules

- Reconciliation results are persisted (run id, counts, examples).
- Expected market-closure gaps are not “missing_local” repairs.
- Derived TF partitions are reconciled against **derivation definition**, or against source-native series if `origin=source_native`.
