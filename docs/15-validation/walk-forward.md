---
id: DOC-VAL-024
title: Walk-Forward
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022]
related: [DOC-VAL-016, DOC-VAL-003]
---

# Walk-Forward

## Purpose

Evaluate stability across sequential train→test windows without peeking.

## Requirements

- Fold scheme versioned
- No feature from future folds
- Aggregation of fold metrics with dispersion, not only mean
- Interaction with regime labels when available

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

