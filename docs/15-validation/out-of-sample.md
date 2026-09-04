---
id: DOC-VAL-016
title: Out-of-Sample
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022]
related: [DOC-VAL-024, DOC-VAL-014]
---

# Out-of-Sample

## Purpose

Hold out data not used for search or fitting.

## Rules

- Search/Discovery must not touch final holdout.
- Nested design: inner optimization vs outer OOS.
- Report OOS with multiplicity context when Candidate was search-selected.

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

