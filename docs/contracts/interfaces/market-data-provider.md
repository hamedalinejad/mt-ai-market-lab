---
id: DOC-CONTRACT-IF-001
title: MarketDataProvider Interface
status: draft
version: 0.2
phase: 0
domain: contracts
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-CONTRACT-001, ADR-0008]
related: [DOC-MT5-009]
---

# MarketDataProvider

## Purpose

Source-agnostic market data gateway. Domains consume **Canonical Market Schema**, never raw MT5 types.

## Implementations (candidates)

```text
MT5Provider
CSVProvider
ParquetProvider
ReplayProvider
FutureProvider
FakeMarketDataProvider   # tests
```

## Rule

Only the adapter/provider layer may call `mt5.copy_rates_*` / tick APIs. No other domain imports MetaTrader5 directly.
