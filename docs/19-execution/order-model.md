---
id: DOC-EXEC-003
title: Order Model
status: draft
version: 0.2
phase: 0
domain: 19-execution
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-EXEC-001]
related: [DOC-EXEC-011]
---

# Order Model

## Purpose

Idempotent order intent for paper and live.

## Required identifiers

```text
intent_id
client_order_id
broker_ticket          # when known
execution_state
```

## Execution states (logical)

```text
INTENT_CREATED
VALIDATED
SENT
ACCEPTED
REJECTED
PARTIAL
FILLED
CANCELLED
UNKNOWN_NEEDS_RECONCILE
RECONCILED
```

## Rules

- On `UNKNOWN_NEEDS_RECONCILE`, forbid blind resend.
- Bind `broker_ticket` from positions/orders/deals during reconciliation.
