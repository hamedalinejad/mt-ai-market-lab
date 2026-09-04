---
id: DOC-PATH-19-EXECUTION-EXECUTION-ARCHITECTURE-MD
title: Execution Architecture
status: reviewed
version: 0.5
phase: 0
domain: 19-execution
---

# Execution P0

## Path
Intent → Risk → submit (paper/live) → reconcile

## Idempotency keys
intent_id, client_order_id, broker_ticket

## Reconciliation
Local vs broker: orders, positions, deals, account state.

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

