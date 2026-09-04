---
id: DOC-PROJ-034
title: Architecture Baseline Language
status: reviewed
version: 0.2
phase: 0
---

# Language (B-020)

Prefer **logical architecture baseline** over “architecture locked.”

Technologies and numeric targets remain Candidate until Benchmark + ADR.

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

