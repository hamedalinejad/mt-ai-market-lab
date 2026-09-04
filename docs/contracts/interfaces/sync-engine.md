---
id: DOC-CONTRACT-IF-sync-engine
title: Interface — sync-engine
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: sync-engine

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `load_state` | — | SyncState[] | StorageError |
| `save_state` | SyncState | void | StorageError |
| `plan` | instrument_id,timeframe,goal | SyncPlan | InvalidRange |
| `backfill` | SyncPlan | SyncResult | ProviderTimeout,StorageError |
| `reconcile` | instrument_id,timeframe,from,to | ReconcileResult | Conflict |
| `detect_gaps` | instrument_id,timeframe,from,to | Gap[] | — |

## Retry behavior
transport retryable; corrupt → quarantine non-retry loop

## Idempotency
backfill/reconcile safe to retry; upsert by logical identity

## Timeout
per-batch

## Concurrency
single writer per sync_state key

## Transaction boundary
download→validate→publish→commit→advance cursor only

## Observability
SYNC_STARTED/FINISHED/FAILED, DATA_GAP

## Cancellation
between batches

## Versioning
policy_versions on state

## Test double
FakeSyncEngine

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

