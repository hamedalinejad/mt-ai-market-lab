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
related: [DOC-DISC-011, DOC-VAL-001, DOC-KNOW-001]
---

# Formula Discovery

## Purpose

Search explainable formulas; every Candidate stores a full **explainability payload**.

## Stored Discovery Record

```text
Discovery ID
Expression
Operators
Inputs
Complexity
Training Score
Validation Score
OOS Score
Regime Stability
Turnover
Failure Modes
Novelty Score
```

Plus: search seed, space version, dataset version, cost_bundle_id when economically evaluated.

## Pipeline

```text
Discovery Space → Expression Search → Candidate Formula
  → Complexity / Novelty filters → Experiment Lab
  → OOS / Walk-Forward / Multiple Testing / Robustness
  → Candidate (≠ Truth) → optional Knowledge graph node
```

## Rules

- Expression AST/string is mandatory; opaque weight blobs alone are insufficient for formula discovery claims.
- Rejected discoveries remain as negative graph nodes / memory.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

