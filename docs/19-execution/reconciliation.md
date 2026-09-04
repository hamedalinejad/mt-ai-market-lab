---
id: DOC-EXEC-011
title: Execution Reconciliation
status: draft
version: 0.2
phase: 0
domain: 19-execution
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-EXEC-001, ADR-0009]
related: [DOC-EXEC-010, DOC-EXEC-012]
---

# Execution Reconciliation

## Purpose

**P0 after every execution attempt** (paper or live). Network loss after `order_send()` must not create duplicate trades.

## Reconcile Path

```text
Local Intent
      ↓
MT5 Order
      ↓
Broker Result
      ↓
Positions
      ↓
Deals
      ↓
Local State
```

## MT5 API surfaces (reference)

- `order_send`
- `orders_get`
- `positions_get`
- `history_orders_get`
- `history_deals_get`

## Required identifiers

```text
intent_id
client_order_id
broker_ticket
execution_state
```

## Required behavior on uncertainty

```text
timeout / disconnect
       ↓
reconcile against orders / positions / deals
       ↓
if intent not accepted → may send once under same client_order_id policy
if intent accepted → bind ticket; do not create a second order
```

## Rules

- Idempotent execution is mandatory.
- Paper mode reconciles against the **simulator books** with the same state machine.

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

