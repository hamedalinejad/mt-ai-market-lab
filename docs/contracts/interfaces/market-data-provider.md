---
id: DOC-CONTRACT-IF-market-data-provider
title: Interface — market-data-provider
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: market-data-provider

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `list_instruments` | — | Instrument[] | ProviderError |
| `get_candles` | instrument_id,timeframe,from,to | Candle[] | Timeout,Empty,InvalidTF |
| `get_ticks` | instrument_id,from,to | Tick[] | Timeout,Empty |
| `get_quote` | instrument_id | Quote | NotFound |
| `health` | — | ProviderHealth | — |

## Retry behavior
timeout/disconnect retryable with backoff; invalid symbol non-retryable

## Idempotency
all reads idempotent

## Timeout
per-call timeout required

## Concurrency
thread-safe reads; no shared mutable cursor without lock

## Transaction boundary
none (read-only)

## Observability
emit DATA_RECEIVED on batches

## Cancellation
cooperative cancel between pages

## Versioning
returns canonical schema_version

## Test double
FakeMarketDataProvider, ReplayProvider
