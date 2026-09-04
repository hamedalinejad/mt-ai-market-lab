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

