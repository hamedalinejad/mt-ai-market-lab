---
id: DOC-FEAT-016
title: Feature Selection
status: draft
version: 0.2
phase: 0
domain: 07-feature-engineering
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-FEAT-001, DOC-VAL-013]
related: [DOC-FEAT-015]
---

# Feature Selection

## Redundancy before heavy training

```text
correlation | mutual information | stability | importance | redundancy
```

## Time-aware selection (mandatory)

Forbidden:

```text
full dataset → feature selection → train/test
```

Required: selection **inside each training window** (nested), never using future test folds.
