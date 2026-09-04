---
id: DOC-CONTRACT-DATA-outcome
title: Data Contract — Outcome
status: reviewed
version: 0.8
phase: 0
domain: contracts
---

# Outcome (linked, separate)

```text
outcome_id
subject_type            # prediction | signal | …
subject_id              # e.g. prediction_id
realized_metrics
evaluated_at
```

Immutable link for audit and learning. Prediction row stays unchanged.

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

