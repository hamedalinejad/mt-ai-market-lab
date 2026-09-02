---
id: DOC-EXEC-001
title: Execution Architecture
status: draft
version: 0.2
phase: 0
domain: 19-execution
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RISK-001, ADR-0009]
related: [DOC-EXEC-002, DOC-EXEC-011, DOC-EXEC-015]
---

# Execution Architecture

## Path

```text
Signal → Strategy → Risk → Execution Eligibility
  → Order Preparation → Order Validation
  → Paper / Live → Execution → Reconciliation
```

## Idempotent Execution (mandatory)

Network loss after `order_send()` must not create double exposure.

Required identifiers and state:

```text
intent_id
client_order_id
broker_ticket
execution_state
reconciliation
```

### Required behavior

1. Create local **Order Intent** with unique `intent_id` / `client_order_id` before send.
2. Send order with that client id when the broker API supports it.
3. On timeout / disconnect: **do not** blindly resend; run **Execution Reconciliation** against MT5 orders/positions/deals.
4. Only create a new broker order if reconciliation proves the intent was never accepted.

## Forbidden

```text
timeout → order_send() again without reconcile
Prediction → order_send()
Discovery → order_send()
```

## Rules

- Execution is the only layer that submits broker orders (paper or live).
- Paper and Live share the same path above Simulated vs Broker execution.
