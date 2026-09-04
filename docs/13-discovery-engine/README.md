---
id: DOC-DISC-README
title: Discovery Engine
status: approved
version: 1.0
phase: 0
domain: 13-discovery-engine
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052']
---

# Discovery Engine

Constrained search — not uncontrolled creativity.

## Search dimensions
features, transformations, windows, lags, thresholds, sequence patterns,
cross-TF/cross-symbol relations, volatility/regime conditions, formulas,
symbolic expressions, strategy structures.

## Search budget (required per run)
```text
max candidates, max wall time, max CPU, max memory,
max expression depth, max validation attempts, max repeated-equivalent hypotheses
```

## Formula safety
Discovered formulas are **data**, not trusted code. Restricted expression language / sandbox:
permitted operators only; no FS/network; no arbitrary imports; bounded recursion; timeout; memory bound; deterministic evaluation.

## Complexity objective (conceptual)
```text
utility = predictive_value - cost - instability - complexity - multiplicity
```
Weights live in a **versioned discovery policy**.
