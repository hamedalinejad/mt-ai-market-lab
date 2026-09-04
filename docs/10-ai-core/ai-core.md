---
id: DOC-AI-MERGED-001
title: ai-core
status: reviewed
phase: 0
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# ai-core


<!-- merged from docs/10-ai-core/ai-architecture.md -->

# AI Architecture

AI consumes **Market State / Feature Set**, not MT5/CSV/Parquet source details. Source-agnostic by contract.

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


<!-- merged from docs/10-ai-core/ai-objectives.md -->

# ai objectives

## Purpose

Specification for **ai objectives** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/incremental-learning.md -->

# incremental learning

## Purpose

Specification for **incremental learning** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/model-selection.md -->

# model selection

## Purpose

Specification for **model selection** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/model-types.md -->

# model types

## Purpose

Specification for **model types** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/mixture-of-specialists.md -->

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


<!-- merged from docs/10-ai-core/ensemble-models.md -->

# ensemble models

## Purpose

Specification for **ensemble models** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/continual-learning.md -->

# continual learning

## Purpose

Specification for **continual learning** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/model-abstraction.md -->

# model abstraction

## Purpose

Specification for **model abstraction** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/offline-training.md -->

# offline training

## Purpose

Specification for **offline training** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/model-monitoring.md -->

# model monitoring

## Purpose

Specification for **model monitoring** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/training-architecture.md -->

# training architecture

## Purpose

Specification for **training architecture** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/model-versioning.md -->

# Model Versioning

## Purpose

Promoted and candidate models are **immutable artifacts**. Updates create a new version; they do not overwrite the old one in place.

## Layout (candidate)

```text
model/
├── model-000001/
├── model-000002/
├── model-000003/
```

Each `model-XXXXXX/` is a complete, self-describing snapshot.

## Required Metadata (per model version)

```text
training dataset          # dataset_id / manifest
feature version           # feature_set_id + feature_definition_version
code version              # git commit / package versions
hyperparameters
random seed
validation results        # gate outcomes, metrics, split ids
training period           # time range used to fit
symbols
timeframes
market regimes            # regimes present / conditioned on
parent model              # prior version id if derived / finetuned
model_id
model_version
created_at
status                    # candidate | shadow | promoted | retired
```

## Rules

- Production never mutates files inside a promoted `model-XXXXXX/` directory.
- Online learning writes only to **shadow/candidate** versions, then Promotion may select a new immutable id.
- Rollback = point live routing at a previous `model_version`, not edit weights in place.
- Reproducibility requires the full metadata set above; missing fields ⇒ non-promotable.

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


<!-- merged from docs/10-ai-core/inference-architecture.md -->

# inference architecture

## Purpose

Specification for **inference architecture** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/model-governance.md -->

# model governance

## Purpose

Specification for **model governance** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/model-retirement.md -->

# model retirement

## Purpose

Specification for **model retirement** within the 10-ai-core domain.

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


<!-- merged from docs/10-ai-core/ensemble.md -->

# Ensemble

## Dynamic weighting (direction)

Specialists (trend, momentum, volatility, pattern, microstructure, discovery, …) weighted by:

```text
recent OOS performance, regime performance, calibration, confidence, stability
```

## Constraint

Weight updates are themselves **validated** (shadow / holdout) — dynamic weights must not freely overfit.

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

