---
id: DOC-SYNC-004
title: Gap Classification and Recovery
status: approved
version: 1.0
phase: 0
domain: 05-synchronization
created: 2026-09-04
updated: 2026-09-04
---

# Gap Detection and Recovery

## Classes (minimum)
```text
EXPECTED_CLOSED_SESSION
BROKER_SESSION_BOUNDARY
HOLIDAY / MARKET_CLOSURE
NATURAL_NO-TRADE_PERIOD
NETWORK_OR_TERMINAL_OUTAGE
MISSING_HISTORY
DATA_CORRUPTION
UNCLASSIFIED
```

Missing interval ≠ automatic data failure. Classification is evidence-based and source-aware.

## Sync state fields
```text
last_seen, last_persisted, first_available, expected_next,
status, gap_count, last_error, policy_versions, updated_at
```
Per `(instrument, timeframe, source)`.

## Cursor safety
Never advance `last_persisted` before canonical batch published successfully.

```text
BEGIN publish/bind → record success → advance cursor COMMIT
```

Crash must yield: old cursor + no visible batch **or** new cursor + fully visible batch — never silent intermediate.

## Reconnect
1 health 2 metadata 3 compare availability 4 backfill with **overlap** 5 dedupe 6 validate 7 publish 8 reconcile gaps 9 cursor.
