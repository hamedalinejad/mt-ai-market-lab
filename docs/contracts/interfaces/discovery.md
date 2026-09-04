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

