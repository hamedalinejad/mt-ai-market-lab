---
id: DOC-OPS-011
title: Local Security Baseline
status: reviewed
version: 0.2
phase: 0
domain: 28-operations
---

# Security (local-first)

```text
credentials outside git
config vs secret separation
local permissions
broker account identity clarity
order safety
emergency controls
audit trail
```

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

