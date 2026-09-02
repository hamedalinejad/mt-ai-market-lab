---
id: DOC-AI-001
title: AI Architecture
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0003, ADR-0011]
related: [DOC-AI-011, DOC-AI-012, DOC-PRED-001]
---

# AI Architecture

## Purpose

Model-agnostic AI Core with **Mixture of Specialists** as the preferred topology for laptop deployment.

## Preferred Topology

```text
                Market State
                     │
          ┌──────────┼──────────┐
          ▼          ▼          ▼
      Trend       Momentum    Volatility
      Expert       Expert       Expert
          │          │          │
          └──────────┼──────────┘
                     ▼
              Meta / Gating
                     │
                     ▼
              Final Forecast
```

## Responsibilities

- Training / Inference
- Model selection, versioning, monitoring
- Ensemble / specialist gating
- Uncertainty
- Rollback / Retirement
- Governance (no blind production updates)

## Model Families (candidates only)

- Classical statistical
- Tree-based
- Linear / generalized linear
- Online / incremental (shadow-governed)
- Regime models
- Lightweight ensembles

No algorithm is Architecture Truth before Benchmark.
