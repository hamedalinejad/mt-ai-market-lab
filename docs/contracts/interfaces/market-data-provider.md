---
id: DOC-CONTRACT-IF-001
title: Interface — MarketDataProvider
status: draft
version: 0.2
phase: 0
domain: contracts
---

# Interface: MarketDataProvider

## Methods (logical)

| Method | Input | Output | Idempotent |
|--------|-------|--------|------------|
| list_instruments | filter? | Instrument[] | yes |
| get_instrument | id/name | Instrument | yes |
| get_bars | instrument, tf, range | Candle[] | yes |
| get_ticks | instrument, range | Tick[] | yes |
| get_last_quote | instrument | Quote | yes |
| health | — | Health | yes |

## Errors

retryable: connection timeout; non_retryable: invalid symbol; fatal: auth broken

## Concurrency

Thread-safe read; writers only inside adapter connection policy.

## Timeout / Cancellation

All IO methods accept timeout; long range fetches cancellable.

## Test double

`FakeMarketDataProvider`, `ReplayProvider`
