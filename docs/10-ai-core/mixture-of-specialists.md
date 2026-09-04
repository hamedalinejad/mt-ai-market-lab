---
id: DOC-AI-011
title: Mixture of Specialists
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0011, DOC-AI-001]
related: [DOC-REPR-010, DOC-PRED-001]
---

# Mixture of Specialists

## Purpose

AI Core must **not** be a single monolithic model. On a typical laptop, a large neural network is **not** the default direction.

## Preferred Architecture

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

## Example Specialists

```text
Trend Specialist
Range Specialist
Momentum Specialist
Mean-Reversion Specialist
Volatility Specialist
Cross-Market Specialist
Regime Transition Specialist
```

## Router

```text
Market State
     ↓
Regime
     ↓
Specialist Weights
     ↓
Ensemble / Decision Evidence
```

## Rules

- Specialists are lightweight and independently versioned.
- New specialists follow the same lifecycle: Candidate → Validation → Promotion / Retirement.
- Gating produces **evidence for forecast**, not a direct order.
- Model family remains candidate until Benchmark (ADR-0003 / ADR-0004 style governance).

## Non-Goals (default laptop profile)

- Single large end-to-end neural net as the only production model
- Unbounded ensemble size

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

