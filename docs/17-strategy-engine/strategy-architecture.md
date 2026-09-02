---
id: DOC-STRAT-001
title: Strategy Architecture
status: draft
version: 0.2
phase: 0
domain: 17-strategy-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-SIG-001, ADR-0009]
related: [DOC-RISK-001, DOC-EXEC-001, DOC-PRED-001]
---

# Strategy Architecture

## Purpose

Strategy **must not** trade a Prediction directly.

Forbidden:

```text
Prediction: 70% UP  →  BUY
```

Required path:

```text
Prediction
  ↓
Signal
  ↓
Strategy
  ↓
Risk
  ↓
Execution
```

## Strategy Contents

```text
Context
+ Entry
+ Exit
+ Stop
+ Take Profit
+ Sizing (proposal only; Risk may veto/reduce)
+ Filters
+ Invalidation
+ Lifecycle
```

## Rules

- Prediction is input evidence, not an order.
- Signal is input to Strategy; Strategy produces **intent**, not broker submission.
- Risk Engine has veto after Strategy intent.
- Execution is the only layer that submits orders (paper or live).
