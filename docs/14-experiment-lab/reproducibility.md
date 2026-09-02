---
id: DOC-EXPL-011
title: Reproducibility
status: draft
version: 0.2
phase: 0
domain: 14-experiment-lab
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-EXPL-003]
related: [DOC-AI-014, DOC-FEAT-001, DOC-VAL-021, DOC-CFG-001]
---

# Reproducibility

## Required Experiment Pins

```text
experiment_id
dataset_version
data_snapshot
feature_version
model_version
code_version
config_version
random_seed
hardware_profile
timestamp
cost_bundle_id
```

Missing pins ⇒ non-comparable / non-promotable for trading claims.
