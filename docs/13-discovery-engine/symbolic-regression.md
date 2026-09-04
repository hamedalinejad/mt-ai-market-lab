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
related: [DOC-DISC-009, DOC-DISC-008]
---

# Symbolic Regression

## Purpose

**Separate tool** from Genetic Programming.

### Goal

```text
find f(X) → Y
```

Recover an interpretable numeric mapping from features/representation inputs `X` to a target `Y` (e.g. next return, direction score, range), under complexity and stability constraints.

## Non-Goals

- Evolving full trading strategies or multi-rule policies (that is closer to GP / strategy search)
- Unbounded expression growth

## Method Role

Symbolic regression explores the **formula subspace** of Discovery Space: algebraic/temporal expressions with ranked complexity.

## Controls

- Max depth / token length
- Operator whitelist
- Complexity penalty in scoring
- Numerical validity
- Train-only fitness; all promotion via Validation pipeline

## Relationship to GP

| | Symbolic Regression | Genetic Programming |
|--|---------------------|---------------------|
| Primary goal | `f(X)→Y` expressions | Evolve expressions **or** rules **or** strategy structures |
| Output shape | Formula / feature | Broader genotype (rules, trees, graphs) |
| Shared | Same space versioning, scoring penalties, Validation gates |

They **must not** be merged into one vague “evolutionary discovery” concept in specs or code modules.

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

