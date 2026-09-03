---
id: DOC-VAL-013
title: Leakage Prevention
status: reviewed
version: 0.4
phase: 0
domain: 15-validation
---

# Leakage Prevention — Enforcement Path

Narrative rules remain binding. Implementation must expose:

| Layer | Mechanism |
|-------|-----------|
| **Automated tests** | contract/replay tests for decision_point & availability |
| **Static lint** | ban centered rolling / full-sample norm in promotable feature defs |
| **Runtime assertions** | feature_snapshot.availability ≤ decision time; label not observable early |

Leakage failure = hard-fail for Promotion.
