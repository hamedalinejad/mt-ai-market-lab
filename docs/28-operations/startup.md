---
id: DOC-OPS-001
title: Startup
status: draft
version: 0.2
phase: 0
domain: 28-operations
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001]
related: [DOC-OPS-002, DOC-SYNC-013, DOC-OBS-001]
---

# Startup

## Not Allowed

```text
start → run
```

## Recovery-Aware Sequence

```text
Environment Check
 ↓
Storage Check
 ↓
Database Recovery
 ↓
MT5 Connection
 ↓
Symbol Verification
 ↓
Data Health
 ↓
Sync
 ↓
Model Load
 ↓
Model Health
 ↓
Live Mode
```

## Crash-Safe Continuity

Reload `sync_state.last_persisted_*` and resume Live/Backfill from durable cursors only.

## Rules

- Fail closed on integrity/storage check failures.
- Emit startup events to the immutable event log.
