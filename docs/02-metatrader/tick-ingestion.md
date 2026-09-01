---
id: DOC-MT5-016
title: Tick Ingestion
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MT5-011, DOC-DATA-024]
related: [DOC-STOR-009]
---

# Tick Ingestion

## Purpose

Path from MT5 tick APIs to canonical tick store.

## Sources

- Live: Live Collector polling / ranged copy since cursor
- Historical: `copy_ticks_range` (or equivalent) batches

## Pipeline

```text
MT5 tick API → Raw Tick Store → Normalize (UTC, instrument_id)
  → Quality (bid/ask, duplicates) → Canonical Tick Store → sync_state
```

## Rules

- Tick ingestion is optional per instrument (resource-aware).
- Canonical ticks never required for pure M1-based pipelines.
- Bar building from ticks uses versioned definition if used as source of truth for that instrument.
