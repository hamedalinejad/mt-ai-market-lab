---
id: DOC-SCHEMA-model-manifest
title: Model Artifact Manifest
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# Model Artifact Manifest

model_version, artifact_uri, feature_version, dataset_snapshot, metrics, checksum, status, parent_model

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

