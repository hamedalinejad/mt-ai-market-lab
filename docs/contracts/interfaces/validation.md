---
id: DOC-CONTRACT-IF-validation
title: Interface — validation
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: validation

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `run` | candidate_id,gate_set | ValidationReport | LeakageFailure,MissingMultiplicity |

## Retry behavior
infra errors retry; leakage failure not auto-retry

## Idempotency
report keyed by (candidate,gate_set,data_pins)

## Timeout
gate-dependent

## Concurrency
parallel gates if resource allows

## Transaction boundary
report append-only

## Observability
validation events via system/model catalogs

## Cancellation
supported

## Versioning
gate_set version

## Test double
AlwaysPassValidator (tests only)

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

