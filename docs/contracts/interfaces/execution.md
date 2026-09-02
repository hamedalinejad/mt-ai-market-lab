---
id: DOC-CONTRACT-IF-execution
title: Interface — ExecutionEngine
status: draft
version: 0.2
phase: 0
domain: contracts
---

# ExecutionEngine

## Methods
- `submit(intent) -> Execution` (idempotent on client_order_id)
- `reconcile(intent_id) -> Execution`
- paper | live modes
