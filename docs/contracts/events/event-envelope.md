---
id: DOC-CONTRACT-EVT-envelope
title: Event Envelope
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# Event Envelope (binding)

```text
event_id
event_type
event_version
occurred_at_utc
availability_at_utc
correlation_id
causation_id
producer
producer_version
entity_type
entity_id
payload
payload_schema_version
severity
```

Immutable append-only once written. Used by observability, replay, recovery, audit.
