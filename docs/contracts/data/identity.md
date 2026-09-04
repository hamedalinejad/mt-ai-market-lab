---
id: DOC-CONTRACT-DATA-identity
title: Logical vs Source Identity
status: approved
version: 0.3
phase: 0
domain: contracts
updated: 2026-09-04
---

# Identity Layers (BUG-P0-012)

## Logical identity (canonical series)
```text
(instrument_id, timeframe?, event_time_utc [, sequence])
```

## Source identity (independent)
```text
source_id
source_kind          # mt5 | csv | parquet | replay | …
broker
server
feed
account_context
schema_version
retrieved_at
```
Plus source symbol / source timestamps as applicable.

## Why
Two brokers may disagree on EURUSD prints. Logical series is lab truth after quality; source identity preserves provenance and multi-broker coexistence.

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

