---
id: DOC-STOR-014
title: Storage Architecture
status: reviewed
version: 0.4
phase: 0
domain: 04-storage
updated: 2026-09-02
depends_on: [ADR-0004]
---

# Storage Architecture — Binding Boundaries

| Layer | Technology | Owns |
|-------|------------|------|
| **Control / metadata** | **SQLite** (WAL) | registries, sync_state, config pins, experiment index, event_log pointers |
| **Canonical historical** | **Parquet** | market bars/ticks partitions, feature matrices, dataset snapshots |
| **Analytics / research** | **DuckDB** | query engine over Parquet (+ attach SQLite); not primary write path for canonical |

## Rules
- DuckDB is not the system of record for canonical writes.
- SQLite is not the multi-year market data lake.
- Parquet partitions are immutable once published (new version / compaction = new files + manifest).
