---
id: DOC-CONTRACT-IF-strategy
title: Interface — strategy
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: strategy

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `on_signal` | Signal | OrderIntent|None | — |
| `on_bar` | context | OrderIntent|None | — |

## Retry behavior
—

## Idempotency
intent client_order_id unique

## Timeout
—

## Concurrency
per strategy instance

## Transaction boundary
does not touch broker

## Observability
—

## Cancellation
—

## Versioning
strategy version

## Test double
NoopStrategy
