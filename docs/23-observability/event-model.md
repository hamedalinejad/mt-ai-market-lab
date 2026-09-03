---
id: DOC-OBS-001
title: Event Model
status: reviewed
version: 0.5
phase: 0
domain: 23-observability
---

# Event Schema

```text
event_id, event_type, timestamp, component, severity
trace_id, correlation_id, payload, version
```

## Minimum event types
DATA_RECEIVED, DATA_PUBLISHED, DATA_GAP, SYNC_STARTED, SYNC_FINISHED, SYNC_FAILED, MODEL_LOADED, MODEL_PROMOTED, MODEL_ROLLBACK, DISCOVERY_CREATED, DISCOVERY_REJECTED, SIGNAL_CREATED, RISK_DENIED, ORDER_SENT, ORDER_FILLED, ORDER_REJECTED, SYSTEM_SAFE_MODE
