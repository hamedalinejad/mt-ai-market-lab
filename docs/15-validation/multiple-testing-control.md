---
id: DOC-VAL-014
title: Multiple Testing Control
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022]
related: [DOC-DISC-010, DOC-VAL-003]
---

# Multiple Testing Control

## Purpose

If the system tries enough hypotheses, some will look excellent by chance (e.g. Sharpe ≈ 4 under 1e6 draws). Multiple testing control is **P0** for Discovery-origin Candidates.

## Required Accounting (per search program)

| Concept | Role |
|---------|------|
| Experiment Count | How many evaluated Candidates/tests |
| Hypothesis Family | Group sharing data/methodology |
| Search Budget | Max evaluations allowed / consumed |
| Multiple Testing Correction | e.g. Bonferroni, Holm, BH-FDR — method recorded |
| False Discovery Control | Target FDR/FWER policy |
| Holdout | Untouched final slice |
| Nested Validation | Inner search vs outer eval separation |
| Deflated Sharpe | Haircut for selection bias / non-normality (when Sharpe used) |
| Probability of Backtest Overfitting (PBO) | When strategy backtests are selected among many |

Exact formulas are parameterised; **recording and applying a declared method is mandatory**.

## Rules

- Discovery runs without multiplicity metadata are invalid for Promotion.
- Family-wise error tracked across related Experiment Lab campaigns.
- “Best of search” metric must not be reported as unbiased performance.
