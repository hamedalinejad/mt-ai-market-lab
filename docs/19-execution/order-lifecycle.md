---
id: DOC-EXEC-019
title: Order Lifecycle
status: reviewed
version: 0.2
phase: 0
domain: 19-execution
updated: 2026-09-04
---

# Order Lifecycle (BUG-TRD-P0-005)

```text
NEW → SENT → ACK → PARTIAL → FILLED

NEW → SENT → REJECTED

NEW → SENT → REQUOTE → RESUBMITTED | ABORTED
```

Also: CANCELLED, EXPIRED, UNKNOWN_NEEDS_RECONCILE.
