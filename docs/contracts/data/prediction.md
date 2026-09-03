---
id: DOC-CONTRACT-DATA-prediction
title: Data Contract — Prediction
status: reviewed
version: 0.8
phase: 0
domain: contracts
updated: 2026-09-04
---

# Multi-dimensional Prediction (BUG-AI-P0-004)

Not “next price only”. Recommended outputs:

```text
direction_probability
expected_return
expected_price_change
expected_range
expected_volatility
quantiles
confidence
calibration_status
decision_timestamp
horizon
model_version
feature_set_version
```

## Immutability (BUG-AI-P0-005)
A written Prediction is **immutable**. Outcomes are separate objects linked by `prediction_id` — never mutate the prediction row to store outcomes.
