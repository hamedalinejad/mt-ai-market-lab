---
id: DOC-DISC-017
title: Search Strategy
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-006]
related: [DOC-DISC-010, DOC-DISC-020, DOC-DISC-009]
---

# Search Strategy

## Purpose

Govern how the Discovery Space is explored under budget.

## Budgets (must be explicit per run)

- Max Candidates evaluated
- Max wall time / CPU
- Max expression complexity
- Hypothesis family id (for multiple-testing accounting)

## Complexity Limits

Hard caps required, for example dimensions:

- max terms
- max conditions
- max nesting depth
- max distinct inputs

Preventing:

```text
1000 terms / 200 conditions / 17 nested operations
```

from being legal search outputs by default.

## Algorithms

- Enumerative / random search (bounded)
- Symbolic regression solvers
- Genetic programming
- Hybrid

Each run records algorithm id + hyperparameters + seed.
