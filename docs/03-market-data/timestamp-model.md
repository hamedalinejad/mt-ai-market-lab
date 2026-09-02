---
id: DOC-DATA-022
title: Timestamp Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001, DOC-MT5-004]
related: [DOC-DATA-025, DOC-DATA-018, DOC-DATA-003]
---

# Timestamp Model

## Purpose

Define a multi-clock timestamp contract. **UTC alone is insufficient** for market correctness.

## Problem

Candle boundaries, session membership, and gap classification depend on:

- broker server clock
- DST transitions
- weekend / holiday closures
- session opens/closes
- daily bar boundary rules

Storing only a single `datetime` labeled “UTC” loses audit information and can mis-align D1/W1 boundaries relative to the terminal.

## Required Timestamp Fields (logical)

| Field | Meaning |
|-------|---------|
| `source_timestamp` | Timestamp as provided by source (MT5/broker), in source interpretation |
| `source_timezone` | Timezone or offset policy that applies to `source_timestamp` (or “broker server zone”) |
| `broker_server_time` | Broker/terminal server time associated with the event when available |
| `utc_timestamp` | Normalized instant on the UTC timeline (canonical for ordering and storage keys) |
| `trading_session_date` | Session-oriented date label used for session logic (policy-defined) |
| `market_date` | Calendar/market date used for daily boundary and reporting (policy-defined) |
| `ingestion_timestamp` | When the lab received/persisted the event (lab clock, UTC) |

Not every row carries every field; **canonical bars/ticks always carry `utc_timestamp`**. Source clocks are mandatory on **raw** rows and retained on canonical when available.

## Ordering Key

Canonical series order and identity use:

```text
(instrument_id, timeframe, utc_timestamp)
```

## Conversion Rules

1. Adapter records source fields without discarding them.
2. Normalization produces `utc_timestamp` via documented broker-time policy (`broker-time.md`, `timezone-policy.md`).
3. If conversion is ambiguous (missing zone, DST fold), mark `quality_status=suspect` and record conversion flags in lineage.
4. `market_date` / `trading_session_date` are **derived labels**, not substitutes for `utc_timestamp`.

## Rules

- Downstream models must not assume “UTC midnight == D1 boundary” for forex brokers.
- Training datasets pin the timezone/session policy version used to build bars.
