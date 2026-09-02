---
id: DOC-PRED-002
title: Direction Prediction
status: draft
version: 0.2
phase: 0
domain: 12-prediction
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-PRED-001]
related: [DOC-PRED-007]
---

# Direction Prediction

## Preferred form

```text
P(up), P(down), P(flat)
```

not only a hard class label.

## Rules

- Hard label, if emitted, is a thresholded summary of probabilities.
- Calibration and confidence are part of evaluation, not optional extras.
