---
id: DOC-EXEC-002
title: Execution Boundary
status: draft
version: 0.2
phase: 0
domain: 19-execution
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-EXEC-001]
related: [DOC-EXEC-011, DOC-RISK-001]
---

# Execution Boundary

## Allows

- Paper execution
- Controlled live execution (later phases)
- Order validation
- Execution reconciliation

## Forbids

- Direct Prediction → Order
- Direct Discovery → Order
- Strategy bypass of Risk
- Blind resend of orders without reconcile
