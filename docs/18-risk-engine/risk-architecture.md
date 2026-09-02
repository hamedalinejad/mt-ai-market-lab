---
id: DOC-RISK-001
title: Risk Architecture
status: draft
version: 0.2
phase: 0
domain: 18-risk-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0009]
related: [DOC-STRAT-001, DOC-EXEC-001, DOC-RISK-013]
---

# Risk Architecture

## Purpose

Risk Engine is **independent of AI**. Even if the model says:

```text
BUY = 99%
```

Risk may respond:

```text
DENY
```

## Checks (non-exhaustive)

```text
Daily loss limit
Max drawdown
Correlation exposure
Causal cluster exposure
Spread
Slippage
Liquidity
News/event risk
Symbol risk
Model risk
Strategy risk
Execution risk
Portfolio / cluster exposure
```

## Outputs

```text
ALLOW | DENY | REDUCE | DELAY | HALT
```

## Rules

- Risk has **veto power** over Strategy intent.
- AI confidence is an input, never an override of Risk.
- Kill Switch / Emergency Stop can force HALT independently of AI.
- Thresholds are Configurable Risk Policy (not universal constants in Phase 0).
