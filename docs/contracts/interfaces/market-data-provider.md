---
id: DOC-CONTRACT-IF-001
title: Interface — MarketDataProvider
status: draft
version: 0.3
phase: 0
domain: contracts
---

# MarketDataProvider

## Methods
- `list_instruments() -> Instrument[]`
- `get_candles(instrument_id, timeframe, from, to) -> Candle[]`
- `get_ticks(instrument_id, from, to) -> Tick[]`
- `get_quote(instrument_id) -> Quote`
- `health() -> ProviderHealth`

## Errors
retryable: timeout, disconnect | non_retryable: invalid symbol | recoverable: after reconnect

## Semantics
idempotent reads; no side effects on market; timeout per call; cancellation cooperative

## Test double
`FakeMarketDataProvider` / `ReplayProvider`
