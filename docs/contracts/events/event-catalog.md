---
id: DOC-CONTRACT-EVT-catalog
title: Event Catalog
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# Event Catalog

See specialized files. Core types include:

DATA_RECEIVED, DATA_PUBLISHED, DATA_GAP, SYNC_STARTED, SYNC_FINISHED, SYNC_FAILED,
MODEL_LOADED, MODEL_PROMOTED, MODEL_ROLLBACK, DISCOVERY_CREATED, DISCOVERY_REJECTED,
SIGNAL_CREATED, RISK_DENIED, ORDER_SENT, ORDER_FILLED, ORDER_REJECTED, SYSTEM_SAFE_MODE

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

