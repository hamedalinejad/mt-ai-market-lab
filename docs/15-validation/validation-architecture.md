---
id: DOC-VAL-022
title: Validation Architecture
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MASTER-001, ADR-0005]
related: [DOC-VAL-001, DOC-VAL-014, DOC-VAL-003]
---

# Validation Architecture

## Purpose

Turn Validation from a folder of names into a **gated pipeline**. File existence ≠ engine design.

## Normative Pipeline

```text
Candidate
   ↓
Training split evaluation (fit / calibrate only as allowed)
   ↓
Validation split
   ↓
Test / Holdout
   ↓
Walk-Forward
   ↓
Regime Test
   ↓
Stress Test
   ↓
Cost Test
   ↓
Slippage Test
   ↓
Monte Carlo / resampling (as applicable)
   ↓
Adversarial Validation
   ↓
Paper Trading gate (when trading-relevant)
   ↓
Promotion decision (or reject / needs more evidence)
```

Not every Candidate type requires every stage at full depth; **artifact-specific gate sets** select stages, but skipping multiplicity / leakage controls for search-generated Candidates is forbidden.

## Components

| Component | Role |
|-----------|------|
| Split Manager | Train/val/test and WF folds without leakage |
| Metric Engine | Task + economic metrics |
| Cost Model | Spread/commission |
| Slippage Model | Stress and base |
| Multiplicity Accountant | Family-wise search budget |
| Adversarial Runner | Devil’s advocate perturbations |
| Promotion Gate | Status transition only on pass |

## Rules

- Search-fit metrics are not Validation results.
- Pipeline outcomes are persisted with Candidate id + data versions.
