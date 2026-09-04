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

