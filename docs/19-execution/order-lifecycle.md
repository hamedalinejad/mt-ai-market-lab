---
id: DOC-EXEC-019
title: Order Lifecycle
status: approved
version: 1.0
phase: 0
domain: 19-execution
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-RISK-001']
---

# Order Lifecycle

```text
CREATED → VALIDATED → SUBMITTED → ACKNOWLEDGED
  → REJECTED | CANCELLED | PARTIALLY_FILLED → FILLED → CLOSED
```

Broker-specific states map into this internal machine.
