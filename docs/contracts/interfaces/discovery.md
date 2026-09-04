---
id: DOC-CONTRACT-IF-discovery
title: Interface — DiscoveryEngine
status: reviewed
version: 0.5
phase: 0
domain: contracts
---

# DiscoveryEngine

## Methods
`run_search(grammar_version, budget, seed, family_id) -> DiscoveryCandidate[]`  
`cancel(run_id)` · `get_run(run_id)`

Enforces unit/type check, budgets, equivalence class assignment, multiplicity metadata. Does not emit Signals.
