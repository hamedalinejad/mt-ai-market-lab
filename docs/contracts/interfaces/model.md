---
id: DOC-CONTRACT-IF-model
title: Interface — Model Registry & Runtime
status: reviewed
version: 0.4
phase: 0
domain: contracts
---

# Model Registry & Runtime

## Registry fields
model_id, version, parent_model, status, artifact_uri, dataset_snapshot, feature_version, config_version, training_run, validation_run, metrics, created_at, promoted_at, retired_at

## States
CANDIDATE | VALIDATED | SHADOW | CHAMPION | DEGRADED | RETIRED | REJECTED

## Methods
list_models, get_champion, promote, rollback, retire, compare, load, predict

## Roles
Predictor uses load/predict only. Learner proposes candidate versions. Discoverer does not write registry champion.
