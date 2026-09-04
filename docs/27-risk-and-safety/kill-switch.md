---
id: DOC-PATH-27-RISK-AND-SAFETY-KILL-SWITCH-MD
title: Kill Switch
status: reviewed
version: 0.4
phase: 0
domain: 27-risk-and-safety
updated: 2026-09-04
---

# Kill Switch (B-034)

Independent of model/feature/discovery failures.

## State machine (binding)
ARMABLE → ARMED → TRIGGERED → HALTED → (authorized) RESET

## Policy numbers
Thresholds (e.g. daily loss %) are **Candidate policy parameters** in `policy_version` — not hard-coded magic in architecture prose.

Must define: account scope, session scope, realized vs unrealized, reset authorization, audit trail, fail-safe default **HALT**.

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

