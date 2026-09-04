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

