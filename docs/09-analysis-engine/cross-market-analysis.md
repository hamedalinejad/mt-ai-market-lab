---
id: DOC-ANLY-003
title: Cross-Market Analysis
status: draft
version: 0.2
phase: 0
domain: 09-analysis-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-REPR-001]
related: [DOC-DISC-016, DOC-VAL-013, DOC-MT5-014, ADR-0010]
---

# Cross-Market Analysis

## Purpose

Do not treat each symbol in isolation when multi-asset context is enabled.

## Example Universe Families

```text
EURUSD, GBPUSD, USDJPY
DXY
Gold, Oil
Indices
Rates
Crypto
```

## Use

Cross-market features, regime context, correlation inputs for Risk — as analysis/Candidate inputs, not automatic truth.

## Leakage Control (mandatory)

- Feature at time `t` for symbol A may only use data of B with availability ≤ decision point of A.
- Point-in-time universe membership for multi-symbol evaluation.

## Rules

- Discovery domain: Cross-Market Discovery under Discovery Space.
- Risk cluster/correlation exposure remains independent of AI confidence.
