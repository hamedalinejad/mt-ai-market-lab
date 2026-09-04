---
id: DOC-PATH-14-EXPERIMENT-LAB-EXPERIMENT-MODEL-MD
title: Experiment Model
status: reviewed
version: 0.4
phase: 0
domain: 14-experiment-lab
updated: 2026-09-03
---

# Experiment Run (binding IDs)

Every run records:

```text
experiment_id
hypothesis_id
dataset_snapshot_id
feature_set_id
model_id
config_version
code_version
seed
hardware_profile
cost_bundle_id
status
started_at / finished_at
```

## Failures
`status=failed` experiments are **retained** (never deleted). Outcomes and error payloads stay in registry for learning and audit.
