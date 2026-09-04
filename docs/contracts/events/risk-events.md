---
id: DOC-CONTRACT-EVT-risk-events
title: Events — risk-events
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# risk-events

Events under prefix `RISK_*` use the standard [event-envelope](event-envelope.md).

Payload schemas versioned per event_type. Producers must set correlation_id/causation_id for trace chains.

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

