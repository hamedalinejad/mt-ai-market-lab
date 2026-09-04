---
id: DOC-CONV-005
title: Document Status Model
status: reviewed
version: 0.4
phase: 0
domain: conventions
updated: 2026-09-04
---

# Status Lifecycle (BUG-REPO-P0-001)

```text
draft → reviewed → approved → implemented → verified → deprecated
```

**P0 coding starts only after `approved`.**  
File existence ≠ specification complete.

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

