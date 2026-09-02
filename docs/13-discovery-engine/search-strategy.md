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
related: [DOC-DISC-013, DOC-RES-009]
---

# Search Strategy

## Budgets (per run)

```text
max formulas / run
max depth
max operators
max runtime
max memory
max candidates
max experiments
```

## Cache

Previously evaluated expressions (e.g. `abs(return_5)/volatility_20`) are not re-evaluated blindly.

## Algebraic equivalence

```text
A/B  vs  A * inverse(B)
```

normalize and treat as one discovery when equivalent under the registered algebra rules.
