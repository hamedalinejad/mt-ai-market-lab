---
id: DOC-DISC-020
title: Symbolic Regression
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-006]
related: [DOC-DISC-008, DOC-DISC-009]
---

# Symbolic Regression

## Purpose

Search numeric expressions with interpretability constraints.

## Controls

- Maximum depth / length
- Operator set ⊆ Discovery Space whitelist
- Complexity penalty (e.g. length, unique ops)
- Numerical stability checks
- Runtime cost estimate per candidate
- Reproducibility: seed + data version + space version

## Output

Formula Candidates → shared Formula Discovery pipeline (OOS, WF, multiplicity, robustness).

## Rules

- Prevent formula explosion via hard caps and early pruning.
- Prefer Pareto front of fitness vs complexity for human review queues.
