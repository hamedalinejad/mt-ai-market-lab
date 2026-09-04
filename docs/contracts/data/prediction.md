---
id: DOC-CONTRACT-DATA-prediction
title: Prediction Contract
status: approved
version: 1.0
phase: 0
domain: contracts
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-CONTRACT-IF-model', 'DOC-CONTRACT-DATA-time']
---

# Prediction

Outputs may include direction probabilities, expected return/range/volatility, quantiles, confidence, calibration_status, decision_timestamp, horizon, model_version, feature_set_version.

Prediction is **immutable** once emitted; outcomes link separately.
