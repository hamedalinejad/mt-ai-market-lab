---
id: DOC-PRED-003
title: Confidence Calibration
status: reviewed
version: 0.5
phase: 0
domain: 12-prediction
updated: 2026-09-04
---

# Calibration Contract (BUG-AI-P0-009)

```text
raw_model_score → calibrated_probability → decision_score
```

## Binding fields
```text
calibration_method
calibration_dataset_separation   # must not leak into train labels improperly
calibration_refresh_frequency
calibration_acceptance_criteria
```

Uncalibrated scores must not solely drive Risk/Execution thresholds.
