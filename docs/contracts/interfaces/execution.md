---
id: DOC-CONTRACT-IF-execution
title: Interface — execution
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: execution

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `submit` | OrderIntent | Execution | Reject,Timeout |
| `reconcile` | intent_id | Execution | — |

## Retry behavior
timeout → reconcile never blind resend

## Idempotency
client_order_id / intent_id

## Timeout
send timeout then UNKNOWN_NEEDS_RECONCILE

## Concurrency
serialize per instrument account

## Transaction boundary
local intent before send

## Observability
ORDER_SENT, ORDER_FILLED, ORDER_REJECTED

## Cancellation
cancel order when supported

## Versioning
execution schema

## Test double
PaperBroker
