---
id: DOC-DATA-003
title: Candle Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-DATA-001, DOC-DATA-025]
related: [DOC-STOR-009, DOC-REPR-002]
---

# Candle Model

## Purpose

Formalize the canonical **Candle / Bar** contract after ingestion.

## Identity

```text
(instrument_id, timeframe, timestamp_utc)
```

`timestamp_utc` = bar **open** time in UTC.

## Fields

| Field | Required | Description |
|-------|----------|-------------|
| timestamp_utc | yes | Open time UTC |
| instrument_id | yes | Internal instrument key |
| timeframe | yes | Canonical timeframe code |
| open | yes | |
| high | yes | |
| low | yes | |
| close | yes | |
| tick_volume | yes | Broker tick volume |
| real_volume | no | If available |
| spread | no | Representative spread for bar if provided |
| source | yes | mt5, import, … |
| quality_status | yes | ok \| suspect \| gap_filled \| rejected |
| schema_version | yes | Contract version |

## Invariants

1. `high >= max(open, close)` and `high >= low`
2. `low <= min(open, close)`
3. `timestamp_utc` aligned to timeframe grid per session policy (documented exceptions for gaps)
4. Prices quantized to instrument `price_precision`

## Quality Status

| Status | Meaning |
|--------|---------|
| ok | Passed validation |
| suspect | Anomaly flags; usable with caution |
| gap_filled | Synthetic or interpolated — **must not** train as native without flag |
| rejected | Must not enter analysis |

## Storage Projection

See `docs/04-storage/market-data-storage.md` (Parquet partitions candidate).

## Rules

- No consumer may invent OHLC from incomplete ticks without recording method in lineage.
- Resampling from lower timeframes is a **derived** process with its own definition version.
