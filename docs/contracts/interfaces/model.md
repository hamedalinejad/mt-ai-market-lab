---
id: DOC-CONTRACT-IF-model
title: Interface — Model Registry & Runtime
status: reviewed
version: 0.3
phase: 0
domain: contracts
---

# Model Registry / Runtime

## Methods
```text
list_models()
get_active_model(slot?)
promote_model(version)
rollback_model(to_version)
retire_model(version)
compare_models(a, b)
load(version) / unload()
predict(feature_snapshot) -> Prediction
```

## Errors
ModelNotFound, FeatureVersionMismatch, PromotionDenied

## Idempotency
promote/rollback recorded once per transition event

## Test double
StubModelAdapter returning fixed Prediction
