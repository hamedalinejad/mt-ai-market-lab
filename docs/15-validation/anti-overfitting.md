---
id: DOC-VAL-003
title: Anti-Overfitting
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-014, DOC-DISC-010]
related: [DOC-VAL-013, DOC-VAL-024]
---

# Anti-Overfitting

## Purpose

Counteract complexity-driven and search-driven overfit.

## Mechanisms

1. Complexity caps at Discovery time  
2. Penalized discovery_score  
3. Strict train/search vs eval separation  
4. Walk-forward  
5. Multiple-testing corrections  
6. Adversarial / perturbation tests  
7. Regime stability requirements  
8. Deflated metrics / PBO where applicable  

## Rules

- High in-sample fitness with high complexity is a **reject signal**, not a trophy.

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

