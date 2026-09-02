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
related: [DOC-AI-014, DOC-FEAT-001, DOC-VAL-021]
---

# Reproducibility

## Required Pins

```text
dataset_version
feature_definition_version
code_version
seed
cost_bundle_id
model_version (if inference under test)
timezone/session policy versions
```

Same pins ⇒ comparable rerun.
