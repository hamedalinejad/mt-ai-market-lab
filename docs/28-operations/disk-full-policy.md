---
id: DOC-OPS-010
title: Disk Full Policy
status: reviewed
version: 0.2
phase: 0
domain: 28-operations
updated: 2026-09-04
---

# Disk Full — first-class failure (BUG-OPS-P0-004)

Behavior:

```text
stop canonical publish
preserve raw if possible
set SAFE / DEGRADED state
do not advance cursor
alert
resume only after validated free-space recovery
```
