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
