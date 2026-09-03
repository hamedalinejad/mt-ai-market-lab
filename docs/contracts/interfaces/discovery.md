---
id: DOC-CONTRACT-IF-discovery
title: Interface — discovery
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: discovery

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `run_search` | space_version,budget,seed,family_id | DiscoveryCandidate[] | BudgetExceeded |
| `cancel` | run_id | void | — |
| `get_run` | run_id | SearchRun | NotFound |

## Retry behavior
OOM → fail run non-silent

## Idempotency
deterministic mode: same pins → same candidates

## Timeout
max_runtime enforced

## Concurrency
budgeted workers; Live vs Research isolation

## Transaction boundary
candidates persisted with run metadata

## Observability
DISCOVERY_CREATED, DISCOVERY_REJECTED

## Cancellation
cancel(run_id)

## Versioning
space_version required

## Test double
FixedCandidateDiscovery
