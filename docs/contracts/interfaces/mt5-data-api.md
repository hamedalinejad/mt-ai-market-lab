---
id: DOC-CONTRACT-IF-mt5-api
title: Interface — MT5 Data API Map
status: reviewed
version: 0.2
phase: 0
domain: contracts
---

# MT5 Data API Contract (adapter-internal)

| Concern | MT5 surface (ref) | Adapter method | Errors |
|---------|-------------------|----------------|--------|
| rates | copy_rates_* | get_candles | timeout, empty, invalid tf |
| ticks | copy_ticks_* | get_ticks | timeout, empty |
| symbol info | symbol_info | get_instrument / refresh_metadata | not found |
| orders | orders_get / order_send | via ExecutionAdapter | reject, timeout |
| positions | positions_get | get_positions | disconnect |
| deals | history_deals_get | get_deals | range invalid |

Error map: retryable (timeout, disconnect) vs non-retryable (invalid symbol, unsupported).
Signatures return Canonical types, never raw MT5 tuples to callers outside adapter.
