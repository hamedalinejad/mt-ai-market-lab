---
id: DOC-PATH-CONTRACTS-INTERFACES-MODEL-MD
title: Interface — model
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: model

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `list_models` | — | ModelMeta[] | — |
| `get_champion` | slot? | ModelMeta | NotFound |
| `promote` | version | void | PromotionDenied |
| `rollback` | to_version | void | NotFound |
| `retire` | version | void | — |
| `load` | version | void | IncompatibleFeature |
| `predict` | FeatureSnapshot | Prediction | InferenceError |

## Retry behavior
load failure retry limited; promote non-retry without new validation

## Idempotency
promote/rollback once per transition event

## Timeout
predict latency budget from resource profile

## Concurrency
champion read concurrent; promote single-flight

## Transaction boundary
registry row update atomic with event

## Observability
MODEL_LOADED, MODEL_PROMOTED, MODEL_ROLLBACK

## Cancellation
predict cancel cooperative

## Versioning
model_version immutable artifact

## Test double
StubModelAdapter

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

