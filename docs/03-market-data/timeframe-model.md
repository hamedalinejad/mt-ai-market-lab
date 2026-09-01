---
id: DOC-DATA-023
title: Timeframe Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-DATA-001, DOC-STOR-009]
related: [DOC-DATA-003, DOC-MT5-003, DOC-SYNC-001]
---

# Timeframe Model

## Purpose

Define which timeframes are **stored as source-native series**, which are **derived from a canonical base**, and how conflicts with broker/MT5 history are handled.

## Problem

Storing every timeframe independently from MT5:

```text
M1, M5, M15, M30, H1, H4, D1, W1, MN1
```

without policy causes:

- redundant disk and sync cost
- inconsistent OHLC across TFs when sessions/gaps differ
- unclear lineage (“which series is truth?”)

## Decision Direction (Phase 0)

### Canonical base series (stored)

| Series | Role |
|--------|------|
| **TICK** (optional, selective symbols) | Highest resolution when needed |
| **M1** | Default **canonical bar base** for most symbols |

Higher timeframes are **preferentially derived** from M1 (or from ticks when ticks are the chosen base for that instrument).

### Derived timeframes (default)

```text
M5, M15, M30, H1, H4, D1, W1, MN1, …
```

Built by a **deterministic aggregation** definition (versioned):

- bar open aligned to timeframe grid in the chosen session calendar
- OHLC aggregation rules fixed in `calculation_definition`
- volume aggregation rules fixed (sum tick_volume, etc.)

Derived series may be **materialized** (written to Parquet) or **computed on read**. Materialization policy is a Benchmark + Resource decision; lineage must always record `derived_from` + definition version.

### Exception: Source-Native bars

When **any** of the following holds, the system **may** store MT5/broker native bars for that timeframe:

1. Broker session boundaries make derived bars differ from terminal charts in a way that matters for validation against MT5 UI.
2. Historical depth available on a higher TF exceeds what can be reconstructed from local M1 (MT5 often retains longer D1 than full M1).
3. Operator explicitly configures `source_native_timeframes` for a symbol.
4. Derivation is impossible (no continuous lower TF coverage).

Source-native series are marked:

```text
origin = source_native | derived
source = mt5 | …
```

## Policy Summary

```text
Default:
  Store: TICK? (selective), M1
  Derive: M5+ from M1 (or ticks)

Exception:
  Store source-native higher TF when depth/session/explicit config requires it
```

## Canonical Timeframe Codes

Logical codes (storage and APIs):

```text
TICK, M1, M2, M3, M4, M5, M6, M10, M12, M15, M20, M30,
H1, H2, H3, H4, H6, H8, H12, D1, W1, MN1
```

Mapping from MT5 timeframe enums is the responsibility of the MT5 adapter.

## Aggregation Contract (minimum)

For bars derived from a lower TF:

1. Input series and definition version are part of lineage.
2. Output `timestamp_utc` = open of the higher TF bucket in UTC after session rules.
3. `high` / `low` are max/min of contributing bars; `open`/`close` from first/last contributing bar in bucket.
4. Empty buckets during market close are **gaps**, not zero bars (unless policy says otherwise for a specific asset class).

## Rules

- Live Analysis may use derived or native series; Training datasets must record which.
- Never silently mix native and derived bars in one partition without `origin` discrimination.
- Discovery Features that depend on TF alignment must declare required `origin`.

## Open Questions

- Default materialize list for Phase 1 (e.g. materialize H1/D1 only)
- Per-asset-class overrides (crypto 24/7 vs forex sessions)
