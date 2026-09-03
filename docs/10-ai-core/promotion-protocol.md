---
id: DOC-AI-018
title: Promotion Protocol Gates
status: reviewed
version: 0.2
phase: 0
domain: 10-ai-core
updated: 2026-09-04
---

# Promotion Protocol — numeric gates (BUG-AI-P0-001)

Pipeline remains:
Observation → Prediction → Outcome → Error → Candidate Update → Shadow → Validation → Promotion/Rollback

## Binding gate parameters (versioned policy)
```text
minimum_evaluation_sample
confidence_interval_requirement
primary_metric
guardrail_metrics[]
max_degradation
calibration_threshold
latency_threshold
drift_threshold
regime_coverage_min
```

Missing any gate in policy_version ⇒ promotion denied. Numbers filled after Benchmark; structure mandatory.
