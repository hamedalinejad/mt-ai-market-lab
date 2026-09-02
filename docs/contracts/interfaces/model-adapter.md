---
id: DOC-CONTRACT-IF-002
title: Interface — ModelAdapter
status: draft
version: 0.2
phase: 0
domain: contracts
---

# ModelAdapter

## Methods
- `predict(feature_snapshot) -> Prediction`
- `load(model_version) / unload()`
- `health() -> ModelHealth`

## Errors
ModelNotFound, IncompatibleFeatureVersion, InferenceError
