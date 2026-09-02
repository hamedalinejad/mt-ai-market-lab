---
id: DOC-OBS-001
title: Event Model
status: draft
version: 0.2
phase: 0
domain: 23-observability
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-OBS-002]
related: [DOC-OPS-001, DOC-SIG-012]
---

# Event Model

## Purpose

Important system changes are **events**, not only log lines.

## Example Event Types

```text
DATA_INGESTED
DATA_GAP_FOUND
SYNC_STARTED
SYNC_COMPLETED
MODEL_LOADED
MODEL_REJECTED
DISCOVERY_FOUND
DISCOVERY_REJECTED
SIGNAL_CREATED
SIGNAL_EXPIRED
RISK_DENIED
ORDER_SENT
ORDER_FILLED
ORDER_FAILED
MODEL_UPDATED
MODEL_ROLLBACK
```

## Payload (minimum)

```text
event_id, event_type, timestamp_utc
severity, source_component
correlation_ids (run_id, signal_id, model_version, …)
payload (structured)
```

## Rules

- Material Signal/Order/Model transitions must emit events.
- Events feed observability and audit; they complement Signal Trace.
