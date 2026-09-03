---
id: DOC-AI-012
title: Online Learning
status: reviewed
version: 0.6
phase: 0
domain: 10-ai-core
updated: 2026-09-04
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
