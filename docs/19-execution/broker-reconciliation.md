---
id: DOC-EXEC-020
title: Execution Reconciliation
status: approved
version: 1.0
phase: 0
domain: 19-execution
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-EXEC-019']
---

# Required Reconciliation

```text
local intent
local expected state
broker order state
broker position state
actual fills
fees / spread / slippage
```

Restart must **not** duplicate an order if a previous response was not observed locally.

**Idempotent client order IDs** are required.

## Netting vs hedging
Execution layer must detect account model and broker semantics. No strategy may assume “open position” means the same thing across all account configurations.
