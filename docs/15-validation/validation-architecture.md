---
id: DOC-VAL-022
title: Validation Architecture
status: approved
version: 1.0
phase: 0
domain: 15-validation
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052']
---

# Validation Architecture

Promotion system — not a single score.

## Layers (where applicable)
Schema/data validity → Temporal correctness → Leakage → Baseline comparison → OOS → Embargo/purge → Nested validation → Walk-forward → Regime → Cost model → Slippage → Execution realism → Statistical uncertainty → Multiple-testing → Stress/adversarial → Deterministic replay → **Promotion gate**

## Baselines
no-skill; persistence/naive; simple statistical; simple trading rule where relevant.

## Calibration
Probabilistic outputs: discrimination + calibration quality (Brier, reliability curves, ECE, confidence-stratified rates).

No confidence may be treated as a probability without calibration evidence.
