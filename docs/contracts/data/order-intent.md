---
id: DOC-CONTRACT-DATA-order-intent
title: Order Intent Contract
status: approved
version: 1.0
phase: 0
domain: contracts
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-CONTRACT-DATA-risk-decision']
---

# Order Intent

```text
intent_id, client_order_id, broker_ticket?,
signal_id, strategy_id, risk_decision_id,
instrument, side, size, price?, stop?, take_profit?,
execution_state, created_at, expires_at
```

Same `intent_id` / `client_order_id` must not create a second broker order.
