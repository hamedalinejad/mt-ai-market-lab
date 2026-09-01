---
id: DOC-STOR-015
title: Storage Candidates
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-STOR-016, ADR-0004]
related: [DOC-STOR-014, DOC-STOR-017]
---

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
