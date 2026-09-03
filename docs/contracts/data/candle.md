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
