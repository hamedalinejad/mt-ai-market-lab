---
id: DOC-VAL-022
title: Validation Architecture
status: reviewed
version: 0.5
phase: 0
domain: 15-validation
updated: 2026-09-04
---

# Validation Architecture

Pipeline: Train → Validation → OOS → Walk-Forward → Regime → Cost → Slippage → Replay → Stress → Adversarial → Promotion Gate

See also: decision-point-propagation, embargo-and-purging, nested-validation, statistical-uncertainty, cost-bundle.

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

