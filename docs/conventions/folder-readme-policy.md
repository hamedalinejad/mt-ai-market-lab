---
id: DOC-CONV-009
title: Folder README Policy
status: reviewed
version: 0.2
phase: 0
domain: conventions
---

# Folder README (B-004)

Every top-level `docs/NN-*` folder **must** contain `README.md` describing purpose and pointers to contracts.

Enforced by documentation hygiene review before Phase 0 close.

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

