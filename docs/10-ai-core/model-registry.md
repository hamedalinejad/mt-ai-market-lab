---
id: DOC-AI-015
title: Model Registry
status: reviewed
version: 0.5
phase: 0
domain: 10-ai-core
updated: 2026-09-04
---

# Model Artifact Reproducibility (BUG-AI-P0-002)

`model_version` alone is insufficient. Every artifact **must** reference:

```text
dataset_snapshot_id
feature_set_id
label_definition_id
code_version
config_version
policy_version
random_seed
library_environment_hash
training_window
validation_window
```

Plus: model_id, parent_model, status, artifact_uri, metrics, created_at, promoted_at, retired_at.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

