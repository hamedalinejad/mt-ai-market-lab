---
id: DOC-CONTRACT-IF-strategy
title: Interface — strategy
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: strategy

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `on_signal` | Signal | OrderIntent|None | — |
| `on_bar` | context | OrderIntent|None | — |

## Retry behavior
—

## Idempotency
intent client_order_id unique

## Timeout
—

## Concurrency
per strategy instance

## Transaction boundary
does not touch broker

## Observability
—

## Cancellation
—

## Versioning
strategy version

## Test double
NoopStrategy

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

