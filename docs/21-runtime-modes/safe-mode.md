---
id: DOC-RUN-009
title: Safe Mode Operational Contract
status: reviewed
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
