---
id: DOC-DATA-QUALITY-SM
title: Data Quality State Machine
status: approved
version: 1.0
phase: 0
domain: 03-market-data
created: 2026-09-04
updated: 2026-09-04
---

# Data Quality State Machine

```text
RECEIVED → VALIDATING → REJECTED | QUARANTINED | ACCEPTED → PUBLISHED
Published may later: SUSPECT | REPAIRED | REVISED | SUPERSEDED
```

Quality controls downstream eligibility:

- `quality != OK` → excluded from promotable training unless explicitly allowed
- unresolved gap in decision window → no promotable signal
- incomplete derived candle → not `CANDLE_CLOSED`
