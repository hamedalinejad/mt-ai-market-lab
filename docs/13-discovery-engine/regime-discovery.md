---
id: DOC-DISC-015
title: Regime Discovery
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-001, DOC-REPR-010]
related: [DOC-ANLY-009]
---

# Regime Discovery

## Core regimes (examples)

```text
Trend | Range | High Vol | Low Vol
High Liquidity | Low Liquidity | Event | Transition
```

Models and strategies should condition on `current_regime` when available.

## Regime Transition Detection

Many strategies fail in transitions. Compute/track:

```text
regime transition probability
```

as a first-class analysis/discovery output (Candidate until validated).
