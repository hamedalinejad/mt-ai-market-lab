---
id: DOC-EXPL-003
title: Experiment Model
status: draft
version: 0.2
phase: 0
domain: 14-experiment-lab
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-EXPL-001]
related: [DOC-VAL-021, DOC-EXPL-011, DOC-KNOW-001]
---

# Experiment Model

## Purpose

An Experiment is a reproducible evaluation of a Hypothesis/Candidate with pinned data, code, and **cost** assumptions.

## Minimum Fields

```text
experiment_id
hypothesis_id
candidate_refs
dataset_version
feature_set_id / feature_definition_version
code_version
seed
metrics
cost_bundle_id          # spread/slippage/commission/swap/execution/latency versions
split_scheme_version
status
started_at / finished_at
```

## Rules

- Experiments without `cost_bundle_id` are non-comparable for trading claims.
- All runs are registered; selective reporting without registry is invalid.
