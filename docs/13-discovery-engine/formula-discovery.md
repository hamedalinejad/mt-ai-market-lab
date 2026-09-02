---
id: DOC-DISC-008
title: Formula Discovery
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-006, DOC-DISC-020]
related: [DOC-DISC-011, DOC-VAL-001, DOC-EXPL-001]
---

# Formula Discovery

## Purpose

Search for **explainable numeric relations** (formula Candidates), not merely instantiate classic indicators.

## Pipeline

```text
Discovery Space
      ↓
Expression Search (symbolic / GP / constrained search)
      ↓
Candidate Formula
      ↓
Complexity Penalty + Novelty filter
      ↓
Preliminary metrics on train window
      ↓
Experiment Lab design
      ↓
Out-of-Sample
      ↓
Walk-Forward
      ↓
Multiple Testing Control
      ↓
Robustness / Adversarial
      ↓
Candidate (still not Truth) → optional Knowledge promotion only via gates
```

## What Is Insufficient

Only shipping fixed:

```text
RSI, MACD, ATR, EMA, SMA
```

as “discovery” fails the project goal. Those may exist as **Level-1 known indicators** in knowledge/taxonomy; Discovery must still search the space above.

## Candidate Payload

- Expression AST / string with registered operators
- Seed, space version, dataset version
- Complexity score, runtime cost estimate
- Train metrics (non-promotional)
- Lineage to search run

## Rules

- No promotion without Validation Framework gates.
- Rejected formulas are stored (negative knowledge / memory).
