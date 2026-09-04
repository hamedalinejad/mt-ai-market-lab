---
id: DOC-VAL-MERGED-001
title: validation
status: reviewed
phase: 0
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# validation


<!-- merged from docs/15-validation/walk-forward.md -->

# Walk-Forward

## Purpose

Evaluate stability across sequential train→test windows without peeking.

## Requirements

- Fold scheme versioned
- No feature from future folds
- Aggregation of fold metrics with dispersion, not only mean
- Interaction with regime labels when available

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


<!-- merged from docs/15-validation/transaction-costs.md -->

# Transaction Costs

## Purpose

Every backtest, experiment, and paper evaluation **must** bind explicit cost assumptions. Results without cost model versions are **not comparable**.

## Required Cost Bundle (versioned)

```text
spread_model_version
slippage_model_version
commission_model
swap_model
execution_assumptions
latency_assumptions
```

## Binding

Each **Dataset** used for economic evaluation and each **Experiment** run records the full cost bundle id/version in its manifest.

```text
dataset_manifest.cost_bundle_id
experiment_run.cost_bundle_id
```

Changing any component requires a **new cost_bundle version**; prior results remain tied to the old bundle.

## Rules

- No promotional claim from a backtest missing cost bundle metadata.
- Paper and Live evaluation report realized costs against the same model family where applicable.
- Slippage is dynamic (see execution slippage handling), not a fixed constant alone.

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


<!-- merged from docs/15-validation/forward-testing.md -->

# forward testing

## Purpose

Specification for **forward testing** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/candidate-validation.md -->

# candidate validation

## Purpose

Specification for **candidate validation** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/metrics-framework.md -->

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


<!-- merged from docs/15-validation/slippage-model.md -->

# slippage model

## Purpose

Specification for **slippage model** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/validation-philosophy.md -->

# Validation Philosophy

## Principles

1. **Validation Before Promotion**
2. **Candidates from large searches are guilty of snooping until corrected**
3. **Economic realism** (cost, slippage) before any trading claim
4. **Reject is a success mode** — saves capital and knowledge pollution
5. **No guarantee of true discovery** — only controlled error rates and evidence quality

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


<!-- merged from docs/15-validation/robustness-testing.md -->

# robustness testing

## Purpose

Specification for **robustness testing** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/adversarial-validation.md -->

# Adversarial Validation

## Purpose

Actively try to break the Candidate before Promotion.

## Attack families (candidates)

- Parameter perturbation  
- Time window shift  
- Regime stress  
- Bootstrap / resampling  
- Noise injection  
- Feature removal  
- Alternate splits  
- Cost/slippage stress  
- Symbol / timeframe transfer  

## Rules

- Soft Candidates that fail adversarial suite do not Promote.
- Attacks and outcomes are logged for audit.

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


<!-- merged from docs/15-validation/train-validation-test.md -->

# train validation test

## Purpose

Specification for **train validation test** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/replay-testing.md -->

# replay testing

## Purpose

Specification for **replay testing** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/anti-overfitting.md -->

# Anti-Overfitting

## Purpose

Counteract complexity-driven and search-driven overfit.

## Mechanisms

1. Complexity caps at Discovery time  
2. Penalized discovery_score  
3. Strict train/search vs eval separation  
4. Walk-forward  
5. Multiple-testing corrections  
6. Adversarial / perturbation tests  
7. Regime stability requirements  
8. Deflated metrics / PBO where applicable  

## Rules

- High in-sample fitness with high complexity is a **reject signal**, not a trophy.

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


<!-- merged from docs/15-validation/historical-validation.md -->

# historical validation

## Purpose

Specification for **historical validation** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/backtesting.md -->

# Backtesting

## Two engines

| Engine | Role |
|--------|------|
| **Vectorized** | Fast Discovery screening |
| **Event-driven replay** | Final Validation (spread, slippage, latency, partial fill, stop, TP) |

Vectorized alone is insufficient for promotion of trading Claims.

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


<!-- merged from docs/15-validation/replay-engine.md -->

# Replay Engine

## Capability

```text
Replay from timestamp T
```

Reconstruct Live-like behavior on historical data for debug, training evaluation, validation, paper.

## Deterministic Replay

```text
same dataset + config + model + seed  →  same result
```

Required for audit and experiment comparability.

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


<!-- merged from docs/15-validation/sensitivity-testing.md -->

# sensitivity testing

## Purpose

Specification for **sensitivity testing** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/out-of-sample.md -->

# Out-of-Sample

## Purpose

Hold out data not used for search or fitting.

## Rules

- Search/Discovery must not touch final holdout.
- Nested design: inner optimization vs outer OOS.
- Report OOS with multiplicity context when Candidate was search-selected.

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


<!-- merged from docs/15-validation/regime-validation.md -->

# regime validation

## Purpose

Specification for **regime validation** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/statistical-validation.md -->

# statistical validation

## Purpose

Specification for **statistical validation** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/spread-model.md -->

# spread model

## Purpose

Specification for **spread model** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/15-validation/paper-trading-validation.md -->

# paper trading validation

## Purpose

Specification for **paper trading validation** within the 15-validation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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

