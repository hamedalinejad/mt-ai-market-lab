---
id: DOC-STOR-012
title: Partitioning
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-STOR-014, DOC-STOR-009]
related: []
---

# Partitioning

## Purpose

Define partition keys for bulk market and feature data so that sync, live reads and research scans remain efficient on a laptop.

## Canonical Bars / Ticks

**Candidate layout:**

```text
data/canonical/symbol=<SYMBOL>/timeframe=<TF>/year=<YYYY>/month=<MM>/*.parquet
```

### Keys

| Key | Reason |
|-----|--------|
| symbol | Primary access path; isolation |
| timeframe | Independent series |
| year / month | Prune history; manage file size |

## Features

```text
data/features/feature_set=<id>/symbol=<SYMBOL>/timeframe=<TF>/year=<YYYY>/...
```

`feature_set` includes definition version.

## File Size Policy (Candidate)

- Target part size band (e.g. tens–hundreds of MB) — exact band from Benchmark.
- Avoid thousands of tiny files (compaction job).

## Rules

- Partition columns are also present inside files for self-description where practical.
- Renaming symbol strings does not change `instrument_id`; partitions may use symbol for path convenience with catalog mapping.
