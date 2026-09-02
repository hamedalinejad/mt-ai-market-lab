---
id: DOC-AI-006
title: Ensemble
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-AI-011]
related: [DOC-VAL-022]
---

# Ensemble

## Dynamic weighting (direction)

Specialists (trend, momentum, volatility, pattern, microstructure, discovery, …) weighted by:

```text
recent OOS performance, regime performance, calibration, confidence, stability
```

## Constraint

Weight updates are themselves **validated** (shadow / holdout) — dynamic weights must not freely overfit.
