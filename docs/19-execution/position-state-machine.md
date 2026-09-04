---
id: DOC-EXEC-018
title: Position State Machine
status: reviewed
version: 0.2
phase: 0
domain: 19-execution
updated: 2026-09-04
---

# Position State Machine (BUG-TRD-P0-004)

```text
FLAT → OPENING → PARTIAL → OPEN → REDUCING → CLOSING → CLOSED
                              ↘ RECONCILE_REQUIRED
```

`RECONCILE_REQUIRED` after uncertainty (crash, timeout, broker mismatch).
