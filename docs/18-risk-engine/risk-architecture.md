---
id: DOC-RISK-001
title: Risk Authority
status: approved
version: 1.0
phase: 0
domain: 18-risk-engine
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052']
related: ['DOC-SAFE-003']
---

# Risk Authority

Final decision authority before execution:

```text
Prediction → Signal → Strategy → Risk → Execution
```

## Outcomes
```text
ALLOW | REDUCE | DENY | HALT
```

## Hard safety principles
- Risk is independent of model confidence.
- Risk-service failure is **fail-safe** (DENY/HALT).
- Missing `risk_decision_id` blocks execution.
- Stale risk decisions are invalid.
- Conflicting risk inputs default to the **safer** outcome.
- Kill switch operates independently of AI behavior.

## Risk dimensions
per-trade exposure; aggregate exposure; correlated exposure; drawdown; daily/weekly loss limits; volatility regime; execution liquidity/cost; data quality; model health; discovery instability; broker/account state.

Numeric thresholds are **configurable policies**, not universal truths.

## Acceptance Criteria

```text
AC-RISK-01
Given model confidence=0.99 and a hard loss limit breached
When Risk evaluates
Then outcome is DENY or HALT

AC-RISK-02
Given Risk service unavailable
When execution is requested
Then path fails closed (no ALLOW)

AC-RISK-03
Given missing risk_decision_id on intent
When submit is attempted
Then execution is blocked
```
