---
id: DOC-STOR-014
title: Storage Architecture
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0004]
related: [DOC-DATA-024, DOC-DATA-003, DOC-RES-009]
---

# Storage Architecture

## Hybrid (direction)

```text
SQLite  → metadata, sync_state, registry, experiments
Parquet → historical market / features / datasets
DuckDB  → analytics over Parquet (+ SQLite attach)
```

## Layout (candidate)

```text
data/
├── raw/{ticks,bars}/
├── canonical/{symbol}/...
├── features/
├── labels/
├── datasets/
├── experiments/
└── archive/

state/market_lab.sqlite
analytics/market_lab.duckdb
```

## Tiering

```text
Hot:  Recent ticks
Warm: Recent bars
Cold: Historical compressed ticks + historical bars
```

## Rules

- Tick and candle canonical series are independent.
- Retention and compression policies are Resource-profile aware.
