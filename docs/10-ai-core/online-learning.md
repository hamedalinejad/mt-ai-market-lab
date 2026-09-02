---
id: DOC-AI-012
title: Online Learning
status: reviewed
version: 0.4
phase: 0
domain: 10-ai-core
---

# Online Learning Governance (binding)

## Pipeline
```text
Observation → Prediction → Outcome → Error
  → Candidate update → Shadow → Validation → Promotion / Rollback
```

## Forbidden
`new candle → model.update() → production`

## Policy parameters (versioned)
```text
minimum_sample
minimum_time
rollback_threshold
drift_threshold
update_frequency
learning_budget          # CPU/RAM/step size caps
```

Live path: light updates only; full retrain offline.
