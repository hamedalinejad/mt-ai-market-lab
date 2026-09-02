---
id: DOC-PRED-003
title: Confidence Calibration
status: reviewed
version: 0.3
phase: 0
domain: 12-prediction
---

# Calibration (binding)

```text
raw_model_score ≠ calibrated_probability
raw → calibrated_probability → decision_score
```

## Required policy fields
```text
method              # e.g. Platt / isotonic / binning — chosen per model family
training_window
holdout
recalibration_trigger
drift_detection     # link to calibration drift
```

Uncalibrated scores must not drive Risk/Execution thresholds alone.
