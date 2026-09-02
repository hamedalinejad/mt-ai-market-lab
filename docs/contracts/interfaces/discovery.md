---
id: DOC-CONTRACT-IF-discovery
title: Interface — DiscoveryEngine
status: reviewed
version: 0.3
phase: 0
domain: contracts
---

# DiscoveryEngine

## Methods
```text
run_search(space_version, budget, seed) -> DiscoveryCandidate[]
cancel(run_id)
get_run(run_id) -> SearchRun
```

## Budget
max_formulas, max_depth, max_runtime, max_memory, max_candidates

## Idempotency
same seed+space+data pins → same candidate set (deterministic mode)

## Test double
FixedCandidateDiscovery
