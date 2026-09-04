---
id: DOC-DB-002
title: Database Migration Contract
status: reviewed
version: 0.2
phase: 0
domain: 33-database-schema
---

# Migration Contract

Naming: `NNN_short_description.sql` (monotonic).

migration_metadata: name, checksum, applied_at, author, precondition, postcondition, status.

Policies: forward-only prod; rollback via forward-fix; idempotent re-apply; migration lock; **backup before migrate**; failure → restore or approved forward-fix.

Codes: MIG_LOCK_HELD, MIG_CHECKSUM_MISMATCH, MIG_PRECONDITION_FAIL, MIG_APPLY_FAIL, MIG_POSTCONDITION_FAIL

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

