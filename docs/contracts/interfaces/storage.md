---
id: DOC-CONTRACT-IF-storage
title: Interface — storage
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: storage

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `put_raw` | batch | void | StorageFull,Locked |
| `put_canonical` | batch | void | ValidationError,StorageFull |
| `get_range` | query | rows | — |
| `publish_batch` | staging_id | manifest | AtomicPublishError |
| `quarantine_put` | batch,reason | void | — |
| `manifest_write/read` | manifest | — | — |

## Retry behavior
locked → backoff; disk full → Safe Mode stop

## Idempotency
canonical upsert by logical identity

## Timeout
IO timeouts configured

## Concurrency
SQLite single-writer; Parquet publish atomic

## Transaction boundary
staging→validate→checksum→publish→manifest/sync_state

## Observability
DATA_PUBLISHED

## Cancellation
abort staging job

## Versioning
schema_version in manifest

## Test double
MemoryStorage

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

