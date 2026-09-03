---
id: DOC-VAL-022
title: Validation Architecture
status: reviewed
version: 0.4
phase: 0
domain: 15-validation
---

# Validation Pipeline (binding)

```text
Train
 → Validation
 → OOS
 → Walk Forward
 → Regime Validation
 → Cost Model
 → Slippage
 → Replay
 → Stress
 → Adversarial
 → Promotion Gate
```

Gate sets may subset stages by artifact type; search-origin candidates cannot skip multiplicity / leakage controls.
