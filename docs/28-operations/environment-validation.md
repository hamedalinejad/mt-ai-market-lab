---
id: DOC-OPS-006
title: Environment Validation
status: draft
version: 0.2
phase: 0
domain: 28-operations
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-OPS-001]
---

# Environment Validation

Startup reports:

```text
Python OK | MT5 OK | Database OK | Disk OK | RAM OK | Model OK | Data OK
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

