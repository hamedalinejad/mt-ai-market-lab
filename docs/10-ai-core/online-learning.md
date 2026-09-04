---
id: DOC-PATH-10-AI-CORE-ONLINE-LEARNING-MD
title: Online Learning
status: reviewed
version: 0.6
phase: 0
domain: 10-ai-core
updated: 2026-09-04
created: 2026-09-04
depends_on: []
related: []
---

# Online Learning Governance

Pipeline: Observation → Prediction → Outcome → Error → Candidate Update → Shadow → Validation → Promotion/Rollback  
Forbidden: `candle → model.update() → production`

## Catastrophic forgetting controls (BUG-AI-P0-007)
```text
replay_ratio
historical_sample_floor
recent_sample_floor
update_frequency
max_parameter_delta
rollback_threshold
```

## Online learning budget (BUG-AI-P0-008)
```text
max_updates_per_day
max_training_cpu_seconds
max_ram
max_candidate_promotions_per_day
max_model_changes_per_day
```

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

