---
id: DOC-CONTRACT-DATA-candle
title: Data Contract — Candle
status: reviewed
version: 0.7
phase: 0
domain: contracts
---

# Candle

## Purpose
Canonical OHLCV bar.

## Identity
`(instrument_id, timeframe, open_time_utc)`

## Required
open_time_utc, close_time_utc, instrument_id, timeframe, open, high, low, close, quality_status, origin, source, ingestion_batch_id

## Optional
tick_volume, real_volume, volume_type, spread, availability_time_utc, processing_time_utc

## Invariants
high>=open,close,low; low<=open,close,high; close_time_utc>open_time_utc; origin in {source_native,derived}

## Examples
Valid OHLC. Invalid high<low.

## Compatibility policy
As global contracts policy.

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

