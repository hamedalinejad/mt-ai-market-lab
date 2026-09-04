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
