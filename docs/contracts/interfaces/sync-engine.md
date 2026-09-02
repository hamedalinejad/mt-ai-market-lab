---
id: DOC-CONTRACT-IF-sync-engine
title: Interface — SyncEngine
status: draft
version: 0.2
phase: 0
domain: contracts
---

# Interface: SyncEngine

## Methods

| Method | Notes |
|--------|-------|
| load_state | read sync_state |
| plan | ranges from gaps/cursors |
| run_backfill | batch publish |
| run_reconcile | compare/repair |
| advance_cursor | only after durable ok |

## Idempotency

Overlapping ranges safe (dedupe on identity).

## Errors

transport → retry/backoff; integrity → quarantine; disk full → stop/Safe Mode
