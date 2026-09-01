---
id: DOC-MT5-003
title: Bar Ingestion
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MT5-008, DOC-DATA-003, DOC-DATA-023]
related: [DOC-STOR-009]
---

# Bar Ingestion

## Purpose

Path from MT5 rates APIs to canonical candle store, respecting timeframe policy.

## Priority

1. Ingest **M1** (canonical base) for selected instruments
2. Ingest source-native higher TF only if policy exception applies
3. Materialize derived TF as configured (from M1), not by default from redundant MT5 pulls

## Pipeline

```text
MT5 rates API → Raw Bar Store → Normalize → Quality → Canonical Bars
  → update sync_state(instrument_id, timeframe)
```

## Rules

- Prefer one raw source of truth (M1) + derivation over N independent TF histories.
- When source-native higher TF is stored, keep `origin=source_native` and do not overwrite derived partitions without explicit job.
