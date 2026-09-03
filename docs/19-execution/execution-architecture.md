---
id: DOC-EXEC-001
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
