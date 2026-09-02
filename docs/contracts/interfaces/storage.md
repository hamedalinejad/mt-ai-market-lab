---
id: DOC-CONTRACT-IF-storage
title: Interface — Storage
status: reviewed
version: 0.3
phase: 0
domain: contracts
---

# Storage

## Methods
| Method | Notes |
|--------|-------|
| put_raw(batch) | durable raw |
| put_canonical(batch) | after quality; idempotent by logical identity |
| get_range(identity_query) | ordered |
| exists(logical_id) | |
| begin/commit/rollback | SQLite tx; single-writer |
| checkpoint | WAL checkpoint policy |

## Errors
StorageFull (fatal→Safe Mode), StorageLocked (backoff), CorruptObject (quarantine)

## Idempotency
put_canonical upsert on logical identity

## Test double
MemoryStorage / TempDirStorage
