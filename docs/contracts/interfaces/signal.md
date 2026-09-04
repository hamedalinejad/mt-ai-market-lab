---
id: DOC-CONTRACT-IF-signal
title: Interface — signal
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: signal

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `propose` | inputs | Signal | InvalidTrace |
| `confirm/expire/resolve/fail` | signal_id | Signal | NotFound |

## Retry behavior
n/a for propose pure

## Idempotency
dedupe fingerprint

## Timeout
—

## Concurrency
per instrument ordering

## Transaction boundary
status transitions explicit

## Observability
SIGNAL_CREATED

## Cancellation
—

## Versioning
signal schema_version

## Test double
RecordingSignalEngine

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

