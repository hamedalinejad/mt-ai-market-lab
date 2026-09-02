---
id: DOC-CONTRACT-IF-strategy
title: Interface — StrategyEngine
status: reviewed
version: 0.3
phase: 0
domain: contracts
---

# StrategyEngine

## Methods
```text
on_signal(signal) -> OrderIntent | None
on_bar(closed_bar_context) -> OrderIntent | None
validate_intent(intent) -> bool
```

## Rules
Never submits to broker; RiskEngine must evaluate intent.

## Test double
PassthroughStrategy / NoopStrategy
