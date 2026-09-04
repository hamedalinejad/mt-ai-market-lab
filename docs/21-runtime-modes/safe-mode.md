---
depends_on: ['DOC-RISK-001']
id: DOC-RUN-009
title: Safe Mode Operational Contract
status: approved
version: 0.6
phase: 0
domain: 21-runtime-modes
updated: 2026-09-04
---

# Safe Mode — operational contract (BUG-OPS-P0-001)

| Capability | Safe Mode |
|------------|-----------|
| MT5 health | ON |
| data collection | ON |
| data quality | ON |
| historical sync | LIMITED / ON |
| prediction | OFF |
| learning | OFF |
| discovery | OFF |
| signals | OFF |
| trading | OFF |

Triggers include data corruption, model health failure, repeated execution failure, disk full, memory pressure, sync inconsistency, unexpected restart.

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

