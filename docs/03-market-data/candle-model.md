---
id: DOC-DATA-003
title: Candle Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001, DOC-DATA-022]
related: [DOC-DATA-024, DOC-DATA-023, DOC-REPR-002]
---

# Candle Model

## Purpose

Canonical OHLCV (+ quality) bars independent of the tick store.

## Core Fields

```text
instrument_id, timeframe, utc_timestamp
open, high, low, close
volume / tick_volume (as available)
quality_status, origin (source_native | derived)
```

## Relationship to Ticks

- May be sourced from MT5 rates or derived from ticks (definition versioned).
- Tick dataset is **not** deleted after bar build.

## Tiering

```text
Warm: Recent bars (hot path for live)
Cold: Historical bars in Parquet partitions
```

## Rules

- Identity: `(instrument_id, timeframe, utc_timestamp)`
- OHLC invariants; zero-range handled explicitly
