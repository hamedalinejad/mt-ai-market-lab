---
id: DOC-CONTRACT-IF-sync-engine
title: Interface — SyncEngine
status: reviewed
version: 0.3
phase: 0
domain: contracts
---

# SyncEngine

## Methods
| Method | Input | Output |
|--------|-------|--------|
| load_state | — | SyncState[] |
| save_state | SyncState | void |
| plan | instrument_id, timeframe, goal | SyncPlan |
| backfill | SyncPlan | SyncResult |
| live_tick | optional | void (collector coord) |
| reconcile | instrument_id, timeframe, from, to | ReconcileResult |
| detect_gaps | instrument_id, timeframe, from, to | Gap[] |

## Errors
SyncError, StorageError, ProviderTimeout (retryable), InvalidRange (non-retryable)

## Idempotency
backfill/reconcile safe to retry; canonical identity upsert

## Concurrency
single writer for state rows per key; plans concurrent read-only

## Timeout / cancel
per-batch timeout; cooperative cancel between batches

## Test double
FakeSyncEngine with in-memory state
