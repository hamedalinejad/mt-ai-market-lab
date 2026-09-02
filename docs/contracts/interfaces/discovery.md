---
id: DOC-CONTRACT-IF-discovery
title: Interface — DiscoveryEngine
status: reviewed
version: 0.4
phase: 0
domain: contracts
---

# DiscoveryEngine

## Methods
`run_search(space_version, budget, seed, family_id) -> DiscoveryCandidate[]`  
`cancel(run_id)` · `get_run(run_id)`

## Budget enforced
max_runtime, max_memory, max_candidates, max_depth, max_nodes, max_experiments

## Determinism
same seed + space + data pins → same candidates (deterministic mode)
