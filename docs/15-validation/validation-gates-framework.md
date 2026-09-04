---
id: DOC-VAL-030
title: Validation Gates Framework
status: reviewed
version: 0.2
phase: 0
domain: 15-validation
---

# Gates Framework (B-006)

**Do not hard-lock “6 gates” or “7 gates”.**

Use an artifact-specific gate **set** versioned as `gate_set_id`.  
Promotion consumes a named gate_set; search-origin candidates cannot skip multiplicity/leakage gates.

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

