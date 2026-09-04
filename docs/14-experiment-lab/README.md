---
id: DOC-EXPL-README
title: Experiment Lifecycle
status: approved
version: 1.0
phase: 0
domain: 14-experiment-lab
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-STOR-DATASET']
---

# Experiment Lifecycle

```text
Hypothesis → Dataset Snapshot → Experiment Specification → Deterministic Run
  → Baseline Comparison → Validation → Evidence Package → Candidate Decision → Knowledge Update
```

An experiment must **not** silently redefine dataset, target, feature set, or cost assumptions after seeing results.
