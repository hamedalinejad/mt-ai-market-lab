---
id: DOC-MT5-011
title: Live Feed
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MT5-009, DOC-MT5-008]
related: [DOC-MT5-016, DOC-MT5-003, DOC-SYNC-001]
---

# Live Feed

## Purpose

Specify how the lab obtains **near-live** market data from MetaTrader 5 without assuming a full broker-grade streaming bus.

## Critical Constraint

The official **MetaTrader 5 Python package** exposes request/pull style APIs such as:

- `symbol_info_tick`
- `copy_rates_*` / rate range helpers
- `copy_ticks_*` / `copy_ticks_range`
- `market_book_*` (depth, when available)

This is **not** the same as an unbounded push “live stream” socket owned by our process. Therefore the lab must implement an explicit **Live Collector**.

## Live Collector (required component)

```text
┌─────────────────┐
│ Live Collector  │
│ (lab process)   │
└────────┬────────┘
         │ poll / schedule
         ▼
┌─────────────────┐
│ MT5 Python API  │
└────────┬────────┘
         │
         ▼
   Terminal / Server
```

### Responsibilities

1. Poll selected symbols at configured intervals (tick and/or bar close detection).
2. Detect new M1 (or tick) data since last cursor.
3. Hand batches to ingest → raw → quality → canonical.
4. Back off on errors; never mark sync complete on partial failure.
5. Expose health: last tick age, poll lag, error rate.

### Non-responsibilities

- Guaranteeing exchange-matching engine latency
- Replacing MT5 terminal networking
- Opening GUI charts (see Chart Management)

## Bar “live” semantics

For bars, “live” usually means:

- detect formation/close of the canonical base TF (default M1)
- optionally refresh still-open bar snapshot for UI/monitoring (not for irreversible labels)

Training labels should prefer **closed** bars unless experiment declares otherwise.

## Tick live semantics

- Periodic `symbol_info_tick` and/or ranged tick copy since last timestamp
- Deduplicate against canonical tick store
- Optional: Market Book polling as a separate stream (Phase backlog)

## Rules

- Live Collector configuration is Resource-aware (priority vs Discovery).
- Historical gaps after downtime are **Sync/Backfill**, not Live Collector.
- No Signal may depend on undocumented collector timing assumptions.

## Open Questions

- Optimal poll interval per asset class under laptop CPU budget
- Use of MT5 events via MQL5 bridge for lower latency (optional future)
