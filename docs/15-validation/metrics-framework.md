---
id: DOC-VAL-012
title: Metrics Framework
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022]
related: [DOC-DISC-010, DOC-STRAT-001]
---

# Metrics Framework

## Metric families (select by Candidate type)

```text
Accuracy, Precision, Recall, F1, LogLoss, Brier, AUC
MAE, RMSE, Directional Accuracy, Calibration
Sharpe, Sortino, Calmar, Profit Factor, Expectancy
Max Drawdown, Turnover, Stability
```

Discovery/strategy must not optimize a single vanity metric in isolation.

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

