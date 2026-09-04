---
id: DOC-EXEC-020
title: Broker Reconciliation
status: reviewed
version: 0.2
phase: 0
domain: 19-execution
updated: 2026-09-04
---

# Broker Reconciliation (BUG-TRD-P0-007)

Periodic + **on startup after crash**.

Local state is **not** assumed truth. Broker (or paper simulator books) is authoritative external state for orders, positions, deals, account — then reconcile into local control plane.

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

