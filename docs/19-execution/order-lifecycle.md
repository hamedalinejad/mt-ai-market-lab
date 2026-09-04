---
id: DOC-EXEC-019
title: Order Lifecycle
status: reviewed
version: 0.2
phase: 0
domain: 19-execution
updated: 2026-09-04
---

# Order Lifecycle (BUG-TRD-P0-005)

```text
NEW → SENT → ACK → PARTIAL → FILLED

NEW → SENT → REJECTED

NEW → SENT → REQUOTE → RESUBMITTED | ABORTED
```

Also: CANCELLED, EXPIRED, UNKNOWN_NEEDS_RECONCILE.

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

