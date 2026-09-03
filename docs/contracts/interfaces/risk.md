---
id: DOC-CONTRACT-IF-risk
title: Interface — risk
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: risk

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `evaluate` | OrderIntent | RiskDecision | — |

## Retry behavior
—

## Idempotency
decision logged once per intent evaluation id

## Timeout
strict low latency

## Concurrency
thread-safe policy eval

## Transaction boundary
read account/position snapshots

## Observability
RISK_DENIED

## Cancellation
—

## Versioning
policy_version

## Test double
AllowAllRisk / DenyAllRisk
