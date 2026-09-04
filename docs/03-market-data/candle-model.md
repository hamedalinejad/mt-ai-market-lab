---
id: DOC-PATH-03-MARKET-DATA-CANDLE-MODEL-MD
title: Candle Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001, DOC-DATA-022]
related: [DOC-DATA-007, DOC-DATA-024, DOC-DATA-023]
---

# Candle Model

## Core Fields

```text
instrument_id, timeframe, utc_timestamp
open, high, low, close
volume / tick_volume (as available)
quality_status, origin (source_native | derived)
```

## OHLC Invariants (formal)

For every valid candle:

```text
High >= Open
High >= Close
High >= Low

Low  <= Open
Low  <= Close
Low  <= High

range = high - low >= 0
body  = abs(close - open)
```

Additional logical constraints:

```text
upper_wick = high - max(open, close) >= 0
lower_wick = min(open, close) - low >= 0
```

Violation ⇒ fail OHLC Validation; do not publish as `quality_status=ok`.

## Identity

```text
(instrument_id, timeframe, utc_timestamp)
```

with source lineage retained on raw rows.

## Independence from ticks

Tick and candle stores are independent; ticks are not discarded after bar build.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

