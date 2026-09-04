---
id: DOC-CONTRACT-DATA-order-intent
title: Data Contract — Order Intent
status: reviewed
version: 0.8
phase: 0
domain: contracts
updated: 2026-09-04
---

# Order Intent + Idempotency (BUG-TRD-P0-006)

```text
intent_id
client_order_id
broker_ticket?
parent_intent_id?
created_at
expires_at
signal_id
strategy_id
risk_decision_id
instrument
side
size
execution_state
```

Same `intent_id` / `client_order_id` must not create a second broker order.

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

