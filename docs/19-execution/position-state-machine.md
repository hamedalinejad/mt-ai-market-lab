---
id: DOC-EXEC-018
title: Position State Machine
status: reviewed
version: 0.2
phase: 0
domain: 19-execution
updated: 2026-09-04
---

# Position State Machine (BUG-TRD-P0-004)

```text
FLAT → OPENING → PARTIAL → OPEN → REDUCING → CLOSING → CLOSED
                              ↘ RECONCILE_REQUIRED
```

`RECONCILE_REQUIRED` after uncertainty (crash, timeout, broker mismatch).

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

