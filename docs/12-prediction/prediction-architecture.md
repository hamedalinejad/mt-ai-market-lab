---
id: DOC-PRED-001
title: Prediction Architecture
status: draft
version: 0.2
phase: 0
domain: 12-prediction
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-AI-001]
related: [DOC-SIG-001, DOC-SIG-012]
---

# Prediction Architecture

## Purpose

Prediction is probabilistic estimate + **evidence**, not a mystical claim.

## Targets

```text
Direction, Return, Price, Range, Volatility
Probability, Quantiles, Scenario, Next Candle, Multi-Candle Path
```

Prefer `P(up), P(down), P(flat)` over a lone hard price.

## Evidence-Based Explainability

Not:

```text
AI thinks price will go up
```

But:

```text
Prediction:
  UP = 0.74

Evidence:
  - Trend state = bullish
  - Volatility = expanding
  - Pattern = candidate P-019
  - Momentum = positive
  - Cross-timeframe alignment = 4/5
  - Model ensemble agreement = 0.81
```

Evidence is structured, versioned, and attachable to Signal Trace.

## Rules

- Prediction ≠ Decision
- Companion fields: uncertainty, model version, feature snapshot, decision point
