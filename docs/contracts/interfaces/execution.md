---
id: DOC-CONTRACT-IF-execution
title: Interface — ExecutionEngine
status: draft
version: 0.2
phase: 0
domain: contracts
---

# Interface: ExecutionEngine

## Methods

submit(intent), cancel, reconcile, get_state

## Idempotency

client_order_id / intent_id; timeout → reconcile not blind resend
