---
id: DOC-FEAT-001
title: Feature Architecture
status: draft
version: 0.2
phase: 0
domain: 07-feature-engineering
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001, DOC-REPR-002]
related: [DOC-AI-014, DOC-FEAT-016]
---

# Feature Architecture

## Purpose

Features are versioned contracts. Changing an implementation (e.g. RSI) creates a **new feature version**; old models remain tied to the version they were trained on.

## Required Versioning

```text
feature_set_id
feature_definition_version
feature_parameters
```

Also recommended:

```text
feature_id
calculation_definition
source_features
code_version
dataset_version_fit_stats   # for normalization fitted on train only
```

## Why

If `RSI implementation` changes, the previous model is **not** exactly reproducible unless it still points at the old `feature_definition_version`.

## Rules

- Models store `feature_set_id` + `feature_definition_version` (+ parameters).
- In-place edits of a feature definition used by promoted models are forbidden; fork a new version.
- Feature selection and normalization stats are fit only on allowed prefixes (see Leakage Prevention).
- Causal / non-centered rolling only for promotable features.
