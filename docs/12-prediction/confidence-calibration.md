---
id: DOC-PRED-003
title: Confidence Calibration
status: draft
version: 0.2
phase: 0
domain: 12-prediction
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-PRED-001]
related: [DOC-SIG-003]
---

# Confidence Calibration

## Problem

Raw `confidence = 0.90` is not trustworthy unless checked against realized success rate.

If all 0.80 predictions succeed only 56% of the time, confidence is miscalibrated.

## Pipeline

```text
raw_model_score → calibrated_probability → decision_score
```

## Rules

- Calibration curves/metrics (e.g. reliability, Brier) are part of Validation.
- Decision layers consume calibrated scores by default, not raw logits alone.
