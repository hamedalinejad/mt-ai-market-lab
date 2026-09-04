---
id: DOC-OBS-005
title: Health Checks and Watchdog
status: reviewed
version: 0.4
phase: 0
domain: 23-observability
updated: 2026-09-04
---

# Watchdog (BUG-OPS-P0-005)

Health score inputs:

```text
MT5
data freshness
queue lag
disk
DB
model
validation state
execution
latency
```

Watchdog may trip circuit breakers → Safe Mode.
