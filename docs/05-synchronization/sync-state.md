---
id: DOC-SYNC-013
title: Sync State
status: reviewed
version: 0.4
phase: 0
domain: 05-synchronization
---

# Sync State Schema (binding)

## Table `sync_state`
```text
instrument_id
timeframe
source
last_seen          # last observed from provider
last_persisted     # durable canonical watermark
first_available
expected_next
status             # uninitialized|idle|backfilling|live|error|…
gap_count
last_error
policy_versions    # timezone/session/tf policy ids
updated_at
```
PK: `(instrument_id, timeframe, source)`

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

