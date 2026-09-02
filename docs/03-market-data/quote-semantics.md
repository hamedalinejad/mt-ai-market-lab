---
id: DOC-DATA-026
title: Quote Semantics
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-DATA-024]
related: [DOC-DATA-007]
---

# Quote Semantics

## Bid / Ask

- `bid` and `ask` are distinct; mid is derived when needed: `(bid+ask)/2` with explicit policy for missing side.
- **Consistency:** prefer `ask >= bid`; violations → quality flag / quarantine (data anomaly), not silent accept.

## Tick flags

Source flags (if provided by MT5/broker) preserved on raw ticks: trade vs quote, buy/sell aggressor when available, etc.

## Ordering

Canonical order by `(instrument_id, utc_timestamp, sequence/tick_id)`. Out-of-order arrivals buffered/reconciled; never assume network order equals market order.
