---
id: DOC-PATH-19-EXECUTION-EXECUTION-BOUNDARY-MD
title: Execution Boundary
status: draft
version: 0.2
phase: 0
domain: 19-execution
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-EXEC-001]
related: [DOC-EXEC-011, DOC-RISK-001]
---

# Execution Boundary

## Allows

- Paper execution
- Controlled live execution (later phases)
- Order validation
- Execution reconciliation

## Forbids

- Direct Prediction → Order
- Direct Discovery → Order
- Strategy bypass of Risk
- Blind resend of orders without reconcile

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

