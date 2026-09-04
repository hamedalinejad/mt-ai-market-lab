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

