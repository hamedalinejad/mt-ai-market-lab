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
related: [DOC-PRED-002, DOC-PRED-007, DOC-SIG-001]
---

# Prediction Architecture

## Purpose

Prediction is a **probabilistic estimate**, not a decision. It must not collapse to a single hard `next_price`.

## Preferred Target Families

```text
Direction
Return
Price
Range
Volatility
Probability
Quantiles
Scenario
Next Candle
Multi-Candle Path
```

Prefer:

```text
P(up), P(down), P(flat)
```

over a lone point:

```text
next_price = 1.2345
```

Point forecasts, when present, should come with uncertainty (intervals, quantiles, or variance).

## Required Companion Fields

- Probability / confidence / uncertainty  
- Model version  
- Feature snapshot id  
- Evaluation context / decision point  

## Rules

- Prediction ≠ Signal ≠ Order  
- Multi-horizon outputs are first-class when the model provides them  
