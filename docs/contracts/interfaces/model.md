---
id: DOC-CONTRACT-IF-model
title: Model-Agnostic Interface
status: approved
version: 1.0
phase: 0
domain: contracts
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-050']
related: ['ADR-0003']
---

# AI Core — Model Contract

```text
fit(dataset, config) -> model_artifact
predict(model, features) -> prediction
score(model, dataset) -> evaluation
explain(model, observation) -> trace
```

Framework choice is subordinate to this interface and benchmarks.

## Lightweight-first (live path)
Prefer: classical statistics, tree models, linear/GLM, small ensembles, compact state-space/regime models.

Large deep-learning systems are **not** required for the first production path and must not be introduced for fashion alone.

## Model lifecycle
```text
DRAFT → TRAINED → EVALUATED → CANDIDATE → VALIDATED → SHADOW → CHAMPION → DEGRADED / RETIRED
```
Challenger does not replace champion without promotion gates.
