---
id: DOC-CONTRACT-IF-model
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
