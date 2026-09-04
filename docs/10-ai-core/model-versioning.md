---
id: DOC-PATH-10-AI-CORE-MODEL-VERSIONING-MD
title: Model Versioning
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-AI-001, ADR-0007]
related: [DOC-FEAT-001, DOC-VAL-015, DOC-LEARN-008]
---

# Model Versioning

## Purpose

Promoted and candidate models are **immutable artifacts**. Updates create a new version; they do not overwrite the old one in place.

## Layout (candidate)

```text
model/
├── model-000001/
├── model-000002/
├── model-000003/
```

Each `model-XXXXXX/` is a complete, self-describing snapshot.

## Required Metadata (per model version)

```text
training dataset          # dataset_id / manifest
feature version           # feature_set_id + feature_definition_version
code version              # git commit / package versions
hyperparameters
random seed
validation results        # gate outcomes, metrics, split ids
training period           # time range used to fit
symbols
timeframes
market regimes            # regimes present / conditioned on
parent model              # prior version id if derived / finetuned
model_id
model_version
created_at
status                    # candidate | shadow | promoted | retired
```

## Rules

- Production never mutates files inside a promoted `model-XXXXXX/` directory.
- Online learning writes only to **shadow/candidate** versions, then Promotion may select a new immutable id.
- Rollback = point live routing at a previous `model_version`, not edit weights in place.
- Reproducibility requires the full metadata set above; missing fields ⇒ non-promotable.

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

